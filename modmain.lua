local removeFuelOption = GetModConfigData("removeFuelOption")
local onlyWillowOption = GetModConfigData("onlyWillowOption")
local allowCookingOption = GetModConfigData("allowCookingOption")

local function removeFuel(inst)
  if not GLOBAL.TheWorld.ismastersim then
    return
  end

  if inst.components.fueled then
    inst:RemoveComponent("fueled")
  end
end

local function onlyWillow(inst)
  if not GLOBAL.TheWorld.ismastersim then
    return
  end

  inst.components.inventoryitem.onputininventoryfn = function(inst)
  local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner ~= nil and owner.components.inventory and owner.prefab ~= "willow" then
      inst:DoTaskInTime(0, function()
        owner.components.inventory:DropItem(inst)
        if owner.components.talker then
          owner.components.talker:Say("It burns my hands!")
        end
      end)
    end
  end
end

local function allowCooking(inst)
  if not GLOBAL.TheWorld.ismastersim then
    return
  end

  if inst.components.cooker and inst:HasTag("dangerouscooker") then
    inst:RemoveTag("dangerouscooker")
    inst.components.cooker.oncookfn = oncook
  end
end

local function oncook(inst, product, chef)
  if inst.components.fueled ~= nil then
      inst.components.fueled:DoDelta(-.01 * inst.components.fueled.maxfuel)
  end
end

if removeFuelOption then
  AddPrefabPostInit("lighter", removeFuel)
end
if onlyWillowOption then
  AddPrefabPostInit("lighter", onlyWillow)
end
if allowCookingOption then
  AddPrefabPostInit("lighter", allowCooking)
end
