AddCSLuaFile()


SWEP.PrintName = "Confetti Gun"
SWEP.Slot = 5
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Author = "Zaktak"
SWEP.Instructions = ""
SWEP.Contact = "via Steam"
SWEP.Purpose = ""

SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/c_rpg.mdl")
SWEP.WorldModel = Model("models/weapons/w_rocket_launcher.mdl")

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "Zaktak's"

SWEP.DoorSound = Sound("physics/wood/wood_box_impact_hard3.wav")
SWEP.VehicleSound = Sound("physics/plastic/plastic_barrel_break1.wav") -- Sound("physics/metal/metal_popcan_impact_hard1.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = 0     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false     -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

SWEP.DoorMaxSize = 250 		-- Maximum size of door the ram can open.



--[[-------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
	self:SetColor( Color(255,125,220) )
    self:SetHoldType("normal")
end


--[[-------------------------------------------------------
Name: isAiming()
Desc: Returns if the player is aiming according to holdtype
---------------------------------------------------------]]
local function isAiming(wep)
	if ( wep:GetHoldType() == "normal" ) then 
		return false
	else 
		return true 
	end
end

--[[-------------------------------------------------------
Name: PrimaryAttack()
Desc: Called on left click
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
	local rammed = false
	if ( !isAiming(self) ) then return end

	local ply = self.Owner
	if ( !IsValid(ply) or !IsValid(self) ) then return end

	local tr = ply:GetEyeTrace().Entity
	local vPoint = self:LocalToWorld( Vector(15, 0, 25) )
	local effectdata = EffectData()
	effectdata:SetOrigin( vPoint )
	effectdata:SetAngles( self.Owner:EyeAngles() )
	util.Effect( "holiday_thrust", effectdata )
	self:EmitSound("holiday/confe.wav")
	self:SetNextPrimaryFire( CurTime() + (15 * 60) )
end



--[[-------------------------------------------------------
Name: PrimaryAttack()
Desc: Called on right click
---------------------------------------------------------]]
function SWEP:SecondaryAttack()
	if CLIENT then return end
	if ( !isAiming(self) ) then 
		self:SetHoldType("rpg") 
	else
		self:SetHoldType("normal") 
	end
end