return {
  -- Disable default lspconfig for jdtls
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          enabled = false, -- We'll use nvim-jdtls instead
        },
      },
    },
  },

  -- Setup nvim-jdtls
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      -- Only setup when jdtls is actually installed
      local jdtls_bin = vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls")

      -- Check if jdtls is installed
      if vim.fn.executable(jdtls_bin) ~= 1 then
        vim.notify("jdtls not found. Install it with :MasonInstall jdtls", vim.log.levels.WARN)
        return
      end

      local jdtls = require("jdtls")

      local function start_jdtls()
        local root_markers = { ".git", "mvnw", "pom.xml", "build.gradle" }
        local root_dir = require("jdtls.setup").find_root(root_markers)

        if not root_dir then
          return
        end

        local config = {
          cmd = { jdtls_bin },
          root_dir = root_dir,
          settings = {
            java = {
              eclipse = {
                downloadSources = true,
              },
              maven = {
                downloadSources = true,
              },
              references = {
                includeDecompiledSources = true,
              },
              format = {
                enabled = true,
              },
            },
          },
          init_options = {
            bundles = {},
          },
        }

        jdtls.start_or_attach(config)
      end

      -- Auto-start for Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = start_jdtls,
      })
    end,
  },
}
