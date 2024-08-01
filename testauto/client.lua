vRPtestautoC = {}
Tunnel.bindInterface("vRP_testauto",vRPtestautoC)
Proxy.addInterface("vRP_testauto",vRPtestautoC)
vRP = Proxy.getInterface("vRP")
vRPStestauto = Tunnel.getInterface("vRP_testauto","vRP_testauto")

local aintrat = false
local draw = false
local question = 0

local corecte = 0
local gresite = 0

function isCursorInPosition(x,y,width,height)
	local sx, sy = GetActiveScreenResolution()
  local cx, cy = GetNuiCursorPosition ( )
  local cx, cy = (cx / sx), (cy / sy)
  
	local width = width / 2
	local height = height / 2
  
  if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
	  return true
  else
	  return false
  end
end

function Draw3DText(x,y,z, text,scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(fontId)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString("~h~"..text)
        DrawText(_x,_y)
    end
end

function drawtxt(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.010
    scale = scale/2
    y = y + 0.002
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(fontId)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function vRPtestautoC.arata()
    if draw == true then
        question = 1
        while true do
            Citizen.Wait(1)
            ShowCursorThisFrame()
            DisableControlAction(0,51,true)
            DisableControlAction(0,24,true)
            DisableControlAction(0,47,true)
            DisableControlAction(0,58,true)
            DisableControlAction(0,263,true)
            DisableControlAction(0,264,true)
            DisableControlAction(0,257,true)
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
            DisableControlAction(0,143,true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 27, true)
            DisableControlAction(0, 172, true)
            DisableControlAction(0, 173, true)
            DisableControlAction(0, 174, true)
            DisableControlAction(0, 175, true)
            DisableControlAction(0, 176, true)
            DisableControlAction(0, 177, true)
            drawtxt("~g~"..corecte,1,1,0.59, 0.10,0.50,255,255,255,255)
            drawtxt("~r~"..gresite,1,1,0.67, 0.10,0.50,255,255,255,255)
            drawtxt("Raspunsuri corecte",1,1,0.59, 0.12,0.50,255,255,255,255)
            drawtxt("Raspunsuri gresite",1,1,0.67, 0.12,0.50,255,255,255,255)
            if isCursorInPosition(0.265, 0.16, 0.05, 0.03) then
                DrawSprite("garcea", "garcea", 0.12, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
            end
            
            if question == 1 then
                DrawSprite("test1", "test1", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        corecte = corecte + 1
                        question = question + 1
                    end
                else
                    SetCursorSprite(1)
                end
            elseif question == 2 then 
                DrawSprite("test2", "test2", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        corecte = corecte + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                else
                    SetCursorSprite(1)
                end
            elseif question == 3 then 
                DrawSprite("test3", "test3", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        corecte = corecte + 1
                        question = question + 1
                    end
                else
                    SetCursorSprite(1)
                end
            elseif question == 4 then 
                DrawSprite("test4", "test4", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        corecte = corecte + 1
                        question = question + 1
                    end
                elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                    SetCursorSprite(5)
                    DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                    if(IsDisabledControlJustPressed(0, 24))then
                        gresite = gresite + 1
                        question = question + 1
                    end
                else
                    SetCursorSprite(1)
                end     
            elseif question == 5 then 
                if gresite == 4 then
                    draw = false
                    aintrat = false
                    corecte = 0
                    gresite = 0
                    question = 0
                    vRP.notify({'Ai picat cu 21!'})
                    break
                    -- DE PUS NOTIFICARE
                else
                    DrawSprite("test5", "test5", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                    if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            corecte = corecte + 1
                            question = question + 1
                        end
                    else
                        SetCursorSprite(1)
                    end
                end          
            elseif question == 6 then 
                if gresite == 4 then
                    draw = false
                    aintrat = false
                    corecte = 0
                    gresite = 0
                    question = 0
                    vRP.notify({'Ai picat cu 21!'})
                    break
                    -- DE PUS NOTIFICARE
                else
                    DrawSprite("test6", "test6", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                    if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            corecte = corecte + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    else
                        SetCursorSprite(1)
                    end
                end
                   
            elseif question == 7 then 
                if gresite == 4 then
                    draw = false
                    aintrat = false
                    corecte = 0
                    gresite = 0
                    question = 0
                    vRP.notify({'Ai picat cu 21!'})
                    break
                    -- DE PUS NOTIFICARE
                else
                    DrawSprite("test7", "test7", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                    if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            corecte = corecte + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    else
                        SetCursorSprite(1)
                    end
                end
                   
            elseif question == 8 then 
                if gresite == 4 then
                    draw = false
                    aintrat = false
                    corecte = 0
                    gresite = 0
                    question = 0
                    vRP.notify({'Ai picat cu 21!'})
                    break
                    -- DE PUS NOTIFICARE
                else
                    DrawSprite("test8", "test8", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                    if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            corecte = corecte + 1
                            question = question + 1
                        end
                    else
                        SetCursorSprite(1)
                    end
                end     
            elseif question == 9 then 
                if gresite == 4 then
                    draw = false
                    aintrat = false
                    corecte = 0
                    gresite = 0
                    question = 0
                    vRP.notify({'Ai picat cu 21!'})
                    break
                    -- DE PUS NOTIFICARE
                else
                    DrawSprite("test9", "test9", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                    if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            corecte = corecte + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                        SetCursorSprite(5)
                        DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                        if(IsDisabledControlJustPressed(0, 24))then
                            gresite = gresite + 1
                            question = question + 1
                        end
                    else
                        SetCursorSprite(1)
                    end
                end
                   
                elseif question == 10 then     
                    if gresite == 4 then
                        draw = false
                        aintrat = false
                        corecte = 0
                        gresite = 0
                        question = 0
                        vRP.notify({'Ai picat cu 21!'})
                        break
                        -- DE PUS NOTIFICARE
                    else
                        DrawSprite("test10", "test10", 0.5, 0.5, 0.999, 0.999, 0.0, 255, 255, 255, 255)
                        if isCursorInPosition(0.5, 0.44, 0.5, 0.03) then
                            SetCursorSprite(5)
                            DrawRect(0.5, 0.44,0.5, 0.03, 182,211,35,100) 
                            if(IsDisabledControlJustPressed(0, 24))then
                                corecte = corecte + 1
                                question = question + 1
                            end
                        elseif isCursorInPosition(0.50, 0.48, 0.5, 0.03) then
                            SetCursorSprite(5)
                            DrawRect(0.50, 0.48,0.5, 0.03, 182,211,35,100) 
                            if(IsDisabledControlJustPressed(0, 24))then
                                gresite = gresite + 1
                                question = question + 1
                            end
                        elseif isCursorInPosition(0.50, 0.52, 0.5, 0.03) then
                            SetCursorSprite(5)
                            DrawRect(0.50, 0.52,0.5, 0.03, 182,211,35,100) 
                            if(IsDisabledControlJustPressed(0, 24))then
                                gresite = gresite + 1
                                question = question + 1
                            end
                        else
                            SetCursorSprite(1)
                        end
                    end
                elseif question == 11 then 
                    if gresite >= 4 then
                    else
                        draw = false
                        aintrat = false
                        corecte = 0
                        gresite = 0
                        question = 0
                        vRP.notify({'Felicitari ai trecut testul!'})
                        vRPStestauto.passedexam({})
                        break
                    end
                --end
            end
        end
    end
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		local dist = Vdist(pos.x, pos.y, pos.z, -33.513404846191,-791.90155029297,44.225116729736)
		if(Vdist(pos.x, pos.y, pos.z, 1852.9066162109,3690.671875,34.211391448975) < 1.0) and aintrat == false then
			Draw3DText(pos.x, pos.y, pos.z+0.30, "~y~[ ~w~Apasa ~y~E ~w~pentru a deschide meniul ~y~]", 0.55)
			Draw3DText(1852.9066162109,3690.671875,34.211391448975+0.70, "~y~[ ~w~Test Auto ~y~]", 0.55)
			if(IsControlJustReleased(1, 51)) then
                aintrat = true
                Citizen.Wait(1)
                draw = true
                vRPtestautoC.arata()
			end
		end
	end
end)