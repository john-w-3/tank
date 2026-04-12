#!/usr/bin/env python3
"""Turn a .scad file into a shareable ochafik.com/openscad2 URL.

Usage:  ./scad2url.py path/to/file.scad
Prints a short (is.gd) URL to stdout. If is.gd is unreachable, falls
back to the raw long URL. The fragment is gzip+base64 of a small JSON
state blob the playground restores on load.
"""
import base64, gzip, json, sys, pathlib, urllib.parse, urllib.request

BASE = "https://ochafik.com/openscad2/#"
UA = "Mozilla/5.0 (X11; Linux aarch64) scad2url/1.0"

def encode(scad_text: str) -> str:
    state = {
        "params": {
            "activePath": "/playground.scad",
            "sources": [{"path": "/playground.scad", "content": scad_text}],
            "features": ["lazy-union"],
            "exportFormat2D": "svg",
            "exportFormat3D": "stl",
        },
        "view": {
            "layout": {"mode": "single", "focus": "viewer"},
            "showAxes": True,
            "logs": False,
        },
    }
    blob = json.dumps(state, separators=(",", ":")).encode("utf-8")
    gz = gzip.compress(blob, mtime=0)
    return BASE + base64.b64encode(gz).decode("ascii")

def shorten(long_url: str) -> str:
    """Return an is.gd short URL, or the original if the service is unreachable."""
    api = "https://is.gd/create.php?format=simple&url=" + urllib.parse.quote(long_url, safe="")
    try:
        req = urllib.request.Request(api, headers={"User-Agent": UA})
        return urllib.request.urlopen(req, timeout=15).read().decode().strip()
    except Exception as e:
        print(f"# is.gd failed ({e}); returning long URL", file=sys.stderr)
        return long_url

if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("usage: scad2url.py <file.scad>")
    print(shorten(encode(pathlib.Path(sys.argv[1]).read_text())))
