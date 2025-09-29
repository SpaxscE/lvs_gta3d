function ENT:CreatePDS()
	-- hood
	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
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
					mdl = "models/gta3d/gibs/blade/bonnet_dam.mdl",
					target = "placementOrigin",
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
			{ bodygroup = { [5] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [5] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [5] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/blade/boot_dam.mdl",
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
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 6 )

					if bgroup == 0 then
						tbl.bodygroup = { [6] = 1 }
					end

					if bgroup == 3 then
						tbl.bodygroup = { [6] = 4 }
					end

					if bgroup == 6 then
						tbl.bodygroup = { [6] = 7 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 6 )

					if bgroup == 1 then
						tbl.bodygroup = { [6] = 2 }
					end

					if bgroup == 4 then
						tbl.bodygroup = { [6] = 5 }
					end

					if bgroup == 7 then
						tbl.bodygroup = { [6] = 8 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				bodygroup = { [6] = 9 },
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 6 )

					if bgroup == 2 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/bump_front_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/fbmp_lr_bl1_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/fbmp_lr_bl2_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/gta3d/gibs/blade/bump_front_dam.mdl",
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
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 7 )

					if bgroup == 0 then
						tbl.bodygroup = { [7] = 1 }
					end

					if bgroup == 3 then
						tbl.bodygroup = { [7] = 4 }
					end

					if bgroup == 6 then
						tbl.bodygroup = { [7] = 7 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 7 )

					if bgroup == 1 then
						tbl.bodygroup = { [7] = 2 }
					end

					if bgroup == 4 then
						tbl.bodygroup = { [7] = 5 }
					end

					if bgroup == 7 then
						tbl.bodygroup = { [7] = 8 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				bodygroup = { [7] = 9 },
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 7 )

					if bgroup == 2 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/bump_rear_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/rbmp_lr_bl1_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/gta3d/gibs/blade/rbmp_lr_bl2_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/gta3d/gibs/blade/bump_rear_dam.mdl",
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
			{ bodygroup = { [8] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [8] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [8] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/blade/door_lf_dam.mdl",
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
			{ bodygroup = { [9] = 1 }, sound = "SA_Collision" },
			{ bodygroup = { [9] = 2 }, sound = "SA_Collision" },
			{
				sound = "SA_Collision",
				bodygroup = { [9] = 3 },
				gib = {
					mdl = "models/gta3d/gibs/blade/door_rf_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- headlight left
	self:AddPDS( {
		pos = Vector(92,33,-5),
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
	
	-- highbeam left
	self:AddPDS( {
		pos = Vector(94,20,-5),
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

	-- headlight right
	self:AddPDS( {
		pos = Vector(92,-33,-5),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [13] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )
	
	-- highbeam right
	self:AddPDS( {
		pos = Vector(94,-20,-5),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [14] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight left
	self:AddPDS( {
		pos = Vector(-118,33,-3),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [15] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- taillight right
	self:AddPDS( {
		pos = Vector(-118,-33,-3),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [16] = 1 },
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
end