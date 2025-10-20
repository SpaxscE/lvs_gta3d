function ENT:CreatePDS()
	-- hood
	local pos, ang, mins, maxs = self:GetBoneInfo( "bonnet" )
	self:AddPDS( {
		pos = pos,
		ang = ang,
		mins = mins,
		maxs = maxs,
		stages = {
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 2 )

					if bgroup == 0 then
						tbl.bodygroup = { [2] = 1 }
					end

					if bgroup == 3 then
						tbl.bodygroup = { [2] = 4 }
					end

					if bgroup == 6 then
						tbl.bodygroup = { [2] = 7 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 2 )

					if bgroup == 1 then
						tbl.bodygroup = { [2] = 2 }
					end

					if bgroup == 4 then
						tbl.bodygroup = { [2] = 5 }
					end

					if bgroup == 7 then
						tbl.bodygroup = { [2] = 8 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				bodygroup = { [2] = 9 },
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 2 )

					if bgroup == 2 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/bonnet_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/bonnet_sc_m_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/bonnet_sc_l_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/gta3d/gibs/premier/bonnet_dam.mdl",
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
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 3 )

					if bgroup == 0 then
						tbl.bodygroup = { [3] = 1 }
					end

					if bgroup == 3 then
						tbl.bodygroup = { [3] = 4 }
					end

					if bgroup == 6 then
						tbl.bodygroup = { [3] = 7 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 3 )

					if bgroup == 1 then
						tbl.bodygroup = { [3] = 2 }
					end

					if bgroup == 4 then
						tbl.bodygroup = { [3] = 5 }
					end

					if bgroup == 7 then
						tbl.bodygroup = { [3] = 8 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				bodygroup = { [3] = 9 },
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 3 )

					if bgroup == 2 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/boot_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/boot_spl_bab_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/gta3d/gibs/premier/boot_spl_mab_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/gta3d/gibs/premier/boot_dam.mdl",
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
					mdl = "models/gta3d/gibs/premier/bump_front_dam.mdl",
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
					mdl = "models/gta3d/gibs/premier/bump_rear_dam.mdl",
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
					mdl = "models/gta3d/gibs/premier/door_lf_dam.mdl",
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
					mdl = "models/gta3d/gibs/premier/door_rf_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- door rear left
	local pos, ang, mins, maxs = self:GetBoneInfo( "door_lr" )
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
					mdl = "models/gta3d/gibs/premier/door_lr_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- door rear right
	local pos, ang, mins, maxs = self:GetBoneInfo( "door_rr" )
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
					mdl = "models/gta3d/gibs/premier/door_rr_dam.mdl",
					target = "placementOrigin",
				},
			},
		}
	} )

	-- headlight left
	self:AddPDS( {
		pos = Vector(90,29,-1),
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


	-- headlight right
	self:AddPDS( {
		pos = Vector(90,-29,-1),
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

	-- taillight left
	self:AddPDS( {
		pos = Vector(-104,27,0),
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
		pos = Vector(-104,-27,0),
		ang = Angle(0,0,0),
		mins = Vector(-10,-10,-10),
		maxs = Vector(10,10,10),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [17] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- turn signal front left
	self:AddPDS( {
		pos = Vector(87,39,-1),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [12] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- turn signal front right
	self:AddPDS( {
		pos = Vector(87,-39,-1),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [14] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- turn signal rear left
	self:AddPDS( {
		pos = Vector(-102,39,0),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [16] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- turn signal rear right
	self:AddPDS( {
		pos = Vector(-102,-39,0),
		ang = Angle(0,0,0),
		mins = Vector(-4,-4,-4),
		maxs = Vector(4,4,4),
		allow_damage = true,
		stages = {
			{
				bodygroup = { [18] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
			},
		}
	} )

	-- windshield
	self:AddPDS( {
		pos = Vector(25.77,0,20.87),
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