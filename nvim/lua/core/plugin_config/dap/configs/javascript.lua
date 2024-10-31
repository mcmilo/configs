require("dap-vscode-js").setup {
  debugger_cmd = { "js-debug-adapter" },
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",
  adapters = { "pwa-node", "pwa-chrome", "node-terminal", "node", "chrome" },
}

for _, language in ipairs { "typescript", "javascript" } do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      -- processId = require("dap.utils").pick_process,
      address = 'localhost',
      cwd = "${workspaceFolder}",
      port = 9229,
      restart = true,
    },
  }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
  require("dap").configurations[language] = {
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome",
      request = "launch",
      url = "http://localhost:3000",
    },
  }
end
