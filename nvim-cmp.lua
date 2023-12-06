return {
  -- "https://github.com/hrsh7th/nvim-cmp", requires = {
  --   -- ... 其他依赖 ...
  --   "hrsh7th/cmp-copilot",
  -- },
  -- config = function()
  -- vim.api.nvim_set_hl(0, "mypmenu", { bg = "#bb9af7", fg = "#414868" })
  -- vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#bb9af7", fg = "#414868", bold = true, italic = true })
  --   local cmp = require("cmp")
  --   cmp.setup({
  --     -- 指定自动完成源
  --     sources = cmp.config.sources({
  --       { name = "nvim_lsp" }, -- 从 LSP 获取自动完成建议
  --       { name = "luasnip" }, -- LuaSnip 代码片段
  --       { name = "buffer", keyword_length = 4 }, -- 从当前缓冲区中的文本提供建议
  --       { name = "path" }, -- 文件路径自动完成
  --       { name = "nvim_lua" }, -- Neovim Lua API
  --       -- { name = "treesitter" }, -- Treesitter 语法分析器
  --       { name = "copilot" }, -- GitHub Copilot
  --     }),
  --
  --     -- UI 相关的设置
  -- window = {
  --   -- 完成建议菜单的外观设置
  --   completion = {
  --     border = "single", -- 边框样式，可选项有 'single', 'double', 'rounded', 'solid' 等
  --     winhighlight = "Normal:Pmenu,CursorLine:MyPmenuSel,Search:None",
  --   },
  --   -- 文档预览窗口的外观设置
  --   documentation = {
  --     border = "rounded",
  --   },
  -- },
  --
  --     -- ... 其他设置 ...
  --   })
  --
  --   -- 使用键位映射来增强操作体验
  --   cmp.setup({
  --     mapping = {
  --       ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  --       ["<C-y>"] = cmp.config.disable, -- 在插入模式下禁用 <C-y>
  --       ["<C-e>"] = cmp.mapping({
  --         i = cmp.mapping.abort(),
  --         c = cmp.mapping.close(),
  --       }),
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       -- ... 其他键位映射 ...
  --     },
  --     -- ... 其他设置 ...
  --   })
  -- end,

  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "hrsh7th/cmp-emoji" }, { "hrsh7th/cmp-nvim-lsp" }, { "hrsh7th/cmp-path" } },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" }, --optional
      },
      --   opts = {
      --     sources = {
      --       { name = "nvim_lsp" },
      --       { name = "path" }, --optional
      --       { name = "luasnip" }, -- LuaSnip 代码片段
      --       { name = "buffer", keyword_length = 4 }, -- 从当前缓冲区中的文本提供建议
      --       { name = "path" }, -- 文件路径自动完成
      --       { name = "nvim_lua" }, -- Neovim Lua API
      --       -- { name = "treesitter" }, -- Treesitter 语法分析器
      --       { name = "copilot" }, -- GitHub Copilot
      --     },
      --   },
      -- },
      opts = function(_, opts)
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local luasnip = require("luasnip")
        local cmp = require("cmp")

        vim.api.nvim_set_hl(0, "mypmenu", { bg = "#bb9af7", fg = "#414868" })
        vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#bb9af7", fg = "#414868", bold = true, italic = true })
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          cmp.setup({
            sources = cmp.config.sources({
              { name = "nvim_lsp" }, -- 从 LSP 获取自动完成建议
              { name = "luasnip" }, -- LuaSnip 代码片段
              { name = "buffer", keyword_length = 4 }, -- 从当前缓冲区中的文本提供建议
              { name = "path" }, -- 文件路径自动完成
              { name = "nvim_lua" }, -- Neovim Lua API
              { name = "treesitter" }, -- Treesitter 语法分析器
              { name = "copilot" }, -- GitHub Copilot
              { name = "emoji" },
            }),

            window = {
              -- 完成建议菜单的外观设置
              completion = {
                border = "single", -- 边框样式，可选项有 'single', 'double', 'rounded', 'solid' 等
                winhighlight = "Normal:Pmenu,CursorLine:MyPmenuSel,Search:None",
              },
              -- 文档预览窗口的外观设置
              documentation = {
                border = "rounded",
              },
            },
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end,
    },
    ---@param opts cmp.ConfigSchema
  },
}
