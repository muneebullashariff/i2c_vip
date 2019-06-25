package i2c_pkg;
    import uvm_pkg::*;

    `include "uvm_macros.svh"

    `include "master_xtn.sv"
    `include "master_agent_config.sv"
    `include "slave_agent_config.sv"
    `include "environment_config.sv"
    `include "master_driver.sv"
    `include "master_monitor.sv"
    `include "master_sequencer.sv"
    `include "master_agent.sv"
    `include "master_agt_top.sv"
    
    `include "slave_xtn.sv"
    `include "slave_driver.sv"
    `include "slave_monitor.sv"
    `include "slave_sequencer.sv"
    `include "slave_agent.sv"
    `include "slave_agt_top.sv"
    
    `include "virtual_sequencer.sv"
    `include "scoreboard.sv"
    
    `include "environment.sv"
    
    `include "i2c_test.sv"

endpackage
