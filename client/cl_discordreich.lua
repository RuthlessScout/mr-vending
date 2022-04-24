Citizen.CreateThread(function()
	while true do
		SetRichPresence("Пак краде")
		SetDiscordAppId(912457375863152641)
		SetDiscordRichPresenceAsset('integrity')
		SetDiscordRichPresenceAction(0, "Integrity RP", "https://discord.gg/5MxbcXUqBH") -- Button 1 and link
	    --SetDiscordRichPresenceAction(1, "Купи си билет", "fivem://connect/87") --  Button 2 and link
		Citizen.Wait(60000)
	end
end)