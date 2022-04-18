--[[ Copyright (c) 2022 Optera
 * Part of Loader Redux for Bob's Logistics
 *
 * See LICENSE in the project directory for license information.
--]]

local loader_redux = require("__LoaderRedux__.make_loader")

local tints = {
  ["turbo-loader"] = util.color("a510e5d9"),
  ["ultimate-loader"] = util.color("16f263d9"),
}

-- Compatibility with Bob's Logistics Belt Reskin's color
if mods["boblogistics-belt-reskin"] then
  tints["turbo-loader"] = util.color("df1ee5d9")
end

-- Create Loaders
local belt_prototypes = data.raw["transport-belt"]
local loader_prototypes = data.raw["loader"]

data:extend({
  loader_redux.make_loader_item("turbo-loader", "bob-logistic-tier-4", "d-d", tints["turbo-loader"]),
  loader_redux.make_loader_item("ultimate-loader", "bob-logistic-tier-5", "d-f", tints["ultimate-loader"]),

  loader_redux.make_loader_entity("turbo-loader", belt_prototypes["turbo-transport-belt"], tints["turbo-loader"], "ultimate-loader"),
  loader_redux.make_loader_entity("ultimate-loader", belt_prototypes["ultimate-transport-belt"], tints["ultimate-loader"], nil),
})

-- Link upgrades of base loaders
loader_prototypes["express-loader"].next_upgrade = "turbo-loader"

-- Change sorting of base loaders
data.raw["item"]["loader"].subgroup = "bob-logistic-tier-1"
data.raw["item"]["loader"].order = "d-a"
data.raw["item"]["fast-loader"].subgroup = "bob-logistic-tier-2"
data.raw["item"]["fast-loader"].order = "d-b"
data.raw["item"]["express-loader"].subgroup = "bob-logistic-tier-3"
data.raw["item"]["express-loader"].order = "d-c"


-- Create recipes
if mods["bobplates"] then -- use Bob Intermediates as ingredients
  data.raw.recipe["loader"].ingredients = {
    {"tin-plate", 10},
    {"electronic-circuit", 5},
    {"inserter", 5},
    {"transport-belt", 2},
  }
  data.raw.recipe["fast-loader"].ingredients = {
    {"bronze-alloy", 10},
    {"steel-gear-wheel", 14},
    {"electronic-circuit", 5},
    {"loader", 1},
  }
  data.raw.recipe["express-loader"].category = nil
  data.raw.recipe["express-loader"].ingredients = {
    {"aluminium-plate", 10},
    {"cobalt-steel-gear-wheel", 14},
    {"cobalt-steel-bearing", 14},
    {"advanced-circuit", 5},
    {"fast-loader", 1},
  }
  data:extend({
    {
      type = "recipe",
      name = "turbo-loader",
      enabled = "false",
      energy_required = 5,
      ingredients = {
        {"titanium-plate", 10},
        {"titanium-bearing", 14},
        {"titanium-gear-wheel", 14},
        {"processing-unit", 5},
        {"express-loader", 1},
      },
      result = "turbo-loader"
    },
    {
      type = "recipe",
      name = "ultimate-loader",
      enabled = "false",
      energy_required = 5,
      ingredients = {
        {"nitinol-alloy", 10},
        {"nitinol-bearing", 14},
        {"nitinol-gear-wheel", 14},
        {"advanced-processing-unit", 5},
        {"turbo-loader", 1},
      },
      result = "ultimate-loader"
    },
  })
else -- use base ingredients
  data.raw.recipe["loader"].ingredients = {
    {"iron-plate", 10},
    {"electronic-circuit", 5},
    {"inserter", 5},
    {"transport-belt", 2},
  }
  data.raw.recipe["fast-loader"].ingredients = {
    {"steel-plate", 15},
    {"iron-gear-wheel", 20},
    {"electronic-circuit", 5},
    {"loader", 1},
  }
  data.raw.recipe["express-loader"].category = nil
  data.raw.recipe["express-loader"].ingredients = {
    {"steel-plate", 15},
    {"iron-gear-wheel", 20},
    {"advanced-circuit", 5},
    {"fast-loader", 1},
  }
  data:extend({
    {
      type = "recipe",
      name = "turbo-loader",
      enabled = "false",
      energy_required = 5,
      ingredients = {
        {"steel-plate", 15},
        {"iron-gear-wheel", 20},
        {"processing-unit", 5},
        {"express-loader", 1},
      },
      result = "turbo-loader"
    },
    {
      type = "recipe",
      name = "ultimate-loader",
      enabled = "false",
      energy_required = 5,
      ingredients = {
        {"steel-plate", 15},
        {"iron-gear-wheel", 20},
        {"processing-unit", 10},
        {"turbo-loader", 1},
      },
      result = "ultimate-loader"
    },
  })
end


-- Add loader to existing techs
local loader_techs = {
  ["logistics-4"] = "turbo-loader",
  ["logistics-5"] = "ultimate-loader",
}

for tech, recipe in pairs(loader_techs) do
  if data.raw.technology[tech] then
    table.insert(data.raw.technology[tech].effects, {type = "unlock-recipe", recipe = recipe} )
  end
end
