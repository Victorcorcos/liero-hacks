# github.com/Victorcorcos/liero-hacks/tree/main/mods#the-connection-between-objects-

# == Converting PNG Files ==
#
# ../../converter/wltools/wltools sprites.wlsprt  dump/
# cp -r dump sprites
# ../../converter/wltools/wltools sprites/ new_sprites.wlsprt

require 'json'

# Execute this file with: `ruby parser.rb`
# It will generate the 'mod.json' file in a format importable by webliero.

# This file is created with the purpose to ease the proccess to create the association between objects in liero mods
#
# Instead of placing indexes on the json file structure. For example...
#   "createOnExp": 5
# You can place the object itself as the value. For example...
#   "createOnExp": {
#      # Large explosion
#      "startSound":10,
#      "numSounds":3,
#      "animDelay":4,
#      "startFrame":40,
#      "numFrames":15,
#      "detectRange":35,
#      "damage":90,
#      "blowAway":0.05340576171875,
#      "shadow":true,
#      "shake":5,
#      "flash":2,
#      "dirtEffect":0
#   }

# Add your weapons here!
config = {
  "soundpack":"csliero.zip",
  "constants":{
    "nrInitialLength":250,
    "nrAttachLength":28.125,
    "minBounceUp":-0.8125,
    "minBounceDown":0.8125,
    "minBounceHoriz":0.8125,
    "wormGravity":0.02288818359375,
    "wormAcc":0.0762939453125,
    "wormMaxVel":0.9542236328125,
    "jumpForce":0.9918212890625,
    "maxAimVel":0.05243098363280296,
    "aimAcc":0.005,
    "ninjaropeGravity":0.0152587890625,
    "nrMinLength":10.625,
    "nrMaxLength":250,
    "bonusGravity":0.02288818359375,
    "wormFricMult":0.8899999856948853,
    "aimFric":0.8299999833106995,
    "nrThrowVel":8,
    "nrForce":0.0833333358168602,
    "bonusBounce":0.4000000059604645,
    "bonusFlickerTime":220,
    "aimMaxAngle":1.5707963705062866,
    "aimMinAngle":-1.57,
    "nrAdjustVel":1.5,
    "nrColourBegin":19,
    "nrColourEnd":22,
    "bonusExplodeRisk":13,
    "bonusHealthVar":15,
    "bonusMinHealth":7,
    "firstBloodColour":80,
    "numBloodColours":2,
    "bObjGravity":0.0152587890625,
    "splinterLarpaVelDiv":3,
    "splinterCracklerVelDiv":3,
    "fallDamageHoriz":0,
    "fallDamageDown":0,
    "fallDamageUp":0,
    "hFallDamage":true,
    "hBonusReloadOnly":false
  },
  "weapons":[
    {
      # wid0 - PLASMA SHOTGUN
      "name": "PLASMA SHOTGUN",
      "parts": 10,
      "bulletSpeed": 2.3,
      "bulletSpeedInherit": 0,
      "distribution": 0.4999847412109375,
      "recoil": 0.25,
      "ammo": 8,
      "delay": 56,
      "loadingTime": 680,
      "leaveShells": 1,
      "leaveShellDelay": 28,
      "fireCone": 4,
      "laserSight": false,
      "laserBeam": false,
      "launchSound": 0,
      "playReloadSound": true,
      "bulletType": {
        # wObject ("PLASMA SHOTGUN")
        "detectDistance": 1,
        "blowAway": 0.05,
        "gravity": 0.002288818359375,
        "exploSound": -1,
        "addSpeed": 3,
        "distribution": 0.4999847412109375,
        "multSpeed": 1,
        "dirtEffect": -1,
        "wormExplode": false,
        "explGround": true,
        "wormCollide": true,
        "collideWithObjects": true,
        "affectByExplosions": true,
        "bounce": 0,
        "bounceFriction": 0.8,
        "timeToExplo": 0,
        "timeToExploV": 0,
        "hitDamage": 10,
        "bloodOnHit": 1,
        "startFrame": -1,
        "numFrames": 0,
        "loopAnim": false,
        "shotType": 4,
        "repeat": 8,
        "colorBullets": 161,
        "splinterAmount": 1,
        "splinterColour": 71,
        "splinterScatter": 1,
        "objTrailDelay": 0,
        "partTrailType": 0,
        "partTrailDelay": 0,
        "speed": 230,
        "createOnExp": {
          # sObject (created on explosion)
          "startSound":-1,
          "numSounds":0,
          "animDelay":4,
          "startFrame":40,
          "numFrames":15,
          "detectRange":10,
          "damage":10,
          "blowAway":0.030517578125,
          "shadow":true,
          "shake":0,
          "flash":0,
          "dirtEffect":0
        },
        "objTrailType":-1,# sObject (created on trail)
        "splinterType":4,# nObject (created on explosion)
        "partTrailObj":-1# nObject (created on trail)
      }
    },
    {
      # wid1 - NON-EXPLODING MISSEL
      "name":"NON-EXPLODING MISSEL",
      "parts":1,
      "bulletSpeed":3,
      "bulletSpeedInherit":0.3333333333333333,
      "distribution":0,
      "recoil":0.15,
      "ammo":1,
      "delay":0,
      "loadingTime":480,
      "leaveShells":0,
      "leaveShellDelay":1,
      "fireCone":9,
      "laserSight":false,
      "laserBeam":false,
      "launchSound":3,
      "playReloadSound":true,
      "bulletType":{
        # wObject ("NON-EXPLODING MISSEL")
        "detectDistance":1,
        "blowAway":0,
        "gravity":0,
        "exploSound":-1,
        "addSpeed":200,
        "distribution":0,
        "multSpeed":1,
        "dirtEffect":-1,
        "wormExplode":true,
        "explGround":false,
        "wormCollide":false,
        "collideWithObjects":false,
        "affectByExplosions":true,
        "bounce":0.8,
        "bounceFriction":0.8,
        "timeToExplo":450,
        "timeToExploV":20,
        "hitDamage":50,
        "bloodOnHit":30,
        "startFrame":110,
        "numFrames":0,
        "loopAnim":false,
        "shotType":2,
        "repeat":1,
        "colorBullets":0,
        "splinterAmount":15,
        "splinterColour":66,
        "splinterScatter":0,
        "objTrailDelay":1,
        "partTrailType":0,
        "partTrailDelay":0,
        "speed":300,
        "createOnExp":{
          # sObject (created on explosion)
          "startSound":10,
          "numSounds":3,
          "animDelay":4,
          "startFrame":46,
          "numFrames":9,
          "detectRange":6,
          "damage":50,
          "blowAway":0.06103515625,
          "shadow":true,
          "shake":3,
          "flash":5,
          "dirtEffect":1
        },
        "objTrailType":{
          # sObject (created on trail)
          "startSound":-1,
          "numSounds":0,
          "animDelay":2,
          "startFrame":64,
          "numFrames":4,
          "detectRange":2,
          "damage":1,
          "blowAway":0,
          "shadow":false,
          "shake":1,
          "flash":0,
          "dirtEffect":-1
       },
       "splinterType":{
         # nObject (created on explosion)
         "detectDistance":3,
         "gravity":0.0152587890625,
         "speed":4,
         "speedV":0.1,
         "distribution":0.48828125,
         "blowAway":0.3,
         "bounce":0,
         "hitDamage":10,
         "wormExplode":false,
         "explGround":true,
         "wormDestroy":true,
         "bloodOnHit":10,
         "startFrame":0,
         "numFrames":0,
         "drawOnMap":false,
         "colorBullets":29,
         "affectByExplosions":false,
         "dirtEffect":-1,
         "splinterAmount":0,
         "splinterColour":0,
         "bloodTrail":false,
         "bloodTrailDelay":0,
         "leaveObjDelay":1,
         "timeToExplo":0,
         "timeToExploV":0,
         "createOnExp":{
           # sObject (created on explosion)
           "startSound":25,
           "numSounds":3,
           "animDelay":5,
           "startFrame":104,
           "numFrames":3,
           "detectRange":4,
           "damage":6,
           "blowAway":0.0457763671875,
           "shadow":false,
           "shake":2,
           "flash":1,
           "dirtEffect":2
         },
         "splinterType":-1,# noid (created on trail)
         "leaveObj":{
           # sObject (created on trail)
           "startSound":-1,
           "numSounds":0,
           "animDelay":0,
           "startFrame":100,
           "numFrames":0,
           "detectRange":1,
           "damage":0,
           "blowAway":0.000030517578125,
           "shadow":true,
           "shake":0,
           "flash":0,
           "dirtEffect":5
         }
       },
       "partTrailObj":-1,# (noid created on trail)
      }
    },
    {
      # wid2 - BOUNCING BALL
      "name":"BOUNCING BALL",
      "parts":1,
      "bulletSpeed":10,
      "bulletSpeedInherit":0.3333333333333333,
      "distribution":0,
      "recoil":0.15,
      "ammo":1,
      "delay":0,
      "loadingTime":480,
      "leaveShells":0,
      "leaveShellDelay":1,
      "fireCone":9,
      "laserSight":false,
      "laserBeam":false,
      "launchSound":3,
      "playReloadSound":true,
      "bulletType":{
        # wObject ("BOUNCING BALL")
        "detectDistance":1,
        "blowAway":0,
        "gravity":0,
        "exploSound":-1,
        "addSpeed":1000,
        "distribution":0,
        "multSpeed":1,
        "dirtEffect":-1,
        "wormExplode":true,
        "explGround":false,
        "wormCollide":true,
        "collideWithObjects":false,
        "affectByExplosions":true,
        "bounce":1,
        "bounceFriction":0.8,
        "timeToExplo":450,
        "timeToExploV":20,
        "hitDamage":50,
        "bloodOnHit":30,
        "startFrame":236,
        "numFrames":3,
        "loopAnim":false,
        "shotType":0,
        "repeat":1,
        "colorBullets":0,
        "splinterAmount":60,
        "splinterColour":66,
        "splinterScatter":0,
        "objTrailDelay":1,
        "partTrailType":0,
        "partTrailDelay":0,
        "speed":1800,
        "createOnExp":{
          # sObject (created on explosion)
          "startSound":10,
          "numSounds":3,
          "animDelay":4,
          "startFrame":46,
          "numFrames":9,
          "detectRange":6,
          "damage":50,
          "blowAway":0.06103515625,
          "shadow":true,
          "shake":3,
          "flash":5,
          "dirtEffect":1
        },
        "objTrailType":{
          # sObject (created on trail)
          "startSound":-1,
          "numSounds":0,
          "animDelay":0,
          "startFrame":40,
          "numFrames":15,
          "detectRange":5,
          "damage":5,
          "blowAway":0.030517578125,
          "shadow":true,
          "shake":32,
          "flash":55,
          "dirtEffect":1
        },
       "splinterType":{
         # nObject (created on explosion)
         "detectDistance":3,
         "gravity":0.0152587890625,
         "speed":4,
         "speedV":0.1,
         "distribution":0.48828125,
         "blowAway":0.3,
         "bounce":0,
         "hitDamage":10,
         "wormExplode":false,
         "explGround":true,
         "wormDestroy":true,
         "bloodOnHit":10,
         "startFrame":0,
         "numFrames":0,
         "drawOnMap":false,
         "colorBullets":29,
         "affectByExplosions":false,
         "dirtEffect":-1,
         "splinterAmount":0,
         "splinterColour":0,
         "bloodTrail":false,
         "bloodTrailDelay":0,
         "leaveObjDelay":1,
         "timeToExplo":0,
         "timeToExploV":0,
         "createOnExp":{
           # sObject (created on explosion)
           "startSound":25,
           "numSounds":3,
           "animDelay":5,
           "startFrame":104,
           "numFrames":3,
           "detectRange":4,
           "damage":6,
           "blowAway":0.0457763671875,
           "shadow":false,
           "shake":2,
           "flash":1,
           "dirtEffect":2
         },
         "splinterType":-1,# noid (created on trail)
         "leaveObj":{
           # sObject (created on trail)
           "startSound":-1,
           "numSounds":0,
           "animDelay":0,
           "startFrame":50,
           "numFrames":0,
           "detectRange":1,
           "damage":0,
           "blowAway":0.000030517578125,
           "shadow":true,
           "shake":0,
           "flash":0,
           "dirtEffect":5
         }
       },
       "partTrailObj":-1,# (noid created on trail)
      }
    },
    {
      # wid3 - CORONA VIRUS
      "name":"CORONA VIRUS",
      "parts":1,
      "bulletSpeed":3.7,
      "bulletSpeedInherit":0,
      "distribution":0.00152587890625,
      "recoil":0.3,
      "ammo":1,
      "delay":100,
      "loadingTime":1,
      "leaveShells":0,
      "leaveShellDelay":1,
      "fireCone":1,
      "laserSight":false,
      "laserBeam":false,
      "launchSound":5,
      "playReloadSound":true,
      "bulletType":{
        # wObject ("CORONA VIRUS")
        "detectDistance":4,
        "blowAway":0.4,
        "gravity":0.0847625732421875,
        "exploSound":7,
        "addSpeed":0,
        "distribution":0.00152587890625,
        "multSpeed":1,
        "dirtEffect":-1,
        "wormExplode":true,
        "explGround":true,
        "wormCollide":true,
        "collideWithObjects":false,
        "affectByExplosions":true,
        "bounce":1,
        "bounceFriction":1,
        "timeToExplo":100,
        "timeToExploV":0,
        "hitDamage":50,
        "bloodOnHit":2,
        "startFrame":195,
        "numFrames":10,
        "loopAnim":false,
        "shotType":0,
        "repeat":1,
        "colorBullets":162,
        "splinterAmount":250,
        "splinterColour":200,
        "splinterScatter":0,
        "objTrailDelay":1,
        "partTrailType":0,
        "partTrailDelay":0,
        "speed":1000,
        "createOnExp":{
          # sObject (created on explosion)
          "startSound":25,
          "numSounds":2,
          "animDelay":3,
          "startFrame":51,
          "numFrames":4,
          "detectRange":22,
          "damage":9,
          "blowAway":0.0457763671875,
          "shadow":true,
          "shake":2,
          "flash":3,
          "dirtEffect":8
        },
        "objTrailType":{
          # sObject (created on trail)
          "startSound":-1,
          "numSounds":0,
          "animDelay":4,
          "startFrame":100,
          "numFrames":3,
          "detectRange":0,
          "damage":0,
          "blowAway":0.000030517578125,
          "shadow":true,
          "shake":0,
          "flash":0,
          "dirtEffect":-1
        },
        "splinterType":{
          # nObject (created on explosion)
          "detectDistance":0,
          "gravity":0,
          "speed":1.0,
          "speedV":1.0,
          "distribution":0,
          "blowAway":0.05,
          "bounce":1,
          "hitDamage":1,
          "wormExplode":false,
          "explGround":false,
          "wormDestroy":false,
          "bloodOnHit":0,
          "startFrame":0,
          "numFrames":0,
          "drawOnMap":true,
          "colorBullets":82,
          "affectByExplosions":true,
          "dirtEffect":-1,
          "splinterAmount":0,
          "splinterColour":0,
          "bloodTrail":false,
          "bloodTrailDelay":0,
          "leaveObjDelay":0,
          "timeToExplo":600,
          "timeToExploV":300,
          "createOnExp":{
            # sObject (created on explosion)
            "startSound":-1,
            "numSounds":0,
            "animDelay":0,
            "startFrame":100,
            "numFrames":0,
            "detectRange":1,
            "damage":2,
            "blowAway":0.0000152587890625,
            "shadow":false,
            "shake":0,
            "flash":0,
            "dirtEffect":-1
          },
          "splinterType":-1,# noid (created on trail)
          "leaveObj":-1,# soid (created on trail)
        },
        "partTrailObj":-1,# (noid created on trail)
      }
    },
    {
      # wid4 - CORONA MASK
      "name":"CORONA MASK",
      "parts":1,
      "bulletSpeed":1,
      "bulletSpeedInherit":1,
      "distribution":1,
      "recoil":0.3,
      "ammo":10,
      "delay":40,
      "loadingTime":0,
      "leaveShells":0,
      "leaveShellDelay":1,
      "fireCone":-1,
      "laserSight":false,
      "laserBeam":false,
      "launchSound":27,
      "playReloadSound":false,
      "bulletType":{
        # wObject ("CORONA MASK")
        "detectDistance":-5,
        "blowAway":0,
        "gravity":0,
        "exploSound":-1,
        "addSpeed":0,
        "distribution":0.152587890625,
        "multSpeed":0,
        "dirtEffect":4,
        "wormExplode":false,
        "explGround":false,
        "wormCollide":false,
        "collideWithObjects":false,
        "affectByExplosions":false,
        "bounce":0,
        "bounceFriction":0.800000011920929,
        "timeToExplo":1,
        "timeToExploV":0,
        "hitDamage":0,
        "bloodOnHit":0,
        "startFrame":238,
        "numFrames":0,
        "loopAnim":false,
        "shotType":2,
        "repeat":8,
        "colorBullets":1,
        "splinterAmount":150,
        "splinterColour":0,
        "splinterScatter":0,
        "objTrailDelay":0,
        "partTrailType":0,
        "partTrailDelay":0,
        "speed":0,
        "createOnExp":{
          # sObject (created on explosion)
          "startSound":-1,
          "numSounds":0,
          "animDelay":2,
          "startFrame":52,
          "numFrames":3,
          "detectRange":0,
          "damage":0,
          "blowAway":0.5,
          "shadow":true,
          "shake":0,
          "flash":0,
          "dirtEffect":4
        },
        "objTrailType":{
          # sObject (created on trail)
          "startSound":-1,
          "numSounds":0,
          "animDelay":2,
          "startFrame":52,
          "numFrames":3,
          "detectRange":0,
          "damage":0,
          "blowAway":0.5,
          "shadow":true,
          "shake":0,
          "flash":0,
          "dirtEffect":4
        },
        "splinterType":{
          # nObject (created on explosion)
          "detectDistance":0,
          "gravity":0,
          "speed":0,
          "speedV":0,
          "distribution":0.5,
          "blowAway":0,
          "bounce":0,
          "hitDamage":0,
          "wormExplode":false,
          "explGround":false,
          "wormDestroy":false,
          "bloodOnHit":0,
          "startFrame":312,
          "numFrames":0,
          "drawOnMap":false,
          "colorBullets":0,
          "affectByExplosions":false,
          "dirtEffect":6,
          "splinterAmount":0,
          "splinterColour":0,
          "bloodTrail":false,
          "bloodTrailDelay":0,
          "leaveObjDelay":0,
          "timeToExplo":3,
          "timeToExploV":1,
          "createOnExp":-1,# soid (created on explosion)
          "leaveObj":-1,# soid (created on trail)
          "splinterType":-1,# noid (created on trail)
        },
        "partTrailObj":-1,# (noid created on trail)
      }
    },
    {
      # wid5 - PROTECTION
      "name":"PROTECTION",
      "parts":1,
      "bulletSpeed":1,
      "bulletSpeedInherit":1,
      "distribution":0.0000152587890625,
      "recoil":0,
      "ammo":100,
      "delay":0,
      "loadingTime":360,
      "leaveShells":-1,
      "leaveShellDelay":1,
      "fireCone":10,
      "laserSight":false,
      "laserBeam":false,
      "launchSound":27,
      "playReloadSound":false,
      "bulletType":{
        # wObject ("PROTECTION")
        "detectDistance":-5,
        "blowAway":0,
        "gravity":0,
        "exploSound":-1,
        "addSpeed":0,
        "distribution":0.0000152587890625,
        "multSpeed":0,
        "dirtEffect":4,
        "wormExplode":false,
        "explGround":false,
        "wormCollide":false,
        "collideWithObjects":false,
        "affectByExplosions":false,
        "bounce":0,
        "bounceFriction":0.800000011920929,
        "timeToExplo":1,
        "timeToExploV":0,
        "hitDamage":0,
        "bloodOnHit":0,
        "startFrame":-1,
        "numFrames":0,
        "loopAnim":false,
        "shotType":2,
        "repeat":8,
        "colorBullets":20,
        "splinterAmount":150,
        "splinterColour":0,
        "splinterScatter":0,
        "objTrailDelay":0,
        "partTrailType":0,
        "partTrailDelay":0,
        "speed":100,
        "createOnExp":-1,# (soid created on explosion)
        "objTrailType":-1,# (soid created on trail)
        "splinterType":{
          # nObject (created on explosion)
          "detectDistance":0,
          "gravity":0,
          "speed":5,
          "speedV":0.05,
          "distribution":0.030517578125,
          "blowAway":0,
          "bounce":0,
          "hitDamage":0.1,
          "wormExplode":true,
          "explGround":false,
          "wormDestroy":true,
          "bloodOnHit":0,
          "startFrame":15,
          "numFrames":0,
          "drawOnMap":false,
          "colorBullets":0,
          "affectByExplosions":false,
          "dirtEffect":6,
          "splinterAmount":0,
          "splinterColour":0,
          "bloodTrail":false,
          "bloodTrailDelay":0,
          "leaveObjDelay":0,
          "timeToExplo":5,
          "timeToExploV":0,
          "createOnExp":-1,
          "splinterType":-1,
          "leaveObj":-1,
        },
        "partTrailObj":-1,# (noid created on trail)
      }
    }
  ],
  "wObjects":[],
  "nObjects":[
    {
      # noid0
      # Worm 1 parts
      "detectDistance":3,
      "gravity":0.030517578125,
      "speed":1,
      "speedV":0.4,
      "distribution":0.1220703125,
      "blowAway":0.05,
      "bounce":0.2,
      "hitDamage":0,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":false,
      "bloodOnHit":0,
      "startFrame":165,
      "numFrames":3,
      "drawOnMap":false,
      "colorBullets":0,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":true,
      "bloodTrailDelay":1,
      "leaveObjDelay":0,
      "timeToExplo":200,
      "timeToExploV":50,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":6,# nObject (created on trail)
    },
    {
      # noid1
      # Worm 2 parts
      "detectDistance":3,
      "gravity":0.030517578125,
      "speed":1,
      "speedV":0.4,
      "distribution":0.1220703125,
      "blowAway":0.05,
      "bounce":0.2,
      "hitDamage":0,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":false,
      "bloodOnHit":0,
      "startFrame":169,
      "numFrames":3,
      "drawOnMap":false,
      "colorBullets":0,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":true,
      "bloodTrailDelay":1,
      "leaveObjDelay":0,
      "timeToExplo":200,
      "timeToExploV":50,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":6,# nObject (created on trail)
    },
    {
      # noid2
      # Particle (disappearing non-dmg)
      "detectDistance":0,
      "gravity":0.01068115234375,
      "speed":0.2,
      "speedV":0.4,
      "distribution":0.091552734375,
      "blowAway":0,
      "bounce":0,
      "hitDamage":0,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":false,
      "bloodOnHit":0,
      "startFrame":0,
      "numFrames":0,
      "drawOnMap":false,
      "colorBullets":68,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":false,
      "bloodTrailDelay":0,
      "leaveObjDelay":0,
      "timeToExplo":30,
      "timeToExploV":2,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":-1,# nObject (created on trail)
    },
    {
      # noid3
      # Particle (small damage)
      "detectDistance":2,
      "gravity":0.0457763671875,
      "speed":4,
      "speedV":1,
      "distribution":0.30517578125,
      "blowAway":0.06,
      "bounce":0,
      "hitDamage":9,
      "wormExplode":true,
      "explGround":true,
      "wormDestroy":true,
      "bloodOnHit":1,
      "startFrame":0,
      "numFrames":0,
      "drawOnMap":false,
      "colorBullets":0,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":false,
      "bloodTrailDelay":0,
      "leaveObjDelay":1,
      "timeToExplo":15,
      "timeToExploV":3,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj": {
        # sObject (created on trail)
        "startSound":-1,
        "numSounds":0,
        "animDelay":4,
        "startFrame":64,
        "numFrames":4,
        "detectRange":3,
        "damage":2,
        "blowAway":0.0030517578125,
        "shadow":true,
        "shake":0,
        "flash":0,
        "dirtEffect":5
      },
      "splinterType":-1# nObject (created on trail)
    },
    {
      # noid4
      # Particle (medium damage)
      # (SHOTGUN splinterType)
      "detectDistance":1,
      "gravity":0.1434326171875,
      "speed":1,
      "speedV":0.1,
      "distribution":0.4999847412109375,
      "blowAway":0.1,
      "bounce":0.2,
      "hitDamage":4,
      "wormExplode":true,
      "explGround":true,
      "wormDestroy":true,
      "bloodOnHit":2,
      "startFrame":0,
      "numFrames":0,
      "drawOnMap":false,
      "colorBullets":75,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":false,
      "bloodTrailDelay":0,
      "leaveObjDelay":1,
      "timeToExplo":10,
      "timeToExploV":3,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj": {
        # sObject (created on trail)
        "startSound":-1,
        "numSounds":0,
        "animDelay":0,
        "startFrame":76,
        "numFrames":2,
        "detectRange":2,
        "damage":1,
        "blowAway":0.0000762939453125,
        "shadow":true,
        "shake":0,
        "flash":0,
        "dirtEffect":-1
      },
      "splinterType":-1# nObject (created on trail)
    },
    {
      # noid5
      # Particle (larger damage)
      "detectDistance":2,
      "gravity":0.06103515625,
      "speed":5,
      "speedV":0,
      "distribution":0,
      "blowAway":0.2,
      "bounce":0,
      "hitDamage":9,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":true,
      "bloodOnHit":3,
      "startFrame":202,
      "numFrames":3,
      "drawOnMap":false,
      "colorBullets":54,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":2,
      "splinterColour":0,
      "bloodTrail":false,
      "bloodTrailDelay":0,
      "leaveObjDelay":0,
      "timeToExplo":0,
      "timeToExploV":0,
      "createOnExp": {
        # sObject (created on explosion)
        "startSound":-1,
        "numSounds":0,
        "animDelay":4,
        "startFrame":64,
        "numFrames":4,
        "detectRange":3,
        "damage":2,
        "blowAway":0.0030517578125,
        "shadow":true,
        "shake":0,
        "flash":0,
        "dirtEffect":5
      },
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":-1,# nObject (created on trail)
    },
    {
      # noid6
      # Blood
      "detectDistance":0,
      "gravity":0.0152587890625,
      "speed":0.1,
      "speedV":2,
      "distribution":0.30517578125,
      "blowAway":0,
      "bounce":0.2,
      "hitDamage":0,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":false,
      "bloodOnHit":0,
      "startFrame":0,
      "numFrames":0,
      "drawOnMap":false,
      "colorBullets":0,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":true,
      "bloodTrailDelay":1,
      "leaveObjDelay":0,
      "timeToExplo":15,
      "timeToExploV":3,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":-1,# nObject (created on trail)
    },
    {
      # noid7
      # Shells
      "detectDistance":0,
      "gravity":0.0152587890625,
      "speed":0.2,
      "speedV":0.3,
      "distribution":0.1220703125,
      "blowAway":0,
      "bounce":0,
      "hitDamage":0,
      "wormExplode":false,
      "explGround":true,
      "wormDestroy":false,
      "bloodOnHit":0,
      "startFrame":0,
      "numFrames":0,
      "drawOnMap":false,
      "colorBullets":57,
      "affectByExplosions":false,
      "dirtEffect":-1,
      "splinterAmount":0,
      "splinterColour":0,
      "bloodTrail":false,
      "bloodTrailDelay":0,
      "leaveObjDelay":0,
      "timeToExplo":0,
      "timeToExploV":0,
      "createOnExp":-1,# sObject (created on explosion)
      "leaveObj":-1,# sObject (created on trail)
      "splinterType":-1,# nObject (created on trail)
    }
  ],
  "sObjects":[
    {
      # soid0
      # Large explosion
      "startSound":10,
      "numSounds":3,
      "animDelay":4,
      "startFrame":40,
      "numFrames":15,
      "detectRange":35,
      "damage":90,
      "blowAway":0.05340576171875,
      "shadow":true,
      "shake":5,
      "flash":2,
      "dirtEffect":0
    },
    {
      # soid1
      # Medium explosion
      "startSound":10,
      "numSounds":0,
      "animDelay":0,
      "startFrame":45,
      "numFrames":10,
      "detectRange":5,
      "damage":5,
      "blowAway":0.030517578125,
      "shadow":true,
      "shake":32,
      "flash":55,
      "dirtEffect":1
    },
    {
      # soid2
      # Small explosion
      "startSound":25,
      "numSounds":3,
      "animDelay":5,
      "startFrame":104,
      "numFrames":3,
      "detectRange":4,
      "damage":6,
      "blowAway":0.0457763671875,
      "shadow":false,
      "shake":2,
      "flash":1,
      "dirtEffect":2
    },
    {
      # soid3
      # Smoke1 (Hellraider)
      "startSound":-1,
      "numSounds":0,
      "animDelay":2,
      "startFrame":64,
      "numFrames":4,
      "detectRange":2,
      "damage":1,
      "blowAway":0,
      "shadow":false,
      "shake":1,
      "flash":0,
      "dirtEffect":-1
    },
    {
      # soid4
      # Flash
      "startSound":-1,
      "numSounds":0,
      "animDelay":0,
      "startFrame":100,
      "numFrames":0,
      "detectRange":1,
      "damage":0,
      "blowAway":0.000030517578125,
      "shadow":true,
      "shake":0,
      "flash":0,
      "dirtEffect":5
    },
    {
      # soid5
      # Smoke2 (Nuke)
      "startSound":-1,
      "numSounds":0,
      "animDelay":0,
      "startFrame":100,
      "numFrames":0,
      "detectRange":1,
      "damage":2,
      "blowAway":0.0000152587890625,
      "shadow":false,
      "shake":0,
      "flash":0,
      "dirtEffect":-1
    },
    {
      # soid6
      # Flashing pixel
      "startSound":-1,
      "numSounds":0,
      "animDelay":0,
      "startFrame":76,
      "numFrames":2,
      "detectRange":2,
      "damage":1,
      "blowAway":0.0000762939453125,
      "shadow":true,
      "shake":0,
      "flash":0,
      "dirtEffect":-1
    },
    {
      # soid7
      # Teleport flash
      "startSound":-1,
      "numSounds":0,
      "animDelay":4,
      "startFrame":100,
      "numFrames":3,
      "detectRange":0,
      "damage":0,
      "blowAway":0.000030517578125,
      "shadow":true,
      "shake":0,
      "flash":0,
      "dirtEffect":-1
    }
  ],
  "textures":[
    {
      "nDrawBack":true,
      "mFrame":0,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":1,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":2,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":37,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":false,
      "mFrame":0,
      "sFrame":87,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":39,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":false,
      "mFrame":38,
      "sFrame":82,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":99,
      "sFrame":73,
      "rFrame":2
    },
    {
      "nDrawBack":true,
      "mFrame":37,
      "sFrame":73,
      "rFrame":2
    }
  ],
  "colorAnim":[
    129,
    131,
    133,
    136,
    152,
    159,
    168,
    171
  ],
  "textSpritesStartIdx":240,
  "crossHairSprite":153
}

# Add element to array if it does not already exist on the provided array
def add(array, element)
  array.push(element) unless array.include?(element)
end

def parser(config)
  # Parsing weapons
  config[:weapons].each do |weapon|
    next unless weapon[:bulletType].is_a? Hash
    add(config[:wObjects], weapon[:bulletType])
    weapon[:bulletType] = config[:wObjects].index(weapon[:bulletType])
  end

  # Parsing wObjects
  config[:wObjects].each do |wObject|
    # sObjects
    if wObject[:createOnExp].is_a? Hash
      add(config[:sObjects], wObject[:createOnExp])
      wObject[:createOnExp] = config[:sObjects].index(wObject[:createOnExp])
    end
    if wObject[:objTrailType].is_a? Hash
      add(config[:sObjects], wObject[:objTrailType])
      wObject[:objTrailType] = config[:sObjects].index(wObject[:objTrailType])
    end

    # nObjects
    if wObject[:splinterType].is_a? Hash
      add(config[:nObjects], wObject[:splinterType])
      wObject[:splinterType] = config[:nObjects].index(wObject[:splinterType])
    end
    if wObject[:partTrailObj].is_a? Hash
      add(config[:nObjects], wObject[:partTrailObj])
      wObject[:partTrailObj] = config[:nObjects].index(wObject[:partTrailObj])
    end
  end

  # Parsing nObjects
  config[:nObjects].each do |nObject|
    # sObjects
    if nObject[:createOnExp].is_a? Hash
      add(config[:sObjects], nObject[:createOnExp])
      nObject[:createOnExp] = config[:sObjects].index(nObject[:createOnExp])
    end
    if nObject[:leaveObj].is_a? Hash
      add(config[:sObjects], nObject[:leaveObj])
      nObject[:leaveObj] = config[:sObjects].index(nObject[:leaveObj])
    end

    # nObjects
    if nObject[:splinterType].is_a? Hash
      add(config[:nObjects], nObject[:splinterType])
      nObject[:splinterType] = config[:nObjects].index(nObject[:splinterType])
    end
  end
end

def create_file(config)
  file = File.new('mod.json', 'w')
  file.puts(JSON.pretty_generate(config))
  file.close
end

parser(config)
create_file(config)
