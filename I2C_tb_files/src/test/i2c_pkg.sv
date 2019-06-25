package i2c_pkg;
    import uvm_pkg::*;

    `include "uvm_macros.svh"

    `include "../master_agt_top/master_xtn.sv"
    `include "../master_agt_top/master_agent_config.sv"
    `include "../slave_agt_top/slave_agent_config.sv"
    `include "../env/environment_config.sv"
    `include "../master_agt_top/master_driver.sv"
    `include "../master_agt_top/master_monitor.sv"
    `include "../master_agt_top/master_sequencer.sv"
    `include "../master_agt_top/master_agent.sv"
    `include "../master_agt_top/master_agt_top.sv"
    
    `include "../slave_agt_top/slave_xtn.sv"
    `include "../slave_agt_top/slave_driver.sv"
    `include "../slave_agt_top/slave_monitor.sv"
    `include "../slave_agt_top/slave_sequencer.sv"
    `include "../slave_agt_top/slave_agent.sv"
    `include "../slave_agt_top/slave_agt_top.sv"
    
    `include "../env/virtual_sequencer.sv"
    `include "../env/scoreboard.sv"
    
    `include "../env/environment.sv"
    
    `include "../test/i2c_test.sv"

endpackage
