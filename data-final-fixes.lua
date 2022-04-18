--[[ Copyright (c) 2022 Optera
 * Loader Redux for Bob's Logistics
 *
 * See LICENSE in the project directory for license information.
--]]

-- set loader speed to match their respective belts in case mods changed belt speeds
data.raw["loader"]["turbo-loader"].speed = data.raw["transport-belt"]["turbo-transport-belt"].speed
data.raw["loader"]["ultimate-loader"].speed = data.raw["transport-belt"]["ultimate-transport-belt"].speed
