return {
  dap = {
    adapters = {
      dart = {
        type = "executable",
        command = "dart",
        args = {'debug_adapter'},
      },
      flutter = {
        type = "executable",
        command = "flutter",
        args = {'debug_adapter'},
      },
    },
    configurations = {
      dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch dart",
          dartSdkPath = "/opt/homebrew/bin/dart", -- ensure this is correct
          flutterSdkPath = "/Users/hijikatanozomi/fvm/default/bin/flutter",                  -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
          cwd = "${workspaceFolder}",
        },
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = "/opt/homebrew/bin/dart", -- ensure this is correct
          flutterSdkPath = "/Users/hijikatanozomi/fvm/default/bin/flutter",             -- ensure this is correct
          program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
          cwd = "${workspaceFolder}",
        }
      }
    }
  }
}
