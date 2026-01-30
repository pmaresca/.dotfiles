return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        harpoon = require("harpoon")
        harpoon.setup({
          settings = {
            save_on_toggle = false,
            save_on_change = true,
            enter_on_sendcmd = false,
            excluded_filetypes = { "harpoon" },
          },
        })
    end
}
