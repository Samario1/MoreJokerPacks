--- STEAMODDED HEADER
--- MOD_NAME: More Joker Packs
--- MOD_ID: MoreJokerPacks
--- PREFIX: MJP
--- MOD_AUTHOR: [Samario]
--- MOD_DESCRIPTION: Dedicated joker packs for specific rarities of Joker.
--- BADGE_COLOUR: 900090
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-1103a]
--- VERSION: 0.0.2
--- PRIORITY: 10000

----------------------------------------------
------------MOD CODE -------------------------

local jokerpacks = SMODS.current_mod
local filesystem = NFS or love.filesystem

local loc = filesystem.load(jokerpacks.path..'localization.lua')()


local packs = {"Blank", "Common", "Uncommon", "Rare", "Legendary", "Epic", "Exotic", "Fusion", "Evolved"}

SMODS.Atlas({key = 'p_jokerpacks', path = 'p_jokers.png', px = 71, py = 95 })

function SMODS.current_mod.process_loc_text()
	for i = 1, #packs do
		SMODS.process_loc_text(G.localization.misc.dictionary, "mjp_booster_" .. string.lower(packs[i]),  packs[i] .. " Buffoon Pack")
	end
end

SMODS.Booster{
	name = "Common Buffoon Pack",
	key = "common_buffoon_pack",
	atlas = 'p_jokerpacks',
	pos = {x = 0, y = 0},
	group_key = 'mjp_booster_common',
	weight = 1 * 1.2,
	cost = 6,
	config = {extra = 3, choose = 1, name = "Common Buffoon Pack"},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	loc_txt = loc.buffoon_pack.common,
	create_card = function(self, card)
		return create_card("Joker", G.pack_cards, nil, 0, true, true, nil, nil)
	end,
}

SMODS.Booster{
	name = "Uncommon Buffoon Pack",
	key = "uncommon_buffoon_pack",
	atlas = 'p_jokerpacks',
	pos = {x = 1, y = 0},
	group_key = 'mjp_booster_uncommon',
	weight = 0.7 * 1.2,
	cost = 9,
	config = {extra = 3, choose = 1, name = "Uncommon Buffoon Pack"},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	loc_txt = loc.buffoon_pack.uncommon,
	create_card = function(self, card)
		return create_card("Joker", G.pack_cards, nil, 0.8, true, true, nil, nil)
	end,
}

SMODS.Booster{
	name = "Rare Buffoon Pack",
	key = "rare_buffoon_pack",
	atlas = 'p_jokerpacks',
	pos = {x = 2, y = 0},
	group_key = 'mjp_booster_rare',
	weight = 0.4 * 1.2,
	cost = 12,
	config = {extra = 3, choose = 1, name = "Rare Buffoon Pack"},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	loc_txt = loc.buffoon_pack.rare,
	create_card = function(self, card)
		return create_card("Joker", G.pack_cards, nil, 0.98, true, true, nil, nil)
	end,
}

SMODS.Booster{
	name = "Legendary Buffoon Pack",
	key = "legendary_buffoon_pack",
	atlas = 'p_jokerpacks',
	pos = {x = 4, y = 0},
	group_key = 'mjp_booster_legendary',
	weight = 0.2 * 1.2,
	cost = 25,
	config = {extra = 3, choose = 1, name = "Legendary Buffoon Pack"},
	discovered = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
	loc_txt = loc.buffoon_pack.legendary,
	create_card = function(self, card)
		return create_card("Joker", G.pack_cards, true, 0, true, true, nil, nil)
	end,
}



if SMODS.Mods["Cryptid"] then
	-- load additional jonkler packs
	SMODS.Booster{
		name = "Epic Buffoon Pack",
		key = "epic_buffoon_pack",
		atlas = 'p_jokerpacks',
		pos = {x = 3, y = 0},
		group_key = 'mjp_booster_epic',
		weight = 0.2 * 1.2,
		cost = 25,
		config = {extra = 3, choose = 1, name = "Epic Buffoon Pack"},
		discovered = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.config.center.config.choose, card.ability.extra} }
		end,
		loc_txt = loc.buffoon_pack.epic,
		create_card = function(self, card)
			return create_card("Joker", G.pack_cards, nil, "cry_epic", true, true, nil, nil)
		end,
	}



	SMODS.Booster{
		name = "Exotic Buffoon Pack",
		key = "exotic_buffoon_pack",
		atlas = 'p_jokerpacks',
		pos = {x = 5, y = 0},
		group_key = 'mjp_booster_exotic',
		weight = 0.1 * 1.2,
		cost = 65,
		config = {extra = 3, choose = 1, name = "Exotic Buffoon Pack"},
		discovered = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.config.center.config.choose, card.ability.extra} }
		end,
		loc_txt = loc.buffoon_pack.exotic,
		create_card = function(self, card)
			return create_card("Joker", G.pack_cards, nil, "cry_exotic", true, true, nil, "mjp_exotic_pack")
		end,
	}

end
