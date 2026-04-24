local PGui = game:GetService("Players").LocalPlayer.PlayerGui
local FoundItems = {}
local selectedItem

local function sendNotif(txt)
    game.StarterGui:SetCore("SendNotification", {
    Title = "RetrOffender by Sealhaxx";
    Text = txt;
    Icon = "rbxassetid://17427362756";
    Duration = 2;})
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/forumsLib/main/source.lua"))()
local Forums = Library.new("RetrOffender")
local mainTab = Forums:NewSection("Main")

local guisDropdown = mainTab:NewDropdown("GUIs", FoundItems, function(item)
    if item then
        selectedItem = item 
        GUI = PGui[item]
        GUI.Enabled = true
        for _, desc in GUI:GetDescendants() do 
            if desc.ClassName == "Frame" then
                desc.Visible = true
            end
        end
        sendNotif("Selected " .. item)
    end
end)

local scanButton = mainTab:NewButton("Scan game", function()
    for _, child in ipairs(PGui:GetChildren()) do 
        if child:IsA("ScreenGui") and child.Enabled == false and child:GetAttribute("RetroCreated") == true and table.find(FoundItems, child.Name) == nil then
            table.insert(FoundItems, child.Name)
            sendNotif(child.name .. " found!")
        end
    end
    if #FoundItems < 1 then
        sendNotif("Found nothing :/")
    else 
        sendNotif("Scan completed!")
        guisDropdown:Refresh(FoundItems)
    end
end)

local hideItem = mainTab:NewButton("Hide GUI", function()
    if selectedItem then
        Gui = PGui[selectedItem]
        Gui.Enabled = false
        for _, desc in ipairs(Gui:GetDescendants()) do 
            if desc.ClassName == "Frame" then
                desc.Visible = false
            end
        end
        sendNotif(selectedItem .. " hidden")
    end
end)

local hideAllItems = mainTab:NewButton("Hide all GUIs", function()
    for _, guiname in ipairs(FoundItems) do 
        Gui = PGui[guiname]
        Gui.Enabled = false
        for _, desc in ipairs(Gui:GetDescendants()) do 
            if desc.ClassName == "Frame" then
                desc.Visible = false
            end
        end
    end
    sendNotif("All hidden")
end)
