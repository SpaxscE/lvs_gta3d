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
					mdl = "models/diggercars/gtasa/tractor/bonnet_dam.mdl",
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
				bodygroup = { [3] = 1 },
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
				bodygroup = { [2] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight
	local pos, ang, mins, maxs = self:GetBoneInfo( "l_rl" )
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
				sound = "SA_Break_Light",
			},
		}
	} )


end