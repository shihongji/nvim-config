return {
  {
    "scalameta/nvim-metals",
    keys = {
      -- Override <leader>me to use metals commands directly (no Telescope dependency)
      {
        "<leader>me",
        function()
          require("metals").commands()
        end,
        desc = "Metals commands",
      },
    },
    opts = function(_, metals_config)
      metals_config.settings.serverVersion = "1.6.6"
      return metals_config
    end,
  },
}
