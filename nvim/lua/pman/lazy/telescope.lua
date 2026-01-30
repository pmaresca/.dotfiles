return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local previewers = require("telescope.previewers")
        require('telescope').setup({
          defaults = {
            file_sorter = require("telescope.sorters").get_fzf_sorter,
            prompt_prefix = " >",
            color_devicons = true,

            file_previewer = previewers.vim_buffer_cat.new,
            grep_previewer = previewers.vim_buffer_vimgrep.new,
            qflist_previewer = previewers.vim_buffer_qflist.new,
            layout = "flex",
            layout_config = {
              bottom_pane = {
                height = 25,
                prompt_position = "top",
              },
              center = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.8,
              },
              cursor = {
                height = 0.9,
                preview_cutoff = 40,
                width = 0.8,
              },
              horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.8,
              },
              vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.8,
              },
            },
          },
          extensions = {
            fzf = {
              fuzzy = true, -- false will only do exact matching
              override_generic_sorter = false, -- override the generic sorter
              override_file_sorter = true, -- override the file sorter
              case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
          },
        })

        local builtin = require('telescope.builtin')
        -- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>pws', function()
            -- local word = vim.fn.expand("<cword>")
            -- builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set('n', '<leader>pWs', function()
            -- local word = vim.fn.expand("<cWORD>")
            -- builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set('n', '<leader>ps', function()
            -- builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)
        -- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
