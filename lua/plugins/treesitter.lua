if not pcall(require, "nvim-treesitter") then
    return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "bash",
      "c",
      "cpp",
      "go",
      "javascript",
      "typescript",
      "json",
      "jsonc",
      "jsdoc",
      "lua",
      "python",
      "rust",
      "html",
      "css",
      "toml",
      "markdown",
      "markdown_inline",
      "solidity",
      -- for `nvim-treesitter/playground`
      "query",
  },
  highlight   = {
    enable = true,
    disable = {
      -- Slow on big C|CPP files
      -- "c", "cpp",
      -- Makes MD|inline highlights ugly
      "md", "markdown",
      -- Messes up vimdoc alignments
      -- https://github.com/nvim-treesitter/nvim-treesitter/pull/3555
      "help",
    }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<S-Tab>',
      scope_incremental = '<Tab>',
    },
  },
  textobjects = {
    select = {
      enable  = true,
      keymaps = {
        ["ac"] = "@comment.outer"    ,
        ["ic"] = "@comment.outer"    ,
        ["ao"] = "@class.outer"      ,
        ["io"] = "@class.inner"      ,
        ["af"] = "@function.outer"   ,
        ["if"] = "@function.inner"   ,
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}
