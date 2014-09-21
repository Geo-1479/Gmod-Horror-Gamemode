GM.Name 	= "Z61's Horror Gamemode" 
GM.Author 	= "Z61" 
GM.Email 	= "z61@zeesixtyone.com" 
GM.Website 	= "zeesixtyone.com" 
 
function GM:Initialize()

end
-- Adds the console commands
CVAR_ENABLE_CROWBAR = CreateConVar( "hr_enablecrowbar", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }, "Set to 1 to enable, 0 to disable" )
CVAR_ENABLE_GRAVGUN = CreateConVar( "hr_enablegravgun", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }, "Set to 1 to enable, 0 to disable" )
CVAR_ENABLE_KILLFEED = CreateConVar( "hr_enablekillfeed", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }, "Set to 1 to enable, 0 to disable" )
-- Gives weapons at spawn depending on what's enabled.
function giveWeapons(ply)
	if (spawnCrowbar == true) then
		ply:Give( "weapon_crowbar" )
	end
	if (spawnGrav == true) then
		ply:Give( "weapon_physcannon" )
	end
end

function colorMsg(msg, color)
	r = color[1]; g = color[2]; b = color[3]
	MsgC( Color( r, g, b ), msg )
end