Hooks:PostHook( WeaponTweakData, "init", "AR15ModInit", function(self)

if ( self.stoy_556 ) then

---- CAP aka YEEET ----	

--- Base stuff ---	
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 4.1, -0.3 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( 0.6, 0, -0.3 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_gl", 
        base_a_obj = "a_fl", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -1.5, 3.9 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_os", 
        base_a_obj = "a_os", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
        name = "a_bolt_ar15",
        base_a_obj = "a_body",
        part_attach_data = {{"wpn_fps_ass_stoy_556_ch_ar15"},"g_charginghandle"},
        position = Vector3(0, 0, 0),
        rotation = RotationCAP(0, 0, 0)
    })
--- Gas Block ---
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_gb_car15", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -12.75, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
--- MDs ---
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_ns_m4", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -8.65, -0.3 ),
        rotation = Rotation( 0, 0, 0 )
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_ns_car15", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -18.75, -0.3 ),
        rotation = Rotation( 0, 0, 0 )
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_ns_m733", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, -15.15, -0.3 ),
        rotation = Rotation( 0, 0, 0 )
	})
--- Sights ---
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_o_lower", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -1.5, -0.5 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
--- Gadgets ---
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_fl_m4a1", 
        base_a_obj = "a_fl", 
        position = Vector3( -0.15, 0, -0.3 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
end
end)



