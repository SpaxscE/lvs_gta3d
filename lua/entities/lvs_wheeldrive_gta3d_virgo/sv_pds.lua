function ENT:CreatePDS()
	-- hood
	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
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
					mdl = "models/diggercars/gtasa/virgo/bonnet_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- trunk
	local pos, ang, mins, maxs = self:GetBoneInfo( "boot" )
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
					mdl = "models/diggercars/gtasa/virgo/boot_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- front bumper
	local pos, ang, mins, maxs = self:GetBoneInfo( "fb" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [3] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [3] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [3] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/virgo/bump_front_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- rear bumper
	local pos, ang, mins, maxs = self:GetBoneInfo( "rb" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [4] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [4] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [4] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/virgo/bump_rear_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- door front left
	local pos, ang, mins, maxs = self:GetBoneInfo( "dfl" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [6] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [6] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [6] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/virgo/door_lf_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- door front right
	local pos, ang, mins, maxs = self:GetBoneInfo( "dfr" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [5] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [5] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [5] = 3 },
				gib = {
					mdl = "models/diggercars/gtasa/virgo/door_rf_dam.mdl",
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
				bodygroup = { [10] = 1 },
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
				bodygroup = { [9] = 1 },
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
				bodygroup = { [12] = 1 },
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
				bodygroup = { [11] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )
	-- windshield rear
	local pos, ang, mins, maxs = self:GetBoneInfo( "windr" )
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
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [8] = 2 },
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
				bodygroup = { [7] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [7] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	-- glass left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_flg" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [16] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [16] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	-- glass right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_frg" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [15] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [15] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

	-- turnlight left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_flt" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [18] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- turnlight right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_frt" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [17] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- highbeam left
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_flh" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [14] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- highbeam right
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_frh" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		allow_damage = true,
		stages = {
			{
				bodygroup = { [13] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

end