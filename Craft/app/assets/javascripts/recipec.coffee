# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.craftName = (skill) ->
  names = ["Carpentry", "Herb", "Art", "Forging", "Alchemy", "Tailoring"]
  document.write names[skill-1]

root.craftPoints = (points, value) ->
  if points == 0
    points = Math.floor value/125

  if points < 1
    points = 1
  document.write points

root.craftDC = (DC, value) ->
  if DC == 0
    increments = [1000, 1500, 2500, 3500, 5000, 6500, 9000, 12000, 15000, 19500, 25000, 30000, 35000, 40000, 50000, 65000, 75000, 90000, 110000, 130000, 250000, 500000, 750000, 1000000, 1200000, 1400000, 1600000, 1800000, 2000000, 2200000, 2400000, 2600000, 2800000, 3000000, 3200000, 3400000, 3600000, 3800000, 4000000, 4200000, 4400000, 4600000, 4800000, 5000000, 5200000, 5400000, 5600000, 5800000, 6000000, 6200000, 6400000, 6600000, 6800000, 7000000, 7200000, 7400000, 7600000, 7800000, 8000000, 8200000]
    DC = value * 100
    nNth = 0
    while nNth < 60
      nNth++
      if DC <= increments[nNth]
        break
    DC = nNth+1
    if DC == 0
      DC = 1
  document.write DC

root.listClass = (classN) ->
  if classN != 0
    nNth=0
    nBit=1
    sList = ""
    classl = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Wizard", "Arcane Archer", "Assassin", "Champion of Torm", "Dragon Disciple", "Earthkin Defender", "Blackguard", "Harper", "Palemaster", "Shifter", "Weapon Master", "Shadowdancer", "Warlock", "Favored Soul", "Knight"]
    while nNth < 32
      if classN & nBit
        sList += classl[nNth] + "<br>"
      nNth++
      nBit *= 2

    document.write sList

root.classLevel = (level) ->
  if level < 3
    level = 3
  document.write level

root.listSettings = (setting) ->
  if setting != 0
    nbit = 2
    nNth = 1
    message = ""
    slist = ["Hidden", "Surface Races", "Underdark Races", "Highest Level Class Only", "Match All Skills", "Match All Feats", "Ability modified removed from skill check", "Feat bonuses removed from skill check"]
    while nNth < slist.length
      message += slist[nNth] + ": "
      if nbit & setting
        message += "No"
      else
        message += "Yes"

      message += "<br>"
      nbit *= 2
      nNth++

    document.write message

root.listRace = (race) ->
  if race != 0
    lrace = ["Shield Dwarf", "Moon Elf", "Half-Orc", "Human", "Half-Elf", "Lightfoot", "Rock Gnomes", "Duergar", "Drow", "Deep Gnome", "Orog", "Gnoll", "Fey", "Goblin", "Kobold", "Forest Gnome", "Sun Elf", "Wood Elf", "Wild Elf", "Gold Dwarf", "Aasimar", "Tiefling", "Strongheart", "Ghostwise", "Hobgoblin", "Imp", "Ogre", "Wild Dwarf", "Deep Imaskari", "Derro"]
    nbit = 1
    message = ""
    for i in lrace
      if nbit & race
        message += i + "<br>"
      nbit *= 2

    document.write message
