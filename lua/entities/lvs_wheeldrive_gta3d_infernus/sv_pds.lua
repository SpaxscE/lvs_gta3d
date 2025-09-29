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
					mdl = "models/gta3d/gibs/infernus/bonnet_dam.mdl",
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
			{ bodygroup = { [2] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [2] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [2] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/infernus/bump_front_dam.mdl",
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
			{ bodygroup = { [3] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [3] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [3] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/infernus/bump_rear_dam.mdl",
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
			{ bodygroup = { [4] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [4] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [4] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/infernus/door_lf_dam.mdl",
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
			{ bodygroup = { [5] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [5] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [5] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/infernus/door_rf_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- headlight left
	self:AddPDS( {
		pos = Vector(105,29,-7),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [8] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )


	-- headlight right
	self:AddPDS( {
		pos = Vector(105,-29,-7),
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
		pos = Vector(-94,25,2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-20,-10),
		maxs = Vector(10,20,10),
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
	self:AddPDS( {
		pos = Vector(-94,-25,2),
		ang = Angle(0,0,0),
		mins = Vector(-10,-20,-10),
		maxs = Vector(10,20,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [13] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )
	
	-- turn signal front left
	self:AddPDS( {
		pos = Vector(96,38,-7),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [9] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- turn signal front right
	self:AddPDS( {
		pos = Vector(96,-38,-7),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [11] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- windshield
	self:AddPDS( {
		pos = Vector(30,0,12),
		ang = Angle(30,0,0),
		mins = Vector(-15,-30,-5),
		maxs = Vector(15,30,5),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [6] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [6] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )
end