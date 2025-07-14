local on_attach = require("plugins.lsp.on_attach") -- Adjust path if different

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/wasabi/.eclipse-jdtls-data/' .. project_name
local install_path = '/Users/wasabi/Dev/jdtls/1.46.1'
local sdk_path = '/Users/wasabi/.sdkman/candidates/java/21.0.7-graal/bin/java'

local config = {
  cmd = {
    sdk_path,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. install_path .. '/lombok.jar',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    install_path .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar',
    '-configuration',
    install_path .. '/config_mac',
    '-data',
    workspace_dir
  },

  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      format = false
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      vim.fn.glob(
        '/Users/wasabi/Dev/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar',
        1)
    }
  },

  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
}

require('jdtls').start_or_attach(config)
