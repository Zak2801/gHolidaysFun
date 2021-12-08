function EFFECT:Init( data )

	local vOffset = data:GetOrigin()
	--local Color = data:GetStart()

	local Colors = { Color( 250, 150, 255 ), Color( 255, 225, 255 ), Color( 255, 255, 255 ), Color( 255, 100, 250 ) }

	local NumParticles = math.random(9, 15)

	local emitter = ParticleEmitter( vOffset, true )

	for i = 0, NumParticles do
		local Color = table.Random(Colors)
		local Pos = Vector( math.Rand( -1, 1 ), math.Rand( -1, 1 ), math.Rand( -1, 1 ) )

		local particle = emitter:Add( "particles/balloon_bit", vOffset + Pos * 8 )
		if ( particle ) then

			particle:SetVelocity( Pos * 300 )

			particle:SetLifeTime( 0 )
			particle:SetDieTime( 10 )

			particle:SetStartAlpha( 255 )
			particle:SetEndAlpha( 255 )

			local Size = math.Rand( 1, 3 )
			particle:SetStartSize( Size )
			particle:SetEndSize( 0 )

			particle:SetRoll( math.Rand( 0, 360 ) )
			particle:SetRollDelta( math.Rand( -2, 2 ) )

			particle:SetAirResistance( 100 )
			particle:SetGravity( Vector( 0, 0, -300 ) )

			--local RandDarkness = math.Rand( 0.8, 1.0 )
			particle:SetColor( Color.r, Color.g, Color.b )

			particle:SetCollide( true )

			particle:SetAngleVelocity( Angle( math.Rand( -80, 80 ), math.Rand( -80, 80 ), math.Rand( -80, 80 ) ) )

			particle:SetBounce( 1 )
			particle:SetLighting( true )

		end

	end

	emitter:Finish()

end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end