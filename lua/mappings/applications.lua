local M = {}


local undotree_mappings = {
    name = ' Undotree',
    o = { '<cmd>lua require("undotree").open()<cr>', ' Open' },
    c = { '<cmd>lua require("undotree").close()<cr>', ' Close' },
    t = { '<cmd>lua require("undotree").toggle()<cr>', ' Toggle' },
}


M.mappings = {
    name = '󰣆 Applications',
    u = undotree_mappings,
}

--[[ M.options = { ]]
--[[   mode = "n", ]]
--[[   silent = true, ]]
--[[   noremap = true, ]]
--[[   prefix = "<leader><leader>", ]]
--[[   nowait = false, ]]
--[[ } ]]

return M
