# Custom Aquarium Light — Build Plan

DIY addressable RGBW light for the 6-gallon shrimp tank, replacing the SEAOURA clip-on.

---

## Design Overview

```
[ Pi (remote room) ]  --WiFi-->  [ ESP32 (at tank) ]  --data-->  [ SK6812 RGBW strip in aluminum channel ]
        |                               |                                    |
   CLI / scheduler              WLED firmware                      Flat on glass lid
   (tank-light tool)            REST API on LAN                    Frosted diffuser
```

- **ESP32** runs WLED firmware — handles LED driving, exposes a REST/JSON API over WiFi
- **Pi** runs a `tank-light` CLI tool that talks to WLED's API — this is the primary interface
- **Claude** invokes the CLI remotely on the Pi to control the light
- No second Pi needed — ESP32 handles the local hardware, Pi handles the brains

### Why WLED?

- Mature, well-tested SK6812 RGBW support
- Full REST API (JSON) — perfect for CLI-first control
- Supports per-LED color/brightness (enables gaussian curves)
- Presets, segments, transitions built in
- OTA firmware updates over WiFi
- Avoids writing custom embedded firmware

---

## Bill of Materials

### Electronics

| # | Item | Est. Price | Notes |
|---|------|--------:|-------|
| 1 | ESP32-WROOM-32 dev board (e.g. ESP32-DevKitC) | ~$10 | WiFi built in, USB for flashing |
| 2 | SK6812 RGBW LED strip, 60 LEDs/m, IP65, 1m | ~$12 | Cut to ~30cm (18 LEDs). IP65 for splash resistance |
| 3 | 5V 2A power supply (barrel jack or USB-C) | ~$9 | 18 LEDs x 60mA = 1.08A max. 2A gives headroom |
| 4 | Aluminum LED channel + frosted diffuser, 0.5m | ~$6 | Cut to 11.5". ~17mm wide x 7mm tall — very slim |
| 5 | SN74HCT125 level shifter (or similar 3.3V->5V) | ~$2 | ESP32 is 3.3V logic, SK6812 wants 5V data |
| 6 | 1000uF electrolytic capacitor | ~$1 | Across 5V/GND near strip, smooths inrush |
| 7 | 470 ohm resistor | ~$0.50 | In series with data line, protects first LED |
| 8 | JST-SM connectors (3-4 pin) | ~$3 | Quick disconnect between strip and controller |
| 9 | Wire (22 AWG silicone), solder, heat shrink | ~$5 | Silicone wire is flexible and heat resistant |
| 10 | Small project box / enclosure for ESP32 | ~$4 | Keeps it tidy, mounts behind or beside the tank |
| | **Parts subtotal** | **~$53** | |

### Tools (buy fresh)

| Item | Est. Price | Notes |
|------|--------:|-------|
| Soldering iron kit (temp adjustable, with tips + stand) | ~$25 | Pinecil or similar budget adjustable iron |
| Multimeter (basic digital) | ~$15 | For continuity, voltage checks |
| Wire strippers | ~$8 | |
| Helping hands / PCB holder (optional) | ~$10 | Makes soldering connectors easier |
| **Tools subtotal** | **~$58** | |

**Total: ~$110** (~$53 parts + ~$58 tools). Tools are a one-time buy. Parts alone are reasonable for what this delivers vs. a $60-80 commercial smart light with less control.

---

## Hardware Assembly

### Phase H1: Prep

- [ ] Flash WLED onto the ESP32 via USB before wiring anything up
  - Use [WLED web installer](https://install.wled.me/) — browser-based, no IDE needed
  - Configure: WiFi credentials, LED type = SK6812 RGBW, LED count = 18 (adjust after measuring), GPIO pin (default 16)
  - Confirm it connects to your WiFi and you can reach the WLED web UI from the Pi

### Phase H2: LED Strip

- [ ] Measure the glass lid — confirm how many LEDs fit (60/m = ~1 LED per 16.7mm)
- [ ] Cut the strip at the nearest cut mark to fit the aluminum channel
- [ ] Solder or connect JST pigtails to the strip's input end (DIN, 5V, GND)
- [ ] Seat the strip in the aluminum channel, attach the frosted diffuser cap
- [ ] Cut the aluminum channel to length (hacksaw or rotary tool)

### Phase H3: Wiring

```
5V PSU ──┬── 1000uF cap ──┬── Strip 5V
         │                 │
         └── ESP32 VIN     └── Strip GND ── PSU GND
                                    │
ESP32 GPIO16 ── 470R ── SN74HCT125 ── Strip DIN
                         (3.3V→5V)
```

- [ ] Wire the level shifter: ESP32 3.3V to OE+VCC on shifter, GPIO16 through 470R to input, output to strip DIN
- [ ] Wire power: 5V PSU to strip 5V/GND and to ESP32 VIN/GND
- [ ] Solder the 1000uF cap across 5V/GND near the strip input
- [ ] Use JST connectors so the strip disconnects from the controller box easily
- [ ] Test with WLED — all LEDs should respond

### Phase H4: Enclosure & Mounting

- [ ] Mount ESP32 + level shifter + capacitor in the project box
- [ ] Route power cable in, JST connector out to the strip
- [ ] Position the aluminum channel on the glass lid (silicone feet or small rubber bumpers to keep it in place without adhesive — removable for maintenance)
- [ ] Route the JST cable from the lid down to the enclosure (can sit behind or beside the tank)

---

## Software

### On the ESP32

WLED handles everything. No custom firmware to write. Key API endpoints:

- `GET /json/state` — current state (on/off, brightness, segments, colors)
- `POST /json/state` — set state (color, brightness, per-LED arrays, presets, transitions)
- `GET /json/info` — device info, LED count, signal strength

### On the Pi: `tank-light` CLI

Python CLI tool in this repo. Talks to WLED's JSON API over HTTP.

#### Commands

```
tank-light on                       # turn on, restore last state
tank-light off                      # turn off (soft, preserves state)
tank-light status                   # show current state (on/off, color, brightness, preset)

tank-light brightness <0-255>       # set brightness
tank-light color <r> <g> <b> [w]    # set uniform color (0-255 each)
tank-light kelvin <2700-6500>       # set color temperature (maps to RGBW values)

tank-light preset <name>            # apply a named preset
tank-light preset list              # list available presets
tank-light preset save <name>       # save current state as a preset

tank-light gaussian [--peak <0-255>] [--sigma <float>]   # apply gaussian brightness curve
tank-light uniform                  # reset to uniform brightness

tank-light schedule show            # show current schedule
tank-light schedule set <file>      # load a schedule from YAML
tank-light schedule clear           # remove all scheduled transitions
```

#### Presets (defined in `light-presets.yml`)

```yaml
viewing:
  description: "Warm white for looking at the tank"
  kelvin: 4000
  brightness: 180
  gaussian: true

plant-growth:
  description: "Red/blue heavy for photosynthesis"
  color: [180, 30, 200, 40]   # R, G, B, W — heavy red and blue
  brightness: 220
  gaussian: true

moonlight:
  description: "Dim blue for nighttime"
  color: [0, 0, 40, 0]
  brightness: 30
  gaussian: true

dawn:
  description: "Soft warm ramp-up"
  kelvin: 2700
  brightness: 60
  gaussian: true

daylight:
  description: "Full spectrum midday"
  kelvin: 6500
  brightness: 255
  gaussian: true
```

#### Schedule (defined in `light-schedule.yml`)

```yaml
# Default daily schedule — all times in local timezone
schedule:
  - time: "06:30"
    preset: dawn
    transition: 30m      # 30-minute ramp from previous state

  - time: "07:30"
    preset: daylight
    transition: 20m

  - time: "10:00"
    preset: plant-growth
    transition: 10m

  - time: "14:00"
    preset: viewing
    transition: 10m

  - time: "20:00"
    preset: dawn
    transition: 30m      # sunset ramp-down

  - time: "21:00"
    preset: moonlight
    transition: 20m

  - time: "23:00"
    action: "off"
    transition: 15m      # fade to black
```

The scheduler runs as a systemd service on the Pi, executing transitions at the specified times. Transitions are handled by WLED's built-in transition support (smooth interpolation over the specified duration).

#### Gaussian Brightness Curve

For an 18-LED strip, the gaussian curve sets per-LED brightness with peak at center:

```
LED position:   0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17
Brightness %:  25 35 48 62 76 88 95 99 100 100 99 95 88 76 62 48 35 25
```

This is applied as a multiplier on top of the base brightness — color stays uniform, intensity falls off at the edges. Adjustable via `--sigma` (wider/narrower curve) and `--peak` (max brightness at center).

---

## Build Phases

| Phase | What | Depends On |
|-------|------|------------|
| **S1: CLI skeleton** | `tank-light` CLI with mock/sim mode (no hardware needed) | Nothing — can start now |
| **H1: Flash ESP32** | Flash WLED, join WiFi, verify API reachable from Pi | ESP32 arrives |
| **S2: CLI real mode** | Connect CLI to live WLED API, test all commands | S1 + H1 |
| **H2-H4: Build the light** | Strip, channel, wiring, enclosure, mount | Parts arrive |
| **S3: Presets & gaussian** | Implement preset system and gaussian curve | S2 + H2-H4 (need real LEDs to tune) |
| **S4: Scheduler** | systemd service for daily schedule, transition ramps | S3 |
| **S5: Integration** | Merge into tank operations — replace SEAOURA, tune presets to actual tank | S4 + tank running |

S1 can start immediately — no hardware needed. Everything else flows from parts arriving.

---

## Open Questions

- **Exact LED count:** Need to measure the lid and pick the cut mark. 18 is an estimate.
- **Power routing:** Does the tank area have a nearby outlet, or do we need to plan for a longer power cable / power strip?
- **Static IP or mDNS:** Should the ESP32 get a DHCP reservation (static IP) or use mDNS (`tank-light.local`) for the Pi to find it?
- **Dimming at low levels:** SK6812 can flicker at very low PWM. May need to test moonlight mode and adjust if needed.
- **Thermal:** Aluminum channel should be fine for 18 LEDs at moderate brightness, but worth checking temps after a few hours at full blast.
