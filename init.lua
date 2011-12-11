local craftitem_place_item = function(item, player, pos)
	minetest.env:add_item(pos, 'CraftItem "' .. item .. '" 1')
	return true
end

-- items

minetest.register_craft({
	output = 'CraftItem "mechanics:lever_wood" 2',
	recipe = {
		{'CraftItem "Stick"'},
	}
})

minetest.register_craftitem("mechanics:lever_wood", {
	image = "lever_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'NodeItem "mechanics:axle_wood" 1',
	recipe = {
		{'CraftItem "Stick"', 'CraftItem "Stick"'},
	}
})

minetest.register_node("mechanics:axle_wood", {
	drawtype = "axlelike",
	tile_images = {"axle_wood_node.png"},
	inventory_image = "axle_wood.png",
	is_ground_content = true,
	material = minetest.digprop_woodlike(0.75),
	furnace_burntime = 15,
})


minetest.register_craftitem("mechanics:screw_wood", {
	image = "screw_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'CraftItem "mechanics:screw_wood" 1',
	recipe = {
		{'NodeItem "wood"', 'CraftItem "mechanics:axle_wood"', 'NodeItem "wood"'},
	}
})

minetest.register_craft({
	output = 'CraftItem "mechanics:gear_wood" 1',
	recipe = {
		{'', 'CraftItem "Stick"', ''},
		{'CraftItem "Stick"', 'NodeItem "wood"', 'CraftItem "Stick"'},
        {'', 'CraftItem "Stick"', ''},
	}
})

minetest.register_craftitem("mechanics:gear_wood", {
	image = "gear_wood.png",
	stack_max = 99,
	on_place_on_ground = craftitem_place_item,
})

minetest.register_craft({
	output = 'CraftItem "mechanics:gear_big_wood" 1',
	recipe = {
		{'CraftItem "Stick"', 'CraftItem "Stick"', 'CraftItem "Stick"'},
		{'CraftItem "Stick"', 'NodeItem "wood"', 'CraftItem "Stick"'},
        {'CraftItem "Stick"', 'CraftItem "Stick"', 'CraftItem "Stick"'},
	}
})

minetest.register_craftitem("mechanics:gear_big_wood", {
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
	output = 'NodeItem "mechanics:gearbox_wood" 1',
	recipe = {
		{'NodeItem "wood"', 'NodeItem "wood"', 'NodeItem "wood"'},
		{'NodeItem "wood"', 'CraftItem "mechanics:gear_wood"', 'NodeItem "wood"'},
		{'NodeItem "wood"', 'NodeItem "wood"', 'NodeItem "wood"'},
	}
})

minetest.register_node("mechanics:gearbox_wood", {
	drawtype = "normal",
	tile_images = {"gearbox_hole_wood.png"},
	inventory_image = minetest.inventorycube("gearbox_hole_wood.png"),
	is_ground_content = true,
	material = minetest.digprop_woodlike(0.75),
	furnace_burntime = 30,
})

minetest.register_craft({
	output = 'NodeItem "mechanics:crank_wood" 1',
	recipe = {
		{'CraftItem "mechanics:lever_wood"', 'CraftItem "mechanics:lever_wood"'},
		{'CraftItem "mechanics:lever_wood"', ''},
	}
})

minetest.register_node("mechanics:crank_wood", {
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
	material = minetest.digprop_constanttime(0.0),
	furnace_burntime = 4,
})
