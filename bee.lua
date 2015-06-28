
-- Bee by KrupnoPavel

mobs:register_mob("mobs:bee", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "mobs_bee.x",
	textures = {
		{"mobs_bee.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_bee",
	},	
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:honey",
		chance = 1, min = 1, max = 2,},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -3,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 35,
		walk_end = 65,
	},
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 25, 80, 0, true, nil)
	end,
})

mobs:register_spawn("mobs:bee", {"group:flower"}, 20, 10, 9000, 1, 31000)

mobs:register_egg("mobs:bee", "Bee", "mobs_bee_inv.png", 0)

-- honey
minetest.register_craftitem("mobs:honey", {
	description = "Honey",
	inventory_image = "mobs_honey_inv.png",
	on_use = minetest.item_eat(6),
})

-- beehive (when placed spawns bee)
minetest.register_node("mobs:beehive", {
	description = "Beehive",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles ={"mobs_beehive.png"},
	inventory_image = "mobs_beehive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {fleshy=3,dig_immediate=3},
	sounds = default.node_sound_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="mobs:beehive", param2=1})
			minetest.add_entity(pos, "mobs:bee")
		end
	end,
	
})

minetest.register_craft({
	output = "mobs:beehive",
	recipe = {
		{"mobs:bee","mobs:bee","mobs:bee"},
	}
})

-- honey block
minetest.register_node("mobs:honey_block", {
	description = "Honey Block",
	tiles = {"mobs_honey_block.png"},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "mobs:honey_block",
	recipe = {
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
	}
})

minetest.register_craft({
	output = "mobs:honey 9",
	recipe = {
		{"mobs:honey_block"},
	}
})
