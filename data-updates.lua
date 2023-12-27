local funcs = require("__DeadlockBlackRubberBelts__/code/functions")

local mask_color = {
	funcs.hsva2rgba(0.11, 0.8, 1),
	funcs.hsva2rgba(0, 0.8, 1),
	funcs.hsva2rgba(0.54, 0.8, 1),
	{ 0.35, 1, 0.15, 0.2 }, -- kr-advanced
	{ 0.65, 0.15, 1, 0.2 }, -- kr-superior
	{ 1, 1, 1, 0.2 }, -- se-space
}

local belt_names = { "", "fast-", "express-", "advanced-", "superior-", "space-" }
local function set_belt_animation(belt, color)
	belt.belt_animation_set.animation_set = funcs.get_belt_animation_set(color, "steel")
end

for i = 1, 6 do
	local belt_name = belt_names[i] .. "linked-belt"
	if data.raw["linked-belt"][belt_name] then
		local mask_color = mask_color[i]
		if mask_color then
			funcs.replace_item_icon(belt_name, "rubber-belt-steel")
			funcs.add_mask_to_item_icon(belt_name, "rubber-belt-mask", mask_color)
			funcs.copy_item_icons_to_entity("linked-belt", belt_name)
			local belt = data.raw["linked-belt"][belt_name]
			set_belt_animation(belt, mask_color)
		end
	end
end
