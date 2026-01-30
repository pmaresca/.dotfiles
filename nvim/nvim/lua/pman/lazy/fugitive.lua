return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local PMan_Fugitive = vim.api.nvim_create_augroup("Pman_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Pman_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
            end,
        })


        -- vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        -- vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end
}
