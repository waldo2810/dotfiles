return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local function map(lhs, rhs, opts)
      vim.keymap.set("n", lhs, rhs, opts or {})
    end

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
	table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
	prompt_title = "Harpoon",
	finder = require("telescope.finders").new_table({
	  results = file_paths,
	}),
	previewer = conf.file_previewer({}),
	sorter = conf.generic_sorter({}),
      }):find()
    end

    map("<leader>h", function() harpoon:list():add() end)
    map("<C-e>", function() toggle_telescope(harpoon:list()) end)
    map("<leader>1", function() harpoon:list():select(1) end)
    map("<leader>2", function() harpoon:list():select(2) end)
    map("<leader>3", function() harpoon:list():select(3) end)
    map("<leader>4", function() harpoon:list():select(4) end)
    map("<leader>5", function() harpoon:list():select(5) end)
    map("<leader>6", function() harpoon:list():select(6) end)
    map("<leader>7", function() harpoon:list():select(7) end)
    map("<leader>8", function() harpoon:list():select(8) end)
    map("<leader>9", function() harpoon:list():select(9) end)
  end,
}
