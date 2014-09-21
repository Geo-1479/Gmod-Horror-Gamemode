AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile("cl_scoreboard.lua")
include( "shared.lua" )

-- Variables
showFeed = true


-- Runs after each spawn
function GM:PlayerSpawn( ply )
	ply:SetPlayerColor( Vector( 0, 0, 0 ) )
	setPlayerModel(ply)
	ply:RemoveAllItems()
	giveWeapons(ply)
	ply:AllowFlashlight( true ) 
end

-- Sets player model as one of the nine available ones.
function setPlayerModel(ply)
	math.randomseed( os.time() )
	modelnumber = math.random(1, 9)
	model = "models/player/Group01/Male_0".. modelnumber .. ".mdl"
	ply:SetModel(model)
	print("[Horror]:"..ply:Nick().." has been assigned ".. model)
end
-- Can be made invisible by command
function GM:PlayerDeath( victim, inflictor, attacker )
	if (GetConVar( "hr_enablekillfeed" ):GetBool( )) then
		if ( victim ~= attacker ) then
			PrintMessage( HUD_PRINTTALK, victim:Name() .. " was killed by " .. attacker:Name() .. "." )
		end
	end
end
-- Silences player footsteps
function GM:PlayerFootstep(ply, pos, foot, sound, volume, rf)
      return true
end

function GM:DrawDeathNotice(x, y)
	return
end