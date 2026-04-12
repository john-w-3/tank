# Shrimp Tank

A 6-gallon Neocaridina shrimp tank build, documented like a software project.

**→ [Live site](https://john-w-3.github.io/tank/) · [Build wizard](https://john-w-3.github.io/tank/wizard.html)**

Phased delivery with exit criteria. 3D-modeled parts inventory. LEGO-style step-by-step build guide, sourced directly from `.scad` files in the repo. Raspberry Pi monitoring roadmap.

## Highlights

- **[Stand Assembly Wizard](https://john-w-3.github.io/tank/wizard.html)** — step-by-step build guide with tap-to-rotate 3D previews. Each step's 3D model is computed in the browser from the `.scad` source at request time, so the rendered wizard always matches the checked-in code with no build-time coupling. Uses the browser's native `CompressionStream('gzip')`, no external JS dependencies.
- **`scad2url.py`** — turns a `.scad` file into a shareable [openscad2](https://ochafik.com/openscad2/) playground URL, shortened via is.gd. Useful for sharing models over chat or mobile where pasting OpenSCAD source into a browser isn't practical.
- **`stand-model.scad`** — OpenSCAD model of the full 34" wooden stand, with pocket-hole joinery and a corner-notched shelf.

## Repo layout

```
index.md, wizard.html, _config.yml   Jekyll site (served via GitHub Pages)
steps/                               Source of truth for the build wizard:
                                     each step is a .md + matching .scad
stand-model.scad                     Full 3D model of the stand
stand-build-plan.md                  Cut list and build plan
orig/                                Archived earlier design iteration (14" stand)
scad2url.py                          Tool for generating playground links
notes/                               Supporting material (water chemistry, etc.)
```

## How the wizard stays in sync with the models

The wizard page is a single Jekyll template that iterates over `steps/*.md` (filtered by a `step_number` front-matter field) and renders each step's markdown. For each step, a small in-page script fetches the matching `.scad` file, gzips it, base64-encodes it, and builds a link to the OpenSCAD playground with the source embedded in the URL fragment. Editing a step is editing one markdown file and one OpenSCAD file in the same directory — everything else is derived.
