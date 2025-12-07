{
  plugins.dap-ui = {
    enable = true;
  };
  plugins.dap-ui.lazyLoad = {
    enable = true;
    settings = {
      before.__raw = ''
        function()
          require("lz.n").trigger_load("mfussenegger/nvim-dap")
        end
      '';
    };
  };

  extraConfigLua = ''
    local dap = require("dap")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      require("dapui").open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      require("dapui").close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      require("dapui").close()
    end
  '';
}
