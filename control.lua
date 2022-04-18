--[[ Copyright (c) 2022 Optera
 * Loader Redux for Bob's Logistics
 *
 * See LICENSE in the project directory for license information.
--]]

-- Call Loader Redux API to register the loaders
script.on_init(function()
  remote.call("loader-redux", "add_loader", "turbo-loader")
  remote.call("loader-redux", "add_loader", "ultimate-loader")
end)

script.on_configuration_changed(function()
  remote.call("loader-redux", "add_loader", "turbo-loader")
  remote.call("loader-redux", "add_loader", "ultimate-loader")
end)
