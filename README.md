# wild-harp-build

Build log and unique components of my AtomRC Dolphin, built with with Speedybee F405 Wing App FC stack running Ardupilot 4.5.5.

## Build Log

### 2024-07-29 - **Build Start**

- adding the basic param dumps, already with my basic configuration, near ready to fly. No flights yet, by the way.
- added CAD (onshape) files I used to mount the FC to the baseplate. My one complaint is the flanges on the top portion came out too thin. That said, I have reefed on it a bit and I think it's sufficient. Would thicken if doing it again.

### 2024-08-01 - **Ground Tuning**

- reversed incorrect pitch in radio per directions
- printed "aerodynamic" fpv camera mount (Avatar HD V1), fit is ok, a little too large so bends in ~1mm total when attached
- Reattached wings, reprogrammed servos successfully
- servo autotrim on

Nearing final build.

### 2024-08-17 - **Flight 001: Controlled Flight Into Terrain**

Finally took it out to fly. First launch with Autotakeoff didn't reach full throttle fast enough and soft-landed. No damage.

For second launch, I triggered Autotakeoff with a fake throw and then threw it. Climbed as expected and started to circle, but I didn't have FPV goggles running yet. Circle altitude was too low for surrounding trees. Fortunately no impacts, but flew out of LOS several times. Without ability to command higher circling altitude remotely, tried it in FBW-A. Handling was reasonable, but still no FPV. Without video or blackbox logging, I dropped a wing and crashed it nose-first. The battery slipped forward and smashed the VTX mount, forcefully disconnecting the antennas and camera. Incredibly, the VTX, camera, and antennas were undamaged and functional on bench testing save for lens coating scratches on the camera. The wood plate in the front section came loose as well. The flight controller, which was held down with VHB only to the foam, did dislodge but was not damaged. There was no damage to the electronics as far as I can tell. There was minor damage to the frontal empanage where the nose cone attaches, but this was glued back successfully.

#### Learning points

1. **The FPV should be started before launch.** Seems obvious in hindsight, but I felt in the moment that it was too much to do at once. It was certainly too much to do *in the air*.
1. **Circling height too low.** The circling height was set to 100m by default, which in retrospect seems quite appropriate given unpredictability of terrain. It would have been much easier to work on configuration and tuning from that altitude. I think I would have been able to get FPV on once the circling height was reached if it was great enough. It was circling maybe 20 feet over trees at points or less.
1. **An even larger space to fly would have been preferable.** Even with probably 500x300 ft flat ground, I still struggled to keep LOS. I would probably go there again if I could be certain the circling altitude was more optimal, though.

#### Changes

1. VTX mount updated for better fit with the raised 20x20mm mounting holes which face down in my build. It is an excellent fit. It was also dropped 5mm total height and the bottom was squared off and thickened for a little better crash resistance.
1. Reassembly of the wood-foam interface will be done with hot glue and foam-safe CA glue has proven too brittle.

#### Tasks resolved

- [x] design and print shorter version of VTX mount
- [x] design and print camera mount
- [x] removed excess 5V BEC cable
- [x] enable gyroflow logging: <https://ardupilot.org/plane/docs/common-gyroflow.html>

### 2024-08-22 - **Flight 002: At What Cost**

Successful flight with full PID tuning. Nose cone blew off apparently during flight. Reviewed footage, can't see when it was lost but it was not near the landing site. Landing was way too fast and hard, which broke the L wingtip almost off, leaving only the front 2cm attached. The breakpoint was just lateral to the primary carbon spar, which makes sense.

PID tuning is good though, and found a pretty good place to fly.

#### Tasks resolved

- [x] figure out VTX control from FC

### 2024-08-26 - ***Terrain! Terrain! Pull Up!***

Found an old SD card which I can use to support a terrain database. Surrounding files were loaded to total size of 222 MB on disc, leaving >3GB for logging. Confirmed logging is active for next flights.

#### Tasks resolved

- [x] repair L wingtip fracture
- [x] finalize cable management
- [x] from <https://terrain.ardupilot.org/>: **If using the SRTM1 data, set ArduPilot's TERRAIN_SPACING parameter to 30** before loading the data to the SD card. For SRTM3 data set TERRAIN_SPACING to the default of 100.
- [x] enable terrain

### 2024-08-27 - **Waiting for a nose**

Need nose, but nose needs alternate mounting system other than magnets due to tendency to disloge immediately.

#### Task opened

- [ ] engineer 3d printable nose cone and mount system (`nose\beak elliptical nose.SLDPRT`, `nose\nose mount.SLDPRT`)

### 2024-09-01 - **Flight 003: Hot Shot**

Just finished nose mounting system and a suitable nose. Went for quick flight at my new favorite place cut very short by VTX overheat, probably related to hot climate today (85F) and, in retrospect, fairly low airflow through new nose cone. Had to make for a quick landing, which resulted in wingtip tear much like my last landing. Will need to fix, but VTX overheat is also a big problem.

Noticing difficulty finding craft after landing - needs working beeper function.

Black box was enabled but the SD card had weird partitioning from Rasberry Pi use - formatted and now working (on the bench, that is).

Time set on Goggles X with file - will save to make it easy in the future.

Nose cone has minimal air entry and it seems overly heavy (27g + 3 M3 hex cap screws). Will probably try sawing it coronally to see if this obviates having to model a new one.

Mounting device is 18g before 5x threaded inserts.

#### Tasks resolved

- [x] engineer 3d printable nose cone and mount system (`nose\beak elliptical nose.SLDPRT`, `nose\nose mount.SLDPRT`)
- [x] enable blackbox logging
- [x] set time and FCC mode on Goggles X (files added which are copied to sd card)

#### Tasks opened

- [ ] repair R wingtip tear
- [ ] set triggerable lost craft sound
- [ ] work out VTX cooling/configurability
  - [ ] attach VTX_POWER to RC potentiometer to manually adjust
  - [ ] ?cut or engineer higher-flow nose cone

### 2024-09-02 - **Plane Posting**

[Posted nose cone to Printables for clout.](https://www.printables.com/model/993617-atomrc-dolphin-nose-mount-and-cones)

#### Tasks resolved

- [x] added `exp_` and Solidworks temp file prefix to `.gitignore` to declutter git scanning
- [x] hot glue strain relief and mounts
- [x] post nose cone to Printables with hole pattern specification
- [x] repair R wingtip

#### Tasks opened

- [ ] post camera mount models to Printables
- [ ] post FC mount models to Printables
- [ ] post VTX models to Printables

### 2024-09-03 - **Flight 004: Now You're Talking**

Excellent flight with use of `SiK` telemetry radio, which permitted a much improved control regime. I was able to activate autonomous modes when I needed to manipulate settings or plan for landing, which was a great help.

Landing mode was employed. The setup and approach were picture-perfect, however due to barometer drift the final/flare started at about 30ft AGL. Seeing that it was going to overshoot the landing area, I took over with `FWBA`, but I believe between abrupt throttle-up and L roll I suffered a stall and slapped the plane down on its belly. It fell in an oddly drifting manner. I have activated a setting which allows a momentary high throttle input to trigger a "go-around" which behaves similar to takeoff mode, which would have been preferable.

I think this has taught me that it has a slower minimum speed than I would have predicted, which I need to formally establish.

A servo 4 also had some autotrim changes which are added here.

#### Tasks completed

- [x] added base checklist to avoid forgetting stuff on the way out to the field
- [x] change OSD to mph
- [x] increase loiter radius to reduce violence of turning from R / CW circling radius 50m to L / CCW circling radius 100m
- [x] landing abort throttle up mode on
- [x] set up motor or other locator beep
- [x] takeoff distance increased to reflect typical airfield size
- [x] UART4 configured as SiK radio interface with appropriate rates

#### Tasks opened

- [ ] change ELRS rate to 150 for range
- [ ] FBWB -> Cruise instead
- [ ] landing altitude problem fix
- [ ] landing flare tune [per Ardupilot docs](https://ardupilot.org/plane/docs/automatic-landing.html)
- [ ] make D6 charger case/box

### 2024-09-06 - **Flight 005 - Do The Loop**

Some connectivity annoyances to start, and some odd dudes in parking lot, but ultimately got it up and stable.

After action review shows strange orientation problems. Plane shows as oriented away from trajectory. MAG fit repeated and improved. Complex compensators like battery current and iron matrix assessed but do not improve calibration much. New scalars did improve calibration significantly, though.

Managed to do a loop in `ACRO` - I am finding the *Harp* quite darty and enjoyable to fly manually. It was quite tight, confirmed 40-50ft diameter on OSD replay. `FBWA` is quite sheltered, it seems.

I noticed that I have no power measurements on OSD except for used mAh. This is not ideal.

Autoland worked well again, but started high. I was able to input pitch down, which I didn't know was possible, and landed quite softly. This did not save the motor mount, however. This was somewhat expected and a known issue with the *Dolphin*.

Max reliable speed on log is 35.31 m/s = 74.5 mph, but I didn't make a lengthy straight acceleration attempt.

Cooling is not a problem, but I am concerned the nose cone (which I cut open wider) is providing too much drag. This is a future concern.

#### Tasks opened

- [ ] establish maximum continuous speed in level flight
- [ ] establish most efficient cruise speed (will require several straight and level runs at different speeds)
- [ ] get OSD current monitor to actually display (was 0.0 all flight)
- [ ] model and build replacement motor mount
- [ ] set up %, V/cell, or something in OSD

(then set appropriate settings for autopilot)

#### Tasks completed

- [x] ?engineer higher-flow lower-drag nose cone
- [x] **`investigation`** landing altitude problem fix - manual control to guide glideslope was acceptable alone
- [x] change ELRS rate to 150Hz for range (cancelled - was not a limiting factor)
- [x] FBWB replaced with Cruise
- [x] improve VTX cooling problem
- [x] improved MAGfit compass calibration
- [x] level stall speed estimated 7.5 m/s = 16.777 mph, will set minimum airspeed accordingly to 120% = 9 m/s, which is the default value
- [x] MAVlink updated and set recommended parameters for SiK telemetry radio
- [x] test terrain (may need to be live on field)

### 2024-09-08 - **Motor Mount**

Overengineered motor mount adapter made. Posted to [Printables](https://www.printables.com/model/1001244-atomrc-dolphin-motor-mount-with-adapter).

From there:
> As many do, I broke my balsa motor mount and need a stronger one. Similar to others I found, but using M3 threaded inserts instead of nuts or direct threading. Adapts to my motor plate (the stock one) at 16mm x 16mm.

#### Tasks completed

- [x] model and build replacement motor mount, posted to [Printables](https://www.printables.com/model/1001244-atomrc-dolphin-motor-mount-with-adapter)
- [x] added script to remove readonly fields from Ardupilot param dumps to reduce errors with manual removal

### 2024-09-18 - **Flight 006 - Square Field Horror**

Bench tested failsafes - it circles at first (to re-establish radio contact by reorienting antennas), and then goes into Return to Loiter (`RTL`). This works as intended. (Apparently it was already set correctly, no changes were made, but I feel a little better about pushing distance a bit more.)

I think the weak link at this point is FPV antennas - the stock ones are known to be subpar and can be cheaply imporved to better "lollipop"-style ones.

Tried a new field with many more obstacles. On takeoff, almost hit trees twice due to R-rolled throw. Pretty scary. I continued to have severe roll oscillations to the point that I ran `Autotune` again with the hypothesis that the somewhat high roll derivative term was the cause. This may have all come down to my rather open nose cone which likely creates weird drag. Sure enough, D and P on the roll axis were reduced substantially, and the oscillation was apparently eliminated.

Stall speed confirmed at about 20 mph, no changes made. Stall recovery practice

Flight mode selection somehow got scrambled. I was SiK linked, luckily, so I was able to change modes that way.

Pretty fun time in retrospect, and no passers-by seemed to notice or care. My choice of cell rest volt for OSD failed and reported low values - it was showing 3.1V, but I landed with 3.7V, leaving at least 50% power in the tank.

#### Tasks opened

- [ ] reconfigure flight mode control on S3 potentiometer
- [ ] reconfigure OSD to show useful cell voltages

#### Tasks completed

- [x] Bench testing of short and long radio failsafe completed, working
- [x] updated `Autotune` which elminated previously noted roll oscillation

---

## Open Tasks

Ongoing task list by context. They should be sorted by priority, then descending alphabetically. They are created when logged as opened, and removed to the logs when completed. Projects steps are indented (until I think of something better).

### Bench Tasks

- [ ] attach VTX_POWER to RC potentiometer to manually adjust
- [ ] make D6 charger case/box
- [ ] reconfigure flight mode control on S3 potentiometer
- [ ] reconfigure OSD to show useful cell voltages

### Field Tests

- [ ] autolearn compass (`COMPASS_LEARN` = 3; fly until `have earth field` then `finished` appear)
- [ ] establish maximum continuous speed in level flight
- [ ] establish most efficient cruise speed (will require several straight and level runs at different speeds)

### Publication

- [ ] post VTX models to Printables
- [ ] post camera mount models to Printables
- [ ] post FC mount models to Printables

## Future Directions

- laminate entire body with clear wrap for added strength and lower drag
- landing flare tune [per Ardupilot docs](https://ardupilot.org/plane/docs/automatic-landing.html)
- rebuild as VTOL for better landings
- redesign nose cone for improved aerodynamics

---

## Suggestions for builders

### Theory

1. Consider repairabilty and durability. **Crashes and damage are guaranteed.** Fortunately much of the expensive stuff doesn't fly (FPV goggles, radio, soldering tooling). See my [first](#2024-08-17---flight-001-controlled-flight-into-terrain), [second](#2024-08-22---flight-002-at-what-cost), and [third](#2024-09-01---flight-003-hot-shot) flights which all ended with damage.

### Hardware

#### Body

1. **Consider a traditional wingplan** rather than essentially a long-bodied flying wing. It requires a lot of speed to stay up, which makes every phase of flight quite difficult. I would consider the AtomRC Dolphin to be an intermediate-level plane.
1. **Minimize CA glue**, *even [foam-safe varieties](https://bsi-inc.com/hardware/super_gold_plus.html)*. CA glue's failure mode is brittle which does not pair well with foam. Partial exception for rigid or small contact areas. **Use hot glue at low-temp** (on two-temp glue gun) **or maybe [FoamTac](https://www.beaconadhesives.com/product/foam-tac/)**, but I haven't tried that.
1. Hot glue at low-temp is good for most tasks. It is suprisingly, even shockingly robust to me, having thought of it as a craft-only solution before now. I got a [midrange two-temp gun](https://www.amazon.com/Surebonder-PRO2-100-100-Watt-Temperature-Industrial/dp/B006IY359K), and the strength is only a bit less than I am concerned with UV resistance. It seems to slightly melt, and thus weld, to syrofoam (I haven't messed with low-melt glues, which I believe is something besides using normal sticks on high or low temp.) Hot glue can be sculpted well while hot and trimmed away when cold. One or the other may be convenient for an application.
1. **VHB tape is superb** for mounting components. I crashed my plane quite hard nose-first on its first flight during a [dropped-wing event](#2024-08-17---flight-001-controlled-flight-into-terrain), and even though the FC module came off the styrofoam, it stuck back down after one attempt, and holds the entire plane's weight when held from the mount plate.

### Software

#### Radiomaster Boxer / ELRS

1. Take time to program radio control profiles and understand what you are broadcasting.
1. Bench test ELRS

#### Ardupilot

1. While Ardupilot is incredible, I would consider it *inaccessible for a unassisted non-technical user*. I have been building computers, programming (including a minor in computer science), and flying drones for many years. Allowing for the fact that I did not have any experienced folks to discuss this process, I would consider myself appropriately qualified. I have struggled to learn Ardupilot given partial documentation and difficulty with testing.
