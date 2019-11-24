------------------------------------------------------------
-- DrawText Function
-------------------------------------------------------------
function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.45, 0.45)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
-------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
		veheng = GetVehicleEngineHealth(GetVehiclePedIsUsing(PlayerPedId()))
		vehbody = GetVehicleBodyHealth(GetVehiclePedIsUsing(PlayerPedId()))
		local Coords  = GetEntityCoords(PlayerPedId())
		if IsPedInAnyVehicle(PlayerPedId(), 1) then
			vehenground = tonumber(string.format("%.2f", veheng))
			vehbodround = tonumber(string.format("%.2f", vehbody))
			if IsControlPressed(0, 353) then
			DrawText3Ds(Coords.x, Coords.y, Coords.z+1.0, "HP : "..vehenground)
			end

end
    end
end)
