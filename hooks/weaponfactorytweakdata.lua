------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       |||||||   	   ||||   ||||||             			--
--                         ||||      ||    ||     || ||   ||             				--
--                        ||  ||     ||   ||         ||   ||                           	--
--                       ||||||||    ||||||          ||   |||||                         --
--                      ||      ||   ||   ||         ||       ||                        --
--                     ||        ||  ||    ||        ||       ||					    --
--                    ||          || ||     ||    ||||||| |||||  						--
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--						  	 		   > [Functions]									--
--									   > [Arrays]		   								--
--									   > [Override]				    					--
--									   > [Adds] 										--
--									   > [Forbids] 										--
--									   > [Stance]										--
--									   > [Underbarrel] 							    	--
--									   > [Tweaks] 										--
--									   > [WIP] 											--
--																						--
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


---------------------------------------------
----<A><R><1><5> -Functions- <A><R><1><5>----
---------------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:arpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:arpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:arpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- Part Copy Base ---
function WeaponFactoryTweakData:ar15_copy_part( att_og, att_cp )
    if self.parts[att_og] then
        self.parts[att_cp] = deep_clone(self.parts[att_og])
        self.parts[att_cp].pcs = {}
        self.parts[att_cp].is_a_unlockable = true
        table.insert(self.wpn_fps_ass_stoy_556.uses_parts, att_cp)
    else
        self:ar15_write_error( "copy_part", "fti", "part", att_og )    
    end
end

--- ERROR Base ---
function WeaponFactoryTweakData:ar15_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AR15ModInit", function(self)

------------------------------------------
----<A><R><1><5> -Arrays- <A><R><1><5>----
------------------------------------------

--- Stocks ---
local all_ar15stock = {
	"wpn_fps_ass_stoy_556_st_m16"
}
--- Handguard  ---
-- Default length --
local all_ar15handguard = {
	"wpn_fps_ass_stoy_556_hg_ar15",
	"wpn_fps_ass_stoy_556_hg_m16",
	"wpn_fps_ass_stoy_556_hg_m16a2",
	"wpn_fps_ass_stoy_556_hg_m607",
	"wpn_fps_ass_stoy_556_hg_m4",
	"wpn_fps_ass_stoy_556_hg_m4a1"
}

--- Barrel ---
-- Default length --
local all_ar15barrel = {
	"wpn_fps_ass_stoy_556_ba_ar15",
	"wpn_fps_ass_stoy_556_ba_m16a1",
	"wpn_fps_ass_stoy_556_ba_m16a2",
	"wpn_fps_ass_stoy_556_ba_car15",
	"wpn_fps_ass_stoy_556_ba_m733",
	"wpn_fps_ass_stoy_556_ba_m4",
	"wpn_fps_ass_stoy_556_ba_m4_short"
}

--- Front Sights ---
local all_ar15fo = {
	"wpn_fps_ass_stoy_556_fo_ak9"
}
--- Gas Blocks ---
local all_ar15gb = {
	"wpn_fps_ass_stoy_556_gb_ar15",
	"wpn_fps_ass_stoy_556_gb_m16a1",
	"wpn_fps_ass_stoy_556_gb_m16a4"
}

--- Barrel Extensions --
local all_ar15ext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_stoy_556_md_dummy",
	"wpn_fps_ass_stoy_556_md_ar15",
	"wpn_fps_ass_stoy_556_md_m16a1",
	"wpn_fps_ass_stoy_556_md_m16a2",
	"wpn_fps_ass_stoy_556_md_car15"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ar15fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ar15sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local nonacog_arsight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}


--- Grips ---
local all_ar15grips = {
	"wpn_fps_ass_stoy_556_pg_m16"
}

--- Compatibility Array Insertion ---

-----------------------------------------
----<A><R><1><5> -CAFCW- <A><R><1><5>----
-----------------------------------------
if BeardLib.Utils:FindMod("gsup") then
	local AR15SneakySuppressorPack = {
		"wpn_fps_ass_ns_g_sup3",
		"wpn_fps_ass_ns_g_sup4",
		"wpn_fps_ass_ns_g_sup5"
	}
	for id, part_id in pairs(AR15SneakySuppressorPack) do
		table.insert(self.wpn_fps_ass_stoy_556.uses_parts, part_id)
		table.insert(all_ar15ext, part_id)
	end
end

if BeardLib.Utils:FindMod("Tromix Barrel-Ext") then
	table.insert(self.wpn_fps_ass_stoy_556.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(all_ar15ext, "wpn_fps_upg_ns_ass_smg_tromix")
end

if BeardLib.Utils:FindMod("M82 Muzzle Brake") then
	table.insert(all_ar15ext, "wpn_fps_upg_ns_m82")
	table.insert(all_ar15ext, "wpn_fps_upg_ns_aw50")
end


--------------------------------------------
----<A><R><1><5> -Override- <A><R><1><5>----
--------------------------------------------

--- Barrels ---
for id, ba_id in pairs(all_ar15barrel) do
	self:arpack_check_override( "part", ba_id )
end
--- Handguard ---
for id, hg_id in pairs(all_ar15handguard) do
	self:arpack_check_override( "part", hg_id )
end
--FL overrides--
self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override.wpn_fps_addon_ris = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
for i, fl_id in pairs(all_ar15fl) do
	if fl_id ~= "wpn_fps_addon_ris" then
		self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[fl_id] = {a_obj="a_fl_m4a1"}
	end
end
--GB override--
for id, gb_id in pairs(all_ar15gb) do
	self.parts.wpn_fps_ass_stoy_556_hg_m607.override[gb_id] = {a_obj="a_gb_car15"}
	self.parts.wpn_fps_ass_stoy_556_hg_m4.override[gb_id] 	= {a_obj="a_gb_car15"}
	self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[gb_id] = {a_obj="a_gb_car15"}
end
--MD override--
for id, ext_id in pairs(all_ar15ext) do
	if ext_id ~= "wpn_fps_ass_stoy_556_md_dummy" then
		self.parts.wpn_fps_ass_stoy_556_ba_car15.override[ext_id] = {a_obj="a_ns_car15"}
		self.parts.wpn_fps_ass_stoy_556_ba_m733.override[ext_id]  = {a_obj="a_ns_m733"}
		self.parts.wpn_fps_ass_stoy_556_ba_m4.override[ext_id] 	  = {a_obj="a_ns_m4"}
	end
end
--- Lowers/Carry Handle ---
--O override--
for i, o_id in pairs(all_ar15sight) do
	self.parts.wpn_fps_ass_stoy_556_ur_m16a3.override[o_id] = {a_obj="a_o_lower", stance_mod={wpn_fps_ass_stoy_556 = {translation = Vector3(0, 5, -0.65)}}}
	self.parts.wpn_fps_ass_stoy_556_ca_m16a3.override.wpn_fps_ass_stoy_556_ur_m16a3 = {override = {o_id = {}}}
	self.parts.wpn_fps_ass_stoy_556_ur_m16a4.override[o_id] = {a_obj="a_o_lower", stance_mod={wpn_fps_ass_stoy_556 = {translation = Vector3(0, 5, -0.65)}}}
	self.parts.wpn_fps_ass_stoy_556_ur_m16a4.override.wpn_fps_ass_stoy_556_ur_m16a3 = {override = {o_id = {}}}
end
----------------------------------------
----<A><R><1><5> -Adds- <A><R><1><5>----
----------------------------------------
for i, o_id in pairs(all_ar15sight) do
	self.wpn_fps_ass_stoy_556.adds[o_id] = {"wpn_fps_ass_stoy_556_sm_base","wpn_fps_ass_stoy_556_sm_knob"}
end
-------------------------------------------
----<A><R><1><5> -Forbids- <A><R><1><5>----
-------------------------------------------
for i, fl_id in pairs(all_ar15fl) do
	table.insert(self.parts.wpn_fps_ass_stoy_556_hg_m16.forbids, fl_id)
	table.insert(self.parts.wpn_fps_ass_stoy_556_hg_ar15.forbids, fl_id)
	table.insert(self.parts.wpn_fps_ass_stoy_556_hg_m607.forbids, fl_id)
end
------------------------------------------
----<A><R><1><5> -Stance- <A><R><1><5>----
------------------------------------------

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in pairs(nonacog_arsight) do
	self.parts[o_id].stance_mod.wpn_fps_ass_stoy_556 = {translation = Vector3(0, 7, -5.05)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_ass_stoy_556 			  = {translation = Vector3(0, 5, -5.05)}
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_stoy_556 		   	  = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_stoy_556 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_stoy_556 		  = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

------------------------------------------
----<A><R><1><5> -Tweaks- <A><R><1><5>----
------------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_ass_stoy_556_md_dummy.pcs = nil

------------------------------------------
----<A><R><1><5> -CLONES- <A><R><1><5>----
------------------------------------------

---------------------------------------
----<A><R><1><5> -WIP- <A><R><1><5>----
---------------------------------------

end )
