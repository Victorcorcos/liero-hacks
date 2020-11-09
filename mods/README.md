# Mod Guide ⚙️

This file documents the purpose behind each parameter of the `mod.json5` file, [like this one 🐛](https://pastebin.com/ztqCj6F8)

Few general assumptions:
- Game does 60 physics ticks, or "frames", per second.
- All times, durations etc are shown in frames.


# Summary 🔍

1. [Soundpack](#soundpack-)
2. [Constants](#constants-)
3. [Weapons](#weapons-)
4. [wObjects](#wobjects-)
5. [nObjects](#nobjects-)
6. [sObjects](#sobjects-)
7. [Textures](#textures-)
8. [The Connection Between Objects](#the-connection-between-objects-)
9. [Mandatory nObjects and sObjects](#mandatory-nobjects-and-sobjects-%EF%B8%8F)


## Soundpack 🔉

Which `soundpack` is used.

Those are stored server side and cannot be changed yet, you can only switch between few predetermined ones, for example:

1. sorliero.zip
2. promode.zip
3. csliero.zip
4. *under construction* 🏗️ *(does someone know the other ones?)*

```js
soundpack: 'promode.zip',
```


## Constants 🕹️

The constants define general behavior of the mod, like physics, gravity, bonuses and ninja rope behaviors.

```js
constants: {
  nrInitialLength: 250, // nr is ninjarope
  nrAttachLength: 28.125,
  minBounceUp: -0.8125,
  minBounceDown: 0.8125,
  minBounceHoriz: 0.8125,
  wormGravity: 0.02288818359375,
  wormAcc: 0.0762939453125,
  wormMaxVel: 0.969482421875,
  jumpForce: 0.85546875,
  maxAimVel: 0.052430983960935, // max aim velocity
  aimAcc: 0.0029960562263391427, // max aim acceleration
  ninjaropeGravity: 0.0152587890625,
  nrMinLength: 10.625, // in liero its length could be adjusted
  nrMaxLength: 250,
  bonusGravity: 0.02288818359375, // bonuses are health and ammo/weapon packs
  wormFricMult: 0.89, // worm friction multiplier
  aimFric: 0.83, // aim friction
  nrThrowVel: 8, // ninjarope throw velocity
  nrForce: 0.08333333333333333, // ninjarope pull strength
  bonusBounce: 0.4, // u can make bonuses (health and weapons) bounce more
  bonusFlickerTime: 220, // amount of time in game ticks before the bonus pack explodes
  aimMaxAngle: 1.5707963267948966,
  aimMinAngle: -1.521708941582556,
  nrAdjustVel: 1.5, // ninjarope length adjust speed, probably unused
  nrColourBegin: 24, // the scolor of the rope (index of pallete.png file)
  nrColourEnd: 27, // the color of the rope (index of pallete.png file)
  bonusExplodeRisk: 100, // chances for a bonus to spontaneously explode
  bonusHealthVar: 20, // variance of health given by bonus
  bonusMinHealth: 10, // minimum bonus health. So in this setting healing range is 10-30
  firstBloodColour: 80, // the color of the blood here (index of pallete.png file)
  numBloodColours: 2,
  bObjGravity: 0.0152587890625, // the gravity of worm's blood
  splinterLarpaVelDiv: 3,
  splinterCracklerVelDiv: 3,
  fallDamageHoriz: 0,
  fallDamageDown: 0,
  fallDamageUp: 0,
  hFallDamage: false, // hasFallDamage
  hBonusReloadOnly: true, // if true, weapon bonuses will only do reloads, if false - will give you a new weapon
},
```


## Weapons 🔫

A Weapon is a description on how the weapon itself works.

Think of it as if it was describing properties of the pistol itself, how does it affect you (recoil, noise, etc) but not the bullet.

```js
weapons: [
  {
    /*
      How many objects does this weapon shoot. 1 for pistols, bazookas etc, 20 will be a shotgun-type weapon.
    */
    parts: 20,

    /*
      Which bullet type to use. Bullets are stored in an ordered array, so the only thing which matters is
      where it is in the array. I used comments denoting id of them - using a designation of weapon-id-x or "wid2" for example,
      but those are just that: comments. Only the actual position in array matters.
    */
    bulletType: 0,

    /*
       Base speed of the bullet. If too high, will pass through worms. 5 is about the max playable value for usual weapons.
       To make very fast gauss-like weapons, use "repeat" property.
    */
    bulletSpeed: 5,

    /*
      Percentage of worm's speed applied to the bullet. WARNING: This is affected by "repeat"!
    */
    bulletSpeedInherit: 0.2298850574712644,

    /*
      TODO: check, but I am pretty sure it doesn't do anything
    */
    distribution: 0.25,

    /*
      Recoil of the weapon
    */
    recoil: 0.55,

    /*
      Ammo per one magazine before reloading
    */
    ammo: 8,

    /*
      Delay between individual shots when shooting one magazine
    */
    delay: 28,

    /*
      Reload time
    */
    loadingTime: 400,

    /*
      How many shells to drop during shooting
    */
    leaveShells: 1,

    /*
      Time between dropping shells. So for example you can make a minigun which drops shell every third shot to reduce map clutter.
    */
    leaveShellDelay: 28,

    /*
      Duration of firecone sprite being displayed. It is taken from the sprite sheet, is not animated and always uses just one sprite.
    */
    fireCone: 9,

    /*
      Whether a weapon has the flickering, red laser sight. It cannot be configured in any way.
    */
    laserSight: false,

    /*
      This makes the weapon to work like a laser, which has two implications:
       - weapon will be drawn as a laser beam of a given color configured within its weapon object
       - it will still shoot bullets, but they will instantenously appear on target or wall
      The "laser" weapon will still obey delay between shots, but drawing of the laser itself will not. Laser will be drawn as long as you have 
      some ammo and you press fire, even if the weapon is in its "delay" state.
    */
    laserBeam: false,

    /*
      Sound to use when shooting. The only way to go check which is which is to go through all of them, since they are indexed by numbers.
      There are about 30 sounds.
    */
    launchSound: 0,

    /*
      Sound used for reloading.
    */
    playReloadSound: true,

    /* 
      Name of the weapon displayed when changing weapons and on bonus packs. Only letters work, so "M16" will show as "M".
    */
    name: 'AUTO SHOTGUN' 
  }
  // rest of weapons follow here
],
```


## wObjects 🚀

`wObjects` are **objects shot by weapons**. (like gunshots)

Only weapons can produce them, and ordering in the array matters, counting from 0.

So for example if you have a chaingun bullet stored in third position, you need to use "bulletType: 2" in your weapon - because it is counted from 0.

```js
wObjects: [
  {
    // shotgun wid0 - Those are my comments denoting the id and the type of the object. I can quickly find an object I am looking for by seaching for "nids", "wids" and "sids".

    /*
      Additional worm detect distance for the bullet. Add more for "bigger" bullets or things like proximity detonators.
    */
    detectDistance: 1,

    /*
      Force affecting the hit worm. This will also work if the object has "wormCollide" set to false; it will simply not disappear and push the worm continuously.
    */
    blowAway: 0.01,

    /*
      Gravity of the projectile.
    */
    gravity: 0.01068115234375,

    /*
      Sound made on explosion. Note: an object may be removed without explosion, in which case no sound will be played - see "wormExplode" and "explGround".
    */
    exploSound: -1,

    /*
      Works in two modes.
      For shot types other than 1, this is additional speed added each frame. Use it for constant accelerating weapons.
      For shot type = 1 (directional player-controlled missile), this is an additional speed added to the missile when pressing up.
    */
    addSpeed: 0,

    /*
      Spread of the weapon. This works by adding a random direction vector of random length to current speed vector of the projectile.
    */
    distribution: 0.18310546875, 

    /*
      Speed multiplication each frame. Use it to have a weapons which accelerate or decelerate non-linearly, like proxy mine from promode.
    */
    multSpeed: 1,

    /*
      Which special object (sObject) to use on explosion. Those are stored in ordered arrays and are defined near the end of mod json file.
    */
    createOnExp: 2,

    /*
      Which dirt mask sprite to use.
      -1 is none.
      0 destroy dirt
      4 creates brown dirt
      6 creates green dirt
    */
    dirtEffect: -1,

    /*
      Whether the object should explode (produce a sObject and a sound) on worm collision. Works only if "wormCollide" is set too.
    */
    wormExplode: false,

    /*
      Whether the object should explode on ground collision.
    */
    explGround: true,

    /*
      Whether the object should collide with the worm and get removed.
    */
    wormCollide: true,

    /*
      Whether the object should collide with other objects. If yes, they will bounce off themselves but none of them will be destroyed. 
      If set to false, they pass through each other.
    */
    collideWithObjects: false,

    /*
      Whether the object is affected by explosions' push force. 
    */
    affectByExplosions: false,

    /*
      Bounciness of the object. TODO: check how it differs from bounceFriction
    */
    bounce: 0,
    bounceFriction: 0.8,

    /*
      Time to explode in frames. When set to 0 there will be no explosion at all. 
      Any positive value will cause creation of a designated special object (if not -1) and playing explosion sound.
    */
    timeToExplo: 0,

    /*
      Variation of time to explode in frames. TODO: Check how exactly is it factored in.
    */
    timeToExploV: 0,

    /*
      Damage inflicted on worm which was hit. Note: If the object does not have "wormCollide" property set, 
      this will be applied each frame the collision still occurs, leading to potentially huge damage values.
    */
    hitDamage: 1,

    /*
      How much blood should be created on hit. This does not mean how many blood particles are created, treat it like a rough value.
    */
    bloodOnHit: 3,

    /*
      First sprite of animation used for this object.
      If -1, it will be a single pixel bullet using "colorBullets" for color.
    */
    startFrame: -1,

    /*
      Amount of sprites to use to animate the object, starting with "startFrame". 
      Note: Animation begins on random frame, so is suitable really only for objects which have animation cycle which looks good regardless
      of what frame it starts. Think things like spinning grenades, mines, pulsing items, etc. 
    */
    numFrames: 0,

    /*
      Whether the animation should be looped.
      TODO: Check if the animation is still random if loopAnim is set to false.
    */
    loopAnim: false,

    /*
      Defines general type of the weapon object. 
      0 - a standard object being either a colored pixel or animated sprite.
      1 - a missile-type object which uses one frame depending on its direction. "startFrame" defines start of directional sprite range in the spritesheet.
      2 - a player-controllable missile. It is animated like shotType: 1.
      3 - a missile-type object with "drunk" behavior when "distribution" is set to non-zero value. It is animated like shotType: 1.
      4 - in original Liero this was a "Laser-type" weapon. In webliero it most likely behaves just like shotType 0. TODO: verify if this indeed is the case.

      using shotType 4 is not recommended due to its uncertain behavior.
    */
    shotType: 0,

    /*
      How many times should the physics of this object be calculated per frame. Most notably, this affect percieved speed of the projectile.
      This is how you make very fast projectiles which do not pass through walls or worm.
      "shotType: 4" in original Liero was using repeat: 8 value, and there was no "repeat" property.
      So Gauss Gun, for example, should have "repeat": 8 and "shotType": 0 in webliero. Unlike original Liero, you can use any repeat value,
      but please note using absurdly high values may cause lags. 
    */
    repeat: 1,

    /*
      Color of the bullet. Note: Some ranges in the palette are causing the bullet color to be slightly randomized.
      TODO: Verify how exactly does this work. 
    */
    colorBullets: 75,

    /*
      Amount of nObjects to create on explosion. The wObject must actually explode, for example if "wormExplode" is set to false
      and "wormCollide" is set to true, no nObjects will be created.
    */
    splinterAmount: 1,

    /*
      Color used on the nObjects, if they do not have animation set.
    */
    splinterColour: 13,
    
    /*
      Type of nObjects used when an explosion occurs. This refers to index of the nObject in the array, so if you change order of the objects,
      something else will be used
    */
    splinterType: 2,

    /*
      A mystery. I believe it has no effect. TODO: verify
    */
    splinterScatter: 0,

    /* 
      sObject (special Object) used as a trail. Special objects are basically explosions, they are static - cannot move or be affected in any way,
      but they can affect other objects and worms. Like every object type they are indexed by their order in the array.
    */ 
    objTrailType: -1,

    /*
      Frame delay between creating trailing sObjects.
      Note: If "repeat" is set to greater than 1, sObjects will be created in "batches", creating intermittent lines instead of denser lines. 
      This probably is a bug or unintended behavior. 
    */
    objTrailDelay: 0,

    /*
      This is NOT a type of object used for trailing something.
      "partTrail" here refers to nObject trail, however partTrailType defines how will it be dropped:
      0 - crackler-type non-directional trail
      1 - larpa-type directional trail
      TODO: find out exactly how does this work
    */
    partTrailType: 0,

    /*
      This is the type of nObject trailed by the wObject.
    */
    partTrailObj: -1,

    /*
      Frame delay between creating trailed nObjects. 
      TODO: check if "repeat" greater than zero also affects this trail type like objTrailDealy.
    */
    partTrailDelay: 0,

    /*
      Base speed used for missile-type weapons ("shotType" = 1). Use "addSpeed" property to defined additional speed when pressing up while flying.
    */
    speed: 435
  }
  // rest of wObjects (wids) follow here
],
```


## nObjects 🎈

`nObjects` are **non-weapon** objects.

Those are things like worm gibs, dropped shells, blood, but also additional weapon particles like Chiquita bananas dropped by Chiquita Bomb.

```js
nObjects: [
  {
    // worm part nid0 - description of the nObject, this is a comment and as such does not interact with code at all.

    /*
      Additional worm detect distance for the bullet. Add more for "bigger" bullets or things like proximity detonators.
    */
    detectDistance: 0,

    /*
      Gravity of the particle.
    */
    gravity: 0.0152587890625,

    /*
      This is actual speed of the particle, used both for splinters and trails.
    */
    speed: 1.2,

    /*
      Speed variation. TODO: verify how exactly is it added/subtracted.
    */
    speedV: 0.4,

    /*
      Spread of the particle. This works by adding a random direction vector of random length to current speed vector of the projectile.
    */
    distribution: 0.1220703125,

    /*
      Force affecting the hit worm. This will also work if the object has "wormCollide" set to false; it will simply not disappear and push the worm continuously.
    */
    blowAway: 0,

    /*
      Bounciness of the object. Note lack of "bounceFriction" property.
    */
    bounce: 0.1,

    /*
      Damage inflicted on worm which was hit. Note: If the object does not have "wormDestroy" property set, 
      this will be applied each frame the collision still occurs, leading to potentially huge damage values.
      TODO: verify if "wormDestroy" is actually same sa "wormCollide" for wObjects.
    */
    hitDamage: 0,

    /*
      Whether the object should explode (produce a sObject and a sound) on worm collision. Works only if "wormCollide" is set too.
    */
    wormExplode: false,

    /*
      Whether the object should explode on ground collision.
    */
    explGround: true,

    /*
      Whether the object should collide with the worm and get removed.
    */
    wormDestroy: true,

    /*
      How much blood should be created on hit. This does not mean how many blood particles are created, treat it like a rough value.
    */
    bloodOnHit: 0,

    /*
      First sprite of animation used for this object.
      If -1, it will be a single pixel bullet using "colorBullets" for color.
    */
    startFrame: 165,

    /*
      Amount of sprites to use to animate the object, starting with "startFrame". 
      Note: Animation begins on random frame, so is suitable really only for objects which have animation cycle which looks good regardless
      of what frame it starts. Think things like spinning grenades, mines, pulsing items, etc. 
    */
    numFrames: 3,

    /* 
      When set to true, this makes the object to be drawn onto the map and object itself gets removed from the game.
      This is how mountains of shells and body parts are created in liero and also the reason why they clutter up the bunnyhoops.
    */
    drawOnMap: true,

    /*
      Color of the bullet. It references the color position of the pallete
      If startFrame is -1, it will use this colorBullets color
      Otherwise, the colorBullets won't work because there are ready sprites starting from startFrame index
      Note: Some ranges in the palette are causing the bullet color to be slightly randomized.
    */
    colorBullets: 0,

    /*
      Which special object (sObject) to use on explosion. Those are stored in ordered arrays and are defined near the end of mod json file.
    */
    createOnExp: 4,

    /*
      Whether the object is affected by explosions' push force. 
    */
    affectByExplosions: false,

    /*
      Which dirt mask sprite to use.
      -1 is none.
      0 destroy dirt
      4 creates brown dirt
      6 creates green dirt
    */
    dirtEffect: -1,

    /*
      Amount of nObjects to create on explosion. The wObject must actually explode, for example if "wormExplode" is set to false
      and "wormCollide" is set to true, no nObjects will be created.
    */
    splinterAmount: 0,

    /*
      Color used on the nObjects, if they do not have animation set.
    */
    splinterColour: 0,

    /*
      Type of nObjects used when an explosion occurs. This refers to index of the nObject in the array, so if you change order of the objects,
      something else will be used.
    */
    splinterType: -1,

    /*
      A nObject-specific property; when set to true, the nObject will trail blood particles.
    */
    bloodTrail: true,

    /*
      Delay between blood particles.
    */
    bloodTrailDelay: 10,

    /* 
      sObject (special Object) used as a trail. Special objects are basically explosions, they are static - cannot move or be affected in any way,
      but they can affect other objects and worms. Like every object type they are indexed by their order in the array.
    */ 
    leaveObj: -1,

    /*
      Frame delay between creating trailing sObjects.
      Note: If "repeat" is set to greater than 1, sObjects will be created in "batches", creating intermittent lines instead of denser lines. 
      This probably is a bug or unintended behavior. 

      Note: notice how nObjects cannot trail other nObjects.
    */
    leaveObjDelay: 0,

    /*
      Time to explode in frames. When set to 0 there will be no explosion at all. 
      Any positive value will cause creation of a designated special object (if not -1) and playing explosion sound.
    */
    timeToExplo: 8000,

    /*
      Variation of time to explode in frames. TODO: Check how exactly is it factored in.
    */
    timeToExploV: 2000
  },
  // rest of nObjects follow here
],
```


## sObjects 💥

`sObjects` are **special** Objects.

They are static objects which cannot be affected by anything. Their usual usage is to make explosions or non-movable trails.

```js
sObjects: [
  {
    // large explosion sid0 - description of the sObject, this is a comment.

    /*
      sObjects create random sound on creation, use -1 for no sound.
      Start sound is first index used...
    */ 
    startSound: 9,

    /*
      ...and numSounds is amount of indices used to pick the starting sound from.
    */
    numSounds: 4,

    /*
      Delay before advancing to next frame.
    */
    animDelay: 2,

    /*
      First sprite of animation used for this object.
      If -1, it will be a single pixel. TODO: but of which cholor?
    */
    startFrame: 40,

    /*
      Amount of sprites to use to animate the object, starting with "startFrame". 
      Note: unlike for wObjects and nObjects, sObjects always start at proper startFrame.
    */
    numFrames: 15,

    /*
      Maximum detect range of the sObject when it begins to affect the worm.
    */
    detectRange: 20,

    /*
      Damage applied to the worm if in detect range. This is affected by how far the worm is from epicenter
      of the explosion. NOTE: it is very rare for an explosion to be in exact point where center sprite of the worm is.
      This means, usually the damage will be noticeably smaller than the number indicate. Use about 2/3 of its value
      as a rough estimate of the damage.
    */
    damage: 15,

    /*
      Force applied on the worm as push back. Can also be negative.
      TODO: Document the quirks of this. The whole x-y axis situation.
    */
    blowAway: 0.0457763671875,

    /*
      Whether the sObject should create a shadow. nObjects and wObjects always do.
      TODO: verify if this works in webliero.
    */
    shadow: true,

    /*
      Unused, in Liero explosions could shake and flash. This is not implemented yet.
    */
    shake: 4,

    /*
      Unused, in Liero explosions could shake and flash. This is not implemented yet.
    */
    flash: 8,

    /*
      Which dirt mask sprite to use.
      -1 is none.
      0 destroy dirt
      4 creates brown dirt
      6 creates green dirt
    */
    dirtEffect: 0
  },
  // rest of sObjects follow here
],
```


## Textures 🎨

These `textures` parameters has the reference in `nObject`, `wObject` and `sObject` as `dirtEffect`s.

`dirtEffect` is a parameter present on all object types (`nObject`, `wObject` and `sObject`).

Changes here affects all dirts on the map and how the gunshots interact with them.

```js
textures: [
  {
    nDrawBack: true, // Related to create dirts on shots. Implications: https://i.imgur.com/FYmjd9g.png
    mFrame: 0, // Related to the size of dirtEffect. 0 is The biggest, 1 is medium, 2 is Small, 37 and 99 are rarher medium/small. Should not be changed from 0 unless you know what you are doing.
    sFrame: 73, // The sprite id of the dirtEffect. 73 cleans dirt pixels and makes background pixels. Should not be changed from 73, unless you change the orders in which sprites are placed on the `sprites.wlsprt` file. Implications: https://i.imgur.com/fGWyxRW.png
    rFrame: 2 // Related to the size of dirtEffect. 0 is The biggest, 1 is medium, 2 is Small, 37 and 99 are rarher medium/small. Should not be changed from 2 unless you know what you are doing.
  },
  // rest of textures follow here
],
colorAnim: [129, 131, 133, 136, 152, 159, 168, 171], // The id colors which are animated.
textSpritesStartIdx: 240, // The sprite id of the letters used in weapon names when u change weapons. Should not be changed from 240, unless you change the orders in which sprites are placed on the `sprites.wlsprt` file. Implications: https://i.imgur.com/K9olpMu.png
crossHairSprite: 153 // The sprite id of The crosshair used.
```


## The Connection Between Objects 🧬

![objects_relation🧬](https://user-images.githubusercontent.com/7637806/98485669-c4103500-21f6-11eb-8e8c-38e59146eda3.png)

#### Explanation

1. In `weapons` u have `bulletType`: refers to the `wObject` id. Created on gunshot.
2. In `wObject` u have `createOnExp`: refers to `sObject` id. Created on explosion.
3. In `wObject` u have `objTrailType`: refers to `sObject` id. Created on trail.
4. In `wObject` u have `splinterType`: refers to `nObject` id. Created on explosion. `splinterAmount` refers to the ammount.
5. In `wObject` u have `partTrailObj`: refers to `nObject` id. Created on trail.
6. In `nObject` u have `createOnExp`: refers to `sObject` id. Created on explosion.
7. In `nObject` u have `leaveObj`: refers to `sObject` id. Created on trail.
8. In `nObject` u have `splinterType`: refers to `nObject` id. Created on explosion. `splinterAmount` refers to the ammount.


## Mandatory nObjects and sObjects ⚠️

There are some specific indexes of `nObjects` and `sObjects` that **need** to have items filled and is used on the internals of the liero game.

The hardcode mandatory items.

If these items are removed from the objects array, the game becomes buggy, can freeze and can generate console errors on the browser. Be aware with the following marked items!

#### `nObjects`

0. - [x] Worm 1 parts
1. - [x] Worm 2 parts
2. - [x] Particle (disappearing)
3. - [x] Particle (small damage)
4. - [x] Particle (medium damage)
5. - [x] Particle (larger damage)
6. - [x] Blood
7. - [x] Shells
8.  - [ ] Clusterbomb bombs
9.  - [ ] Large nukes
10. - [ ] Hellraider bullets
11. - [ ] Small nukes
12. - [ ] Napalm fireballs
13. - [ ] Dirt
14. - [ ] Chiquitabomb bombs
15. - [ ] Grasshopper 1
16. - [ ] Grasshopper 2
17. - [ ] Grasshopper 3
18. - [ ] Grasshopper 4
19. - [ ] Grasshopper 5
20. - [ ] Flag 1
21. - [ ] Flag 2
22. - [ ] Grasshopper 6
23. - [ ] Grasshopper 7

#### `sObjects`

0. - [x] Large explosion
1. - [x] Medium explosion
2. - [x] Small explosion
3. - [x] Hellraider smoke
4. - [x] Zimm flash
5. - [x] Nuke smoke
6. - [x] Flashing pixel
7. - [x] Teleport flash
8. - [ ] Small explosion, silent
9. - [ ] Very small explosion, silent
10. - [ ] Medium explosion, smaller
11. - [ ] Large explosion, smaller
12. - [ ] Medium explosion, bigger
13. - [ ] Unknown
