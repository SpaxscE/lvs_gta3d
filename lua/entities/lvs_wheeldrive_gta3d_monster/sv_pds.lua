function ENT:CreatePDS()

	-- door rear left
	local pos, ang, mins, maxs = self:GetBoneInfo( "dfl" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [2] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [2] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [2] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/monster/door_lf_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- door rear right
	local pos, ang, mins, maxs = self:GetBoneInfo( "dfr" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [1] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [1] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [1] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/monster/door_rf_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- headlight left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_fl" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [6] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- headlight right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_fr" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [5] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- taillight left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_rl" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [8] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_rr" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [7] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- glass left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_flh" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [10] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [10] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	-- glass right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_frh" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [9] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [9] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	-- windshield
	local pos, ang, mins, maxs = self:GetBoneInfo( "wind" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [3] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [3] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	local pos, ang, mins, maxs = self:GetBoneInfo( "windr" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [4] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [4] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )


end