# https://github.com/Victorcorcos/liero-hacks/tree/main/mods#the-connection-between-objects-

# weapons => bulletType: refers to the wObject id. Created on gunshot.

# wObject => createOnExp: refers to sObject id. Created on explosion.
# wObject => splinterType: refers to nObject id. Created on explosion. splinterAmount refers to the ammount.
# wObject => objTrailType: refers to sObject id. Created on trail.
# wObject => partTrailObj: refers to nObject id. Created on trail.

# nObject => createOnExp: refers to sObject id. Created on explosion.
# nObject => splinterType: refers to nObject id. Created on explosion. splinterAmount refers to the ammount.
# nObject => leaveObj: refers to sObject id. Created on trail.

require 'json'

# Execute this file with: `ruby parser.rb`
# It will generate the 'mod.json' file in a format importable by webliero.

# This file ease the proccess to create liero mods

# I noticed that, during the proccess to create a liero mod, we need to
# Create the `weapons`, `wObjects`, `nObjects` and `sObjects`.
# They are all related, but difficult to create and maintain, because they are on different parts of the json structure
# We need to jump over the json to find the objects related to each other,
# which is kinda boring and unnecessarily difficult to deal with.

# This file simplifies the `mod.json` file by already linking the related objects inside the json structure.
# Thus creating a more user friendly interface to work with.

# Change/Add weapons here!
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
   "weapons": [
      {
        # SHOTGUN
        "name":"SHOTGUN",
        "parts":10,
        "bulletSpeed":2.3,
        "bulletSpeedInherit":0,
        "distribution":0.4999847412109375,
        "recoil":0.25,
        "ammo":8,
        "delay":56,
        "loadingTime":680,
        "leaveShells":1,
        "leaveShellDelay":28,
        "fireCone":4,
        "laserSight":false,
        "laserBeam":false,
        "launchSound":0,
        "playReloadSound":true,
        "bulletType":0 # wObject id
     }
   ],
   "wObjects":[
      {
         # SHOTGUN wObject (from weapons bulletType)
         "detectDistance":1,
         "blowAway":0.05,
         "gravity":0.002288818359375,
         "exploSound":10,
         "addSpeed":3,
         "distribution":0.4999847412109375,
         "multSpeed":1,
         "dirtEffect":-1,
         "wormExplode":false,
         "explGround":true,
         "wormCollide":true,
         "collideWithObjects":true,
         "affectByExplosions":true,
         "bounce":0,
         "bounceFriction":0.8,
         "timeToExplo":0,
         "timeToExploV":0,
         "hitDamage":10,
         "bloodOnHit":1,
         "startFrame":-1,
         "numFrames":0,
         "loopAnim":false,
         "shotType":4,
         "repeat":8,
         "colorBullets":161,
         "splinterColour":71,
         "splinterScatter":1,
         "objTrailDelay":0,
         "partTrailType":0,
         "partTrailDelay":0,
         "speed":230,
         "createOnExp":-1, # sObject created on explosion
         "splinterType":0, # nObject created on explosion
         "splinterAmount":0, # ^ Ammount
         "objTrailType":-1, # sObject created on trail
         "partTrailObj":-1  # nObject created on trail
      }
   ],
   "nObjects":[
      {
         # SHOTGUN nObject (from wObject splinterType)
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
         "splinterColour":0,
         "bloodTrail":false,
         "bloodTrailDelay":0,
         "leaveObjDelay":1,
         "timeToExplo":10,
         "timeToExploV":3,
         "createOnExp":-1,  # sObject created on explosion
         "splinterType":-1, # nObject created on explosion
         "splinterAmount":0,# ^ Ammount
         "leaveObj":1 # sObject created on trail
      }
   ],
   "sObjects":[
      {
         # SHOTGUN sObject (from wObject createOnExp)
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
      {
         # SHOTGUN sObject (from nObject leaveObj)
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

def create_file(config)
  file = File.new('mod.json', 'w')
  file.puts(JSON.pretty_generate(config))
  file.close
end

create_file(config)