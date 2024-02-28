extends Node

const ICON_PATH = "res://Textures/Items/"

const UPGRADES = {
	"damageup1": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 5",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"damageup2": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 7",
		"level": "Level: 2",
		"prerequisite": ["damageup1"],
		"type": "upgrade"
	},
	"damageup3": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 9",
		"level": "Level: 3",
		"prerequisite": ["damageup2"],
		"type": "upgrade"
	},
	"damageup4": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 11",
		"level": "Level: 4",
		"prerequisite": ["damageup3"],
		"type": "upgrade"
	},
	"damageup5": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 13",
		"level": "Level: 5",
		"prerequisite": ["damageup4"],
		"type": "upgrade"
	},
	"damageup6": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 15",
		"level": "Level: 6",
		"prerequisite": ["damageup5"],
		"type": "upgrade"
	},
	"damageup7": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 17",
		"level": "Level: 7",
		"prerequisite": ["damageup6"],
		"type": "upgrade"
	},
	"damageup8": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 19",
		"level": "Level: 8",
		"prerequisite": ["damageup7"],
		"type": "upgrade"
	},
	"damageup9": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 21",
		"level": "Level: 9",
		"prerequisite": ["damageup8"],
		"type": "upgrade"
	},
	"damageup10": {
		"icon": ICON_PATH + "damageup.png",
		"displayname": "Damage Up",
		"details": "Increase bullet damage by 2. Current: 23",
		"level": "Level: 10",
		"prerequisite": ["damageup9"],
		"type": "upgrade"
	},
	"fireup1": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"fireup2": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 2",
		"prerequisite": ["fireup1"],
		"type": "upgrade"
	},
	"fireup3": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 3",
		"prerequisite": ["fireup2"],
		"type": "upgrade"
	},
	"fireup4": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 4",
		"prerequisite": ["fireup3"],
		"type": "upgrade"
	},
	"fireup5": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 5",
		"prerequisite": ["fireup4"],
		"type": "upgrade"
	},
	"fireup6": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 6",
		"prerequisite": ["fireup5"],
		"type": "upgrade"
	},
	"fireup7": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 7",
		"prerequisite": ["fireup6"],
		"type": "upgrade"
	},
	"fireup8": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 8",
		"prerequisite": ["fireup7"],
		"type": "upgrade"
	},
	"fireup9": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 9",
		"prerequisite": ["fireup8"],
		"type": "upgrade"
	},
	"fireup10": {
		"icon": ICON_PATH + "firerateup.png",
		"displayname": "Fire Rate Up",
		"details": "Increase fire rate",
		"level": "Level: 10",
		"prerequisite": ["fireup9"],
		"type": "upgrade"
	},
	"speedup1": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"speedup2": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 2",
		"prerequisite": ["speedup1"],
		"type": "upgrade"
	},
	"speedup3": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 3",
		"prerequisite": ["speedup2"],
		"type": "upgrade"
	},
	"speedup4": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 4",
		"prerequisite": ["speedup3"],
		"type": "upgrade"
	},
	"speedup5": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 5",
		"prerequisite": ["speedup4"],
		"type": "upgrade"
	},
	"speedup6": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 7",
		"prerequisite": ["speedup5"],
		"type": "upgrade"
	},
	"speedup7": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 8",
		"prerequisite": ["speedup6"],
		"type": "upgrade"
	},
	"speedup8": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 9",
		"prerequisite": ["speedup7"],
		"type": "upgrade"
	},
	"speedup9": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 10",
		"prerequisite": ["speedup8"],
		"type": "upgrade"
	},
	"speedup10": {
		"icon": ICON_PATH + "speedup.png",
		"displayname": "Speed Up",
		"details": "Increase Speed by 10%",
		"level": "Level: 10",
		"prerequisite": ["speedup9"],
		"type": "upgrade"
	},
	"heart": {
		"icon": ICON_PATH + "heart.png",
		"displayname": "Heart",
		"details": "Heal 20 Health",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "item"
	},
}
