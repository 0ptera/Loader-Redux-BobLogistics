for i, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  if force.technologies["logistics-4"].researched then
    force.recipes["turbo-loader"].enabled = true
  else
    force.recipes["turbo-loader"].enabled = false
  end
  if force.technologies["logistics-5"].researched then
    force.recipes["ultimate-loader"].enabled = true
  else
    force.recipes["ultimate-loader"].enabled = false
  end
end
