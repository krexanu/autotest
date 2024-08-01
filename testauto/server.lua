local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_testauto")
vRPCtestauto = Tunnel.getInterface("vRP_testauto","vRP_testauto")

vRPtestauto = {}
Tunnel.bindInterface("vRP_testauto",vRPtestauto)
Proxy.addInterface("vRP_testauto",vRPtestauto)

function vRPtestauto.passedexam()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	MySQL.Async.execute("UPDATE vrp_users SET testauto = 1 WHERE id = @user_id",{['@user_id'] = user_id},function(data)end)
end