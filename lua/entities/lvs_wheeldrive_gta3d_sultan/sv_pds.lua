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
					mdl = "models/diggercars/gtasa/sultan/bonnet_dam.mdl",
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
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/boot_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/boot1_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/boot2_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/diggercars/gtasa/sultan/boot_dam.mdl",
					target = "placementOrigin",
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
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_front_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_front1_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_front2_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/diggercars/gtasa/sultan/bump_front_dam.mdl",
					target = "placementOrigin",
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
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 4 )

					if bgroup == 0 then
						tbl.bodygroup = { [4] = 1 }
					end

					if bgroup == 3 then
						tbl.bodygroup = { [4] = 4 }
					end

					if bgroup == 6 then
						tbl.bodygroup = { [4] = 7 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 4 )

					if bgroup == 1 then
						tbl.bodygroup = { [4] = 2 }
					end

					if bgroup == 4 then
						tbl.bodygroup = { [4] = 5 }
					end

					if bgroup == 7 then
						tbl.bodygroup = { [4] = 8 }
					end
				end,
				sound = "SA_Collision",
			},
			{
				bodygroup = { [4] = 9 },
				Callback = function( tbl, ent, pds, speed )
					local bgroup = self:GetBodygroup( 4 )

					if bgroup == 2 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_rear_dam.mdl"
					end

					if bgroup == 5 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_rear1_dam.mdl"
					end

					if bgroup == 8 then
						tbl.gib.mdl = "models/diggercars/gtasa/sultan/bump_rear2_dam.mdl"
					end
				end,
				sound = "SA_Collision",
				gib = {
					mdl = "models/diggercars/gtasa/sultan/bump_rear_dam.mdl",
					target = "placementOrigin",
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
					mdl = "models/diggercars/gtasa/sultan/door_lf_dam.mdl",
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
					mdl = "models/diggercars/gtasa/sultan/door_rf_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- door rear left
	local pos, ang, mins, maxs = self:GetBoneInfo( "drl" )
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
					mdl = "models/diggercars/gtasa/sultan/door_lr_dam.mdl",
					pos = Vector(0,0,0),
					ang = Angle(0,0,0),
				},
			},
		}
	} )

	-- door rear right
	local pos, ang, mins, maxs = self:GetBoneInfo( "drr" )
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
					mdl = "models/diggercars/gtasa/sultan/door_rr_dam.mdl",
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
				bodygroup = { [14] = 1 },
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
				bodygroup = { [13] = 1 },
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
				bodygroup = { [16] = 1 },
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
				bodygroup = { [15] = 1 },
				effect = "GlassImpact",
				sound = "SA_Break_Light",
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
				bodygroup = { [12] = 1 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_cup_break1.wav",
			},
			{
				bodygroup = { [12] = 2 },
				effect = "GlassImpact",
				sound = "physics/glass/glass_largesheet_break1.wav",
			},
		}
	} )

end