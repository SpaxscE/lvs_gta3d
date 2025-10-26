DEFINE_BASECLASS( "lvs_base_wheeldrive" )

function ENT:StartCommand( ply, cmd )
	BaseClass.StartCommand( self, ply, cmd )

	if self:GetDriver() ~= ply then return end

	local wheel = cmd:GetMouseWheel()

	if wheel == 0 then return end

	if ply:lvsKeyDown( "VIEWDIST" ) then return end

	if self.DisableRadio then return end

	if wheel > 0 then
		self:PrevChannel()
	end

	if wheel < 0 then
		self:NextChannel()
	end
end

function ENT:NextChannel()
	self:SetRadioChannel( self:GetRadioChannel() + 1 )

	if self:GetRadioChannel() > 11 then self:SetRadioChannel( 0 ) end
end

function ENT:PrevChannel()
	self:SetRadioChannel( self:GetRadioChannel() - 1 )

	if self:GetRadioChannel() < 0 then self:SetRadioChannel( 11 ) end
end
