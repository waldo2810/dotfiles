return {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
        provider = "claude",
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20240620",
            temperature = -1,
            max_tokens = 4096,
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
}
