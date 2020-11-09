# github.com/Victorcorcos/liero-hacks/tree/main/mods#the-connection-between-objects-

require 'json'

# Execute this file with: `ruby parser.rb`
# It will generate the 'mod.json' file in a format importable by webliero.

# This file is created with the purpose to ease the proccess to create the association between objects in liero mods
# Instead of requiring to place indexes on the json file structure. For example...
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

# Change / Add your weapons here!
config = {
   "soundpack":"csliero.zip",
   "constants": {
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
       # wid0
       "name": "SHOTGUN",
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
         # woid0 => "SHOTGUN"
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
         "createOnExp": 2,# soid (created on explosion)
         "objTrailType": -1,# soid (created on trail)
         "splinterType": 4,# noid (created on explosion)
         "partTrailObj": -1# noid (created on trail)
       }
     }
   ],
   "wObjects": [],
   "nObjects": [
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":6,# noid (created on trail)
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":6,# noid (created on trail)
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":2,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
         # "leaveObj": {
         #    # soid7
         #    # Teleport flash
         #    "startSound":-1,
         #    "numSounds":0,
         #    "animDelay":4,
         #    "startFrame":100,
         #    "numFrames":3,
         #    "detectRange":0,
         #    "damage":0,
         #    "blowAway":0.000030517578125,
         #    "shadow":true,
         #    "shake":0,
         #    "flash":0,
         #    "dirtEffect":-1
         # }
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":1,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
         #  "leaveObj": {
         #    # soid6
         #    # Flashing pixel
         #    # (SHOTGUN leaveObj)
         #    "startSound":-1,
         #    "numSounds":0,
         #    "animDelay":0,
         #    "startFrame":76,
         #    "numFrames":2,
         #    "detectRange":2,
         #    "damage":1,
         #    "blowAway":0.0000762939453125,
         #    "shadow":true,
         #    "shake":0,
         #    "flash":0,
         #    "dirtEffect":-1
         # },
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
         "createOnExp":0,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
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
         "createOnExp":-1,# soid (created on explosion)
         "leaveObj":-1,# soid (created on trail)
         "splinterType":-1,# noid (created on trail)
      }
   ],
   "sObjects": [
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
         # Flashing pixel
         # (SHOTGUN leaveObj)
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
         # soid2
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
   ],
   "textures": [
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
   "colorAnim": [
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

def parser(config)
  config[:weapons].each do |weapon|
    next unless weapon[:bulletType].is_a? Hash
    config[:wObjects].push(weapon[:bulletType])
    weapon[:bulletType] = config[:wObjects].length - 1
  end

  config[:wObjects].each do |wObject|

  end
end

def create_file(config)
  file = File.new('mod.json', 'w')
  file.puts(JSON.pretty_generate(config))
  file.close
end

parser(config)
create_file(config)
