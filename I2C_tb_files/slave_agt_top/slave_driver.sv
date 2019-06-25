// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_driver.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_driver
// Description of the class :
// This class drives data to the interface 
//-----------------------------------------------------------------------------

class slave_driver extends uvm_driver#(slave_xtn);
`uvm_component_utils(slave_driver)

  slave_agent_config scfg;
//virtual i2c_interface vif

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="slave_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_driver class object
//
// Parameters:
//  name   - instance name of the slave_driver
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------


function slave_driver::new(string name="slave_driver",uvm_component parent);
	super.new(name,parent);
endfunction:new


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db#(slave_agent_config)::get(this,"","SLAVE_AGT_CONFIG",scfg))
   `uvm_fatal("slave_driver","COULDNT GET")
endfunction:build_phase



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the slave_driver to the required interface
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


/*function void connect_phase(uvm_phase phase);
vif=wcfg.vif;
endfunction:connect_phase*/


//-----------------------------------------------------------------------------
// Task: run_phase
// Initiates the main Driving task 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

