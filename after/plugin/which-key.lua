local wk = require("which-key")
wk.add({
  -- { "<leader>t", group = "latex" }, -- group
  -- { "<leader>td", '<cmd>lua require"press-reports.getPublicationDate".getPublicationDate()<cr>', desc = "Get Date", mode = "n"},
  -- { "<leader>tc", ":w<CR>:set makeprg=compiler\\ %<CR>:silent make<CR>", desc = 'compile document with make', mode = "n"},
  -- { "<leader>ts", ":!opout <c-r>%<CR><CR>", desc = "Open PDF", mode = "n"},

  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fb", function() print("hello") end, desc = "Foobar" },
  { "<leader>fn", desc = "New File" },
  { "<leader>f1", hidden = true }, -- hide this keymap

  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings

  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
