--[[
-- Web Tools
--
-- Author: Mark van der Meulen
-- Updated: 13-02-2023
--]]


require'web-tools'.setup({
  keymaps = {
    rename = nil,  -- by default use same setup of lspconfig
    --[[ repeat_rename = '.', -- . to repeat ]]
  },
  hurl = {  -- hurl default
    show_headers = false, -- do not show http headers
    floating = false,   -- use floating windows (need guihua.lua)
    formatters = {  -- format the result by filetype
      json = { 'jq' },
      html = { 'prettier', '--parser', 'html' },
    },
  },
})

