# Shrimp Tank Setup Checklist

6-gallon Neocaridina tank with nerite snails.

---

## Phase 1: Equipment

### Tank & Hardware
- [x] Tank — Aqueon Frameless 6G cube (11.5×11.5×11.5") with partial glass cover
- [x] Heater — hygger Mini 50W submersible with digital controller + burn guard
- [ ] Thermometer — digital stick-on or submersible
- [ ] Sponge pre-filter — for the filter intake (keeps baby shrimp safe)

### Substrate & Hardscape
- [ ] Substrate — inert fine gravel or sand (Caribsea Peace River, black sand, etc.)
- [ ] Hardscape — a small piece of driftwood and/or a few rocks (optional but gives shrimp surfaces to graze and plants something to attach to)

### Water & Chemistry
- [ ] Salty Shrimp GH/KH+ (remineralizer for RO water)
- [ ] TDS meter (pen-style, cheap is fine)
- [ ] API Freshwater Master Test Kit (liquid drops — NOT strips)
- [ ] Seachem Prime (dechlorinator — needed if you ever top off with tap)
- [ ] Bucket or jug dedicated to water prep (never used with soap)

### Plants (all low-light, no CO2, no special substrate)
- [ ] Java moss — attach to hardscape, shrimp graze on it constantly
- [ ] Java fern — tie or glue to rock/driftwood, do not bury the rhizome
- [ ] Anubias nana — same as java fern, glue to hardscape
- [ ] Marimo moss ball (optional) — shrimp love rolling these around

### Food
- [ ] Shrimp King Complete (or similar — Hikari Shrimp Cuisine also good)
- [ ] Blanched vegetables work too (zucchini, spinach) — free supplemental food

---

## Phase 2: Tank Setup

Do these once you have all your equipment.

- [ ] Rinse substrate thoroughly (no soap, just water until it runs clear)
- [ ] Place substrate in tank — ~1 inch depth is plenty
- [ ] Arrange hardscape (driftwood, rocks)
- [ ] Fill tank with remineralized RO water
  - Target TDS: 150-200 ppm
  - Mix RO water with GH/KH+ in a separate container first
  - Target GH: 6-8, KH: 2-4
- [ ] Install heater — set to 72°F
- [ ] Install sponge filter + air pump
- [ ] Attach sponge pre-filter to intake
- [ ] Add plants — tie/glue to hardscape, don't bury rhizomes
- [ ] Turn everything on, verify flow and temp
- [ ] Let it run 24 hours, then test water parameters as a baseline

---

## Phase 3: Cycling (4-6 weeks)

The nitrogen cycle converts toxic ammonia → nitrite → nitrate. You MUST complete
this before adding any livestock. Skipping or rushing this is the #1 beginner mistake.

### Fishless Cycle Steps
- [ ] Add ammonia source to ~2 ppm
  - Options: pure ammonia drops (Dr. Tim's Ammonium Chloride), or a pinch of fish food left to decompose
  - Dr. Tim's is easier to dose precisely
- [ ] Test every 2-3 days with the API kit — log ammonia, nitrite, nitrate, pH
- [ ] Week 1-2: Ammonia stays high, nitrite at 0 — bacteria are colonizing
- [ ] Week 2-3: Ammonia starts dropping, nitrite spikes — it's working
- [ ] Week 3-5: Nitrite starts dropping, nitrate appears — almost there
- [ ] Cycle is COMPLETE when:
  - [ ] Dose 2 ppm ammonia
  - [ ] Ammonia reads 0 within 24 hours
  - [ ] Nitrite reads 0 within 24 hours
  - [ ] Nitrate is present (some number > 0)
- [ ] Do a large water change (~50%) to bring nitrate down before stocking

### Tips
- Never let the tank fully dry out or the filter stop running — bacteria die
- Driftwood may leach tannins (brown water) — harmless, some say beneficial
- If cycle stalls past 6 weeks, check pH isn't below 6.0 (bacteria slow down)
- Beneficial bacteria products (Fritz TurboStart 700) can speed things up but aren't required

---

## Phase 4: Stocking

Only after the cycle is fully complete and parameters are stable.

- [ ] Day before: test all parameters, confirm cycle is complete
- [ ] Prepare the tank — make sure temp is 70-74°F, TDS 150-200
- [ ] Buy livestock:
  - [ ] 10-15 Neocaridina (pick one color variety to start — red cherry is classic)
  - [ ] 1-2 Nerite snails
- [ ] Drip acclimate shrimp over 1-2 hours
  - Float bag 15 min to equalize temp
  - Then drip tank water into the bag slowly (~2-3 drops/sec)
  - Double the water volume, discard half, repeat once
  - Net shrimp into tank — do NOT dump bag water in
- [ ] Leave the light off for the first few hours — let them explore calmly
- [ ] Don't feed for the first 24 hours — biofilm in an established tank is enough
- [ ] Watch for the first few days — some hiding is normal

---

## Phase 5: Ongoing Maintenance

### Weekly
- [ ] Test parameters: ammonia, nitrite, nitrate, GH, KH, TDS
- [ ] Water change — 10-20% weekly with remineralized RO water
  - Always match TDS and temperature to the tank
  - Use a turkey baster or small siphon to spot-clean substrate
- [ ] Top off evaporation with plain RO water (evaporation removes water, not minerals)
- [ ] Clean glass if needed (a credit card works as a scraper)

### Feeding
- Feed sparingly — a tiny amount every other day is plenty for a small colony
- Shrimp graze on biofilm constantly; they don't need much supplemental food
- Remove uneaten food after 2-3 hours
- Blanched veggies once a week as a treat

### Watch For
- **Molting** — normal, looks like a dead shrimp but it's just the shell. Leave it, they eat it for calcium
- **Berried females** — carrying eggs under their tail. Don't disturb them. Babies are self-sufficient at birth
- **White ring of death** — white band around the body behind the head = molting failure, usually a GH issue
- **Lethargy/deaths** — check parameters immediately, especially ammonia and TDS

---

## Future: IoT Monitoring (Phase 6)

Ideas for the Raspberry Pi integration:
- [ ] Temperature sensor (DS18B20 waterproof probe) — continuous logging + alerts
- [ ] TDS sensor — automated parameter tracking
- [ ] pH probe — more advanced, needs calibration
- [ ] Auto top-off system (float valve + pump)
- [ ] Camera module — timelapse / remote viewing
- [ ] Dashboard — web UI for historical parameter graphs
- [ ] Alerting — push notifications for temp/parameter out of range
- [ ] Power outage detection + alerts

---

## Water Parameter Quick Reference

| Parameter | Target Range | Danger Zone |
|-----------|-------------|-------------|
| Temperature | 70-74°F | < 60°F or > 82°F |
| pH | 6.8-7.5 | < 6.0 or > 8.0 |
| Ammonia | 0 ppm | Any detectable amount |
| Nitrite | 0 ppm | Any detectable amount |
| Nitrate | < 20 ppm | > 40 ppm |
| GH | 6-8 dGH | < 4 or > 12 |
| KH | 2-4 dKH | < 1 or > 8 |
| TDS | 150-200 ppm | < 100 or > 300 |
