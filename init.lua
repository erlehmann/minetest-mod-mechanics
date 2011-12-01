local craftitem_place_item = function(item, player, pos)
	minetest.env:add_item(pos, 'CraftItem "' .. item .. '" 1')
	return true
end

-- items

minetest.register_craft({
	output = 'CraftItem "lever_wood" 2',
	recipe = {
		{'CraftItem "Stick"'},
	}
})

minetest.register_craftitem("lever_wood", {
	image = "lever_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'CraftItem "axle_wood" 1',
	recipe = {
		{'CraftItem "Stick"', 'CraftItem "Stick"'},
	}
})

minetest.register_craftitem("axle_wood", {  -- axle should be a NodeItem
	image = "axle_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craftitem("screw_wood", {
	image = "screw_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'CraftItem "screw_wood" 1',
	recipe = {
		{'NodeItem "wood"', 'CraftItem "axle_wood"', 'NodeItem "wood"'},
	}
})

minetest.register_craft({
	output = 'CraftItem "gear_wood" 1',
	recipe = {
		{'', 'CraftItem "Stick"', ''},
		{'CraftItem "Stick"', 'NodeItem "wood"', 'CraftItem "Stick"'},
        {'', 'CraftItem "Stick"', ''},
	}
})

minetest.register_craftitem("gear_wood", {
	image = "gear_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'CraftItem "gear_big_wood" 1',
	recipe = {
		{'CraftItem "Stick"', 'CraftItem "Stick"', 'CraftItem "Stick"'},
		{'CraftItem "Stick"', 'NodeItem "wood"', 'CraftItem "Stick"'},
        {'CraftItem "Stick"', 'CraftItem "Stick"', 'CraftItem "Stick"'},
	}
})

minetest.register_craftitem("gear_big_wood", {
	image = "gear_big_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

-- nodes

function digprop_woodlike(toughness)
	return {
		diggablity = "normal",
		weight = toughness * 1.0,
		crackiness = 0.75,
		crumbliness = -1.0,
		cuttability = 1.5,
	}
end

minetest.register_craft({
	output = 'NodeItem "gearbox_wood" 1',
	recipe = {
		{'NodeItem "wood"', 'NodeItem "wood"', 'NodeItem "wood"'},
		{'NodeItem "wood"', 'CraftItem "gear_wood"', 'NodeItem "wood"'},
		{'NodeItem "wood"', 'NodeItem "wood"', 'NodeItem "wood"'},
	}
})

minetest.register_node("gearbox_wood", {
	tile_images = {"gearbox_hole_wood.png"},
	inventory_image = inventorycube("gearbox_hole_wood.png"),
	is_ground_content = true,
	material = digprop_woodlike(0.75),
	furnace_burntime = 30,
})

minetest.register_craft({
	output = 'NodeItem "crank_wood" 1',
	recipe = {
		{'CraftItem "lever_wood"', 'CraftItem "lever_wood"'},
		{'CraftItem "lever_wood"', ''},
	}
})

minetest.register_node("crank_wood", {
	drawtype = "torchlike",
	tile_images = {"crank_wood_floor.png", "crank_wood_ceiling.png", "crank_wood_wall.png"},
	inventory_image = "crank_wood_wall.png",
	walkable = false,
	wall_mounted = true,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.3, -0.5, -0.3, 0.1, 0, 0.1},
		wall_side = {-0.5, -0.4, -0.1, 0, 0.1, 0.1},
	},
	material = digprop_constanttime(0.0),
	furnace_burntime = 4,
})
