# adb-perfetto-fps-monitor

Command-line FPS validation tool for Android that uses **adb** and **Perfetto** to measure **actual (displayed)** and **scheduled (expected)** FPS from **SurfaceFlinger frame timelines**.

This tool reports the FPS that **actually reaches the device screen**, not engine-reported or overlay-based values.

---

## Important notes / warnings

- ⚠️ **Tested only on some Redmi devices**
- ⚠️ **This is NOT an Android app**
- ⚠️ Uses **adb console only** to analyze **system tracing logs**
- ⚠️ Measures **real display FPS**, not refresh rate
- ✅ **No root required**
- ❌ Not a live overlay or in-game FPS counter

---

## What it does

- Reports **Actual FPS (A)** → frames that were actually presented on screen
- Reports **Expected FPS (D)** → frame presentation cadence scheduled by the system
- Uses Android’s official tracing stack (**Perfetto + SurfaceFlinger**)
- Works externally via adb (no app integration, no overlays)

Example output:
```
A: 30.93 | D: 30.93
```

---

## How it works (brief)

1. Perfetto records system traces (`gfx`, `view`, `wm`, `am`, `sched`)
2. SurfaceFlinger frame timeline data is captured
3. SQL analysis computes actual vs expected FPS
4. Output is printed every trace window (default: 5s)

This reflects **what the user actually sees on the display**.

---

## Requirements

- Android 11+ device
- adb
- Perfetto (`trace_processor_shell`)
- Windows (batch script provided, Linux users can adapt) 

---

## Usage

1. Enable USB debugging
2. Connect device via adb
3. Run:

```bat
fps_loop.bat
```

---

## Interpretation

- **A ≈ D** → stable frame pacing
- **A < D** → missed frames / performance issues
- **A = 0** → no frames produced (idle UI)

---

## License

MIT License
