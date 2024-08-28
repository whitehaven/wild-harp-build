# wild-harp-build

My ardupilot-based Speedybee F405 Wing AtomRC Dolphin plane's software and CAD components.

## Build Log

### 2024-07-29

- adding the basic param dumps, already with my basic configuration, near ready to fly. No flights yet, by the way.
- added CAD (onshape) files I used to mount the FC to the baseplate. My one complaint is the flanges on the top portion came out too thin. That said, I have reefed on it a bit and I think it's sufficient. Would thicken if doing it again.

### 2024-08-01

- reversed incorrect pitch in radio per directions
- printed "aerodynamic" fpv camera mount (Avatar HD V1), fit is ok, a little too large so bends in ~1mm total when attached
- Reattached wings, reprogrammed servos successfully
- servo autotrim on

Nearing final build.

### 2024-08-17  - **Flight 001**

Finally took it out to fly. First launch with Autotakeoff didn't reach full throttle fast enough and soft-landed. No damage.

For second launch, I triggered Autotakeoff with a fake throw and then threw it. Climbed as expected and started to circle, but I didn't have FPV goggles running yet. Circle altitude was too low for surrounding trees. Fortunately no impacts, but flew out of LOS several times. Without ability to command higher circling altitude remotely, tried it in FBW-A. Handling was reasonable, but still no FPV. Without video or blackbox logging, I dropped a wing and crashed it nose-first. The battery slipped forward and smashed the VTX mount, forcefully disconnecting the antennas and camera. Incredibly, the VTX, camera, and antennas were undamaged and functional on bench testing save for lens coating scratches on the camera. The wood plate in the front section came loose as well. The flight controller, which was held down with VHB only to the foam, did dislodge but was not damaged. There was no damage to the electronics as far as I can tell. There was minor damage to the frontal empanage where the nose cone attaches, but this was glued back successfully.

#### Learning points

1. **The FPV should be started before launch.** Seems obvious in hindsight, but I felt in the moment that it was too much to do at once. It was certainly too much to do *in the air*.
1. **Circling height too low.** The circling height was set to 100m by default, which in retrospect seems quite appropriate given unpredictability of terrain. It would have been much easier to work on configuration and tuning from that altitude. I think I would have been able to get FPV on once the circling height was reached if it was great enough. It was circling maybe 20 feet over trees at points or less.
1. **An even larger space to fly would have been preferable.** Even with probably 500x300 ft flat ground, I still struggled to keep LOS. I would probably go there again if I could be certain the circling altitude was more optimal, though.

#### Changes

1. VTX mount updated for better fit with the raised 20x20mm mounting holes which face down in my build. It is an excellent fit. It was also dropped 5mm total height and the bottom was squared off and thickened for a little better crash resistance.
1. Reassembly of the wood-foam interface will be done with hot glue and foam-safe CA glue has proven too brittle.

### 2024-08-22 - **Flight 002**

Successful flight with full PID tuning. Nose cone blew off apparently during flight. Reviewed footage, can't see when it was lost but it was not near the landing site. Landing was way too fast and hard, which broke the L wingtip almost off, leaving only the front 2cm attached. The breakpoint was just lateral to the primary carbon spar, which makes sense.

PID tuning is good though, and found a pretty good place to fly.

### 2024-08-26 - *Terrain! Terrain! Pull Up!*

Found an old SD card which I can use to support a terrain database. Surrounding files were loaded to total size of 222 MB on disc, leaving >3GB for logging. Confirmed logging is active for next flights.

## TODO

### TODO/Critical

- [x] design VTX mount and probably baseplate
- [x] design and print camera mount
- [x] finalize cable management
- [x] repair wingtip fracture
- [ ] engineer 3d printable nose cone

### TODO/Recommended

- [x] removed excess 5V BEC cable
- [x] enable gyroflow logging: <https://ardupilot.org/plane/docs/common-gyroflow.html>
- [ ] figure out VTX control from FC
- [x] enable terrain
- [x] from <https://terrain.ardupilot.org/>: **If using the SRTM1 data, set ArduPilot's TERRAIN_SPACING parameter to 30** before loading the data to the SD card. For SRTM3 data set TERRAIN_SPACING to the default of 100.
- [ ] test terrain (may need to be live on field)
