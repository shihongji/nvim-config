return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    keys = {
      {
        "<leader>mp",
        function()
          vim.g.mkdp_theme = vim.o.background == "dark" and "dark" or "light"
          vim.cmd("MarkdownPreviewToggle")
        end,
        desc = "Markdown Preview (browser)",
      },
    },
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 1
      -- Re-evaluated by the <leader>mp keymap and the autocmd below so the
      -- preview tracks the current colorscheme rather than the (unset) value
      -- at plugin-init time.
      vim.g.mkdp_theme = vim.o.background == "dark" and "dark" or "light"

      local function sync_mkdp_theme()
        vim.g.mkdp_theme = vim.o.background == "dark" and "dark" or "light"
      end
      vim.api.nvim_create_autocmd("ColorScheme", { callback = sync_mkdp_theme })
      vim.api.nvim_create_autocmd("OptionSet", {
        pattern = "background",
        callback = sync_mkdp_theme,
      })

      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/mkdp/vue.css")
      vim.g.mkdp_highlight_css = ""

      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }
    end,
  },
}
