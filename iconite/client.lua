icons = {	
	{"test1", "test1", "test1"},
	{"test2", "test2", "test2"},
	{"test3", "test3", "test3"},
	{"test4", "test4", "test4"},
	{"test5", "test5", "test5"},
	{"test6", "test6", "test6"},
	{"test7", "test7", "test7"},
	{"test8", "test8", "test8"},
	{"test9", "test9", "test9"},
	{"garcea", "garcea", "garcea"},
	{"sobolan1", "sobolan1", "sobolan1"},
	{"sobolan2", "sobolan2", "sobolan2"},
	{"sobolan3", "sobolan3", "sobolan3"},
	{"sobolan4", "sobolan4", "sobolan4"},
	{"dustromania", "dustromania", "dustromania"},
	{"test10", "test10", "test10"}
}

function loadAllIcons()
	for i, v in pairs(icons) do
		local txd = CreateRuntimeTxd(v[1])
		CreateRuntimeTextureFromImage(txd, v[2], "icons/"..v[3]..".png")
	end
end

Citizen.CreateThread(function()
	loadAllIcons()
end)

--[[function DrawImage3D(name1, name2, x, y, z, width, height, rot, r, g, b, alpha) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, true)
	
    if onScreen then
		local width = (1/dist)*width
		local height = (1/dist)*height
		local fov = (1/GetGameplayCamFov())*100
		local width = width*fov
		local height = height*fov
	
		local CoordFrom = GetEntityCoords(PlayerPedId(), true)
        local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x, y, z, -1, PlayerPedId(), 0)
        local _, _, _, _, object = GetShapeTestResult(RayHandle)
		if(object == 0) or (object == nil)then
			DrawSprite(name1, name2, _x, _y, width, height, rot, r, g, b, alpha)
		end
	end
end--]]
