------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       |||||||   	   ||||||               				--
--                         ||||      ||    ||     ||    ||                				--
--                        ||  ||     ||   ||      ||    ||                             	--
--                       ||||||||    ||||||        |||||||                            	--
--                      ||      ||   ||   ||            ||                              --
--                     ||        ||  ||    ||           ||       					    --
--                    ||          || ||     ||     ||||||  								--
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


---------------------------------------
----<A><R><9> -Functions- <A><R><9>----
---------------------------------------

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
--[[
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
]]
--- ERROR Base ---
function WeaponFactoryTweakData:ar15_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AR9_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AR9_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AR9_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AR9ModInit", function(self)

------------------------------------
----<A><R><9> -Arrays- <A><R><9>----
------------------------------------

--- Stocks ---

--- Handguard  ---
-- Default length --


--- Barrel ---
-- Default length --

--- Front Sights ---

--- Gas Blocks ---


--- Barrel Extensions --
local all_ar9ext = {
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
	"wpn_fps_smg_stoy_919_md_dummy",
	"wpn_fps_smg_stoy_919_md_r0635"
}

--- Gadgets (Flashlights/Lasers) ---
local all_ar9fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---
local all_ar9sight = {
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

--- Compatibility Array Insertion ---
if self.wpn_fps_ass_stoy_556 then
	local all_ar15pts = {
		"wpn_fps_ass_stoy_556_st_m4a1",
		"wpn_fps_ass_stoy_556_st_m607",
		"wpn_fps_ass_stoy_556_st_m16a2",
		"wpn_fps_ass_stoy_556_pg_m16a2",
		"wpn_fps_ass_stoy_556_st_ar15",
		"wpn_fps_ass_stoy_556_pg_ar15",
		"wpn_fps_ass_stoy_556_hg_ar15",
		"wpn_fps_ass_stoy_556_hg_m16a2",
		"wpn_fps_ass_stoy_556_hg_m607",
		"wpn_fps_ass_stoy_556_hg_m4a1"
	}
	self.parts.wpn_fps_ass_stoy_556_hg_m16a2.override.wpn_fps_smg_stoy_919_gb_r0635 = {a_obj="a_gb_ar15"}
	self.parts.wpn_fps_ass_stoy_556_hg_ar15.override.wpn_fps_smg_stoy_919_gb_r0635 = {a_obj="a_gb_ar15"}
	for id, part_id in pairs(all_ar15pts) do
		table.insert(self.wpn_fps_smg_stoy_919.uses_parts, part_id)
	end
	table.insert(self.parts.wpn_fps_smg_stoy_919_ba_r0635.forbids, "wpn_fps_ass_stoy_556_hg_m16a2")
	table.insert(self.parts.wpn_fps_smg_stoy_919_ba_r0635.forbids, "wpn_fps_ass_stoy_556_hg_ar15")
end
-----------------------------------
----<A><R><9> -CAFCW- <A><R><9>----
-----------------------------------
if BeardLib.Utils:FindMod("gsup") then
	local AR15SneakySuppressorPack = {
		"wpn_fps_ass_ns_g_sup3",
		"wpn_fps_ass_ns_g_sup4",
		"wpn_fps_ass_ns_g_sup5"
	}
	for id, part_id in pairs(AR15SneakySuppressorPack) do
		table.insert(self.wpn_fps_smg_stoy_919.uses_parts, part_id)
		table.insert(all_ar9ext, part_id)
	end
end

if BeardLib.Utils:FindMod("Tromix Barrel-Ext") then
	table.insert(self.wpn_fps_smg_stoy_919.uses_parts, "wpn_fps_upg_ns_ass_smg_tromix")	
	table.insert(all_ar9ext, "wpn_fps_upg_ns_ass_smg_tromix")
end

if BeardLib.Utils:FindMod("M82 Muzzle Brake") then
	table.insert(all_ar9ext, "wpn_fps_upg_ns_m82")
	table.insert(all_ar9ext, "wpn_fps_upg_ns_aw50")
end


--------------------------------------
----<A><R><9> -Override- <A><R><9>----
--------------------------------------

--- Barrels ---

--- Handguard ---

--FL overrides--
--self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override.wpn_fps_addon_ris = {unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
--for i, fl_id in pairs(all_ar15fl) do
--	if fl_id ~= "wpn_fps_addon_ris" then
--		self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[fl_id] = {a_obj="a_fl_m4a1"}
--	end
--end
--GB override--
--for id, gb_id in pairs(all_ar15gb) do
--	self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[gb_id] = {a_obj="a_gb_car15"}
--end
--MD override--
for id, ext_id in pairs(all_ar9ext) do
	if ext_id ~= "wpn_fps_smg_stoy_919_md_dummy" then
		self.parts.wpn_fps_ass_stoy_556_ba_ar6951.override[ext_id] = {a_obj="a_ns_ar6951"}
	end
end
--- Lowers/Carry Handle ---
--O override--

----------------------------------
----<A><R><9> -Adds- <A><R><9>----
----------------------------------
for i, o_id in pairs(all_ar9sight) do
	self.wpn_fps_smg_stoy_919.adds[o_id] = {"wpn_fps_smg_stoy_919_sm_base","wpn_fps_smg_stoy_919_sm_knob"}
end
-------------------------------------
----<A><R><9> -Forbids- <A><R><9>----
-------------------------------------
for i, fl_id in pairs(all_ar9fl) do
	table.insert(self.parts.wpn_fps_smg_stoy_919_hg_r0635.forbids, fl_id)
end
------------------------------------
----<A><R><9> -Stance- <A><R><9>----
------------------------------------

--- Vanilla sights ---
-- non-acoc, default sights --
for i, o_id in pairs(nonacog_arsight) do
	self.parts[o_id].stance_mod.wpn_fps_smg_stoy_919 = {translation = Vector3(0, 7, -5.05)}
end
-- other sights --
self.parts.wpn_fps_upg_o_acog.stance_mod.wpn_fps_smg_stoy_919 			  = {translation = Vector3(0, 5, -5.05)}
self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_smg_stoy_919 		   	  = deep_clone(self.parts.wpn_fps_upg_o_45rds.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_smg_stoy_919 = deep_clone(self.parts.wpn_fps_upg_o_xpsg33_magnifier.stance_mod.wpn_fps_ass_flint)
self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_smg_stoy_919 		  = deep_clone(self.parts.wpn_fps_upg_o_45rds_v2.stance_mod.wpn_fps_ass_flint)

------------------------------------
----<A><R><9> -Tweaks- <A><R><9>----
------------------------------------

--- Barrel Extensions ---
self.parts.wpn_fps_smg_stoy_919_md_dummy.pcs = nil

------------------------------------
----<A><R><9> -CLONES- <A><R><9>----
------------------------------------

---------------------------------
----<A><R><9> -WIP- <A><R><9>----
---------------------------------

end )
