return {
  "melbaldove/llm.nvim",
  dependencies = { "nvim-neotest/nvim-nio" },
  config = function()
    local system_prompt =
    'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks'

    require('llm').setup({

      -- How long to wait for the request to start returning data.
      timeout_ms = 10000,
      services = {
        anthropic = {
          url = "https://api.anthropic.com/v1/messages",
          model = "claude-3-5-haiku-20241022",
          --model = "claude-3-5-sonnet-20240620",
          api_key_name = "ANTHROPIC_API_KEY",
          system_prompt = system_prompt,
        },
      }
    })

    vim.keymap.set("n", "<leader>m", function() require("llm").create_llm_md() end, { desc = "Create llm.md" })

    vim.keymap.set('n', '<leader>i', function()
      require('llm').prompt { replace = false, service = 'anthropic' }
    end, { desc = 'Prompt with anthropic (replace = true)' })
  end
}
