function ENT:CreatePDS()
	-- hood
	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [2] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [2] = 2 }, sound = "SA_Collision", maxvelocity = 500 },
			{
				sound = "SA_Collision",
				bodygroup = { [2] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/buffalo/bonnet_dam.mdl",
					target = "placementOrigin",
					--pos = Vector(64,0,14),
					--ang = Angle(0,0,0),
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
			{ bodygroup = { [3] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [3] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [3] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/buffalo/boot_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- front bumper
	local pos, ang, mins, maxs = self:GetBoneInfo( "bump_front" )
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
					mdl = "models/gta3d/gibs/buffalo/bump_front_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- rear bumper
	local pos, ang, mins, maxs = self:GetBoneInfo( "bump_rear" )
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
					mdl = "models/gta3d/gibs/buffalo/bump_rear_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- door front left
	local pos, ang, mins, maxs = self:GetBoneInfo( "door_lf" )
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
					mdl = "models/gta3d/gibs/buffalo/door_lf_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- door front right
	local pos, ang, mins, maxs = self:GetBoneInfo( "door_rf" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{ bodygroup = { [7] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [7] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [7] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/buffalo/door_rf_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- headlight left
	self:AddPDS( {
		pos = Vector(96,32,-2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [9] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- headlight right
	self:AddPDS( {
		pos = Vector(96,-32,-2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [10] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight left
	self:AddPDS( {
		pos = Vector(-99,26,2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [11] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight right
	self:AddPDS( {
		pos = Vector(-99,-26,2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [12] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- windshield
	self:AddPDS( {
		pos = Vector(15,0,15),
		ang = Angle(30,0,0),
		mins = Vector(-15,-30,-5),
		maxs = Vector(15,30,5),
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
end