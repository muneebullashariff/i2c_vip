// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : Master_driver.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: Master_driver
// Description of the class :
// This class drives data to the interface 
//-----------------------------------------------------------------------------

class master_driver extends uvm_driver#(master_xtn);
`uvm_component_utils(master_driver)

//virtual i2c_interface vif
master_agent_config mcfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_driver class object
//
// Parameters:
//  name   - instance name of the master_driver
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------


function master_driver::new(string name="master_driver",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void master_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db#(master_agent_config)::get(this,"","MASTER_AGT_CONFIG",mcfg))
   `uvm_fatal("master_driver","COULDNT GET")
endfunction



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the master_driver to the required interface
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


/*function void connect_phase(uvm_phase phase);
vif=wcfg.vif;
endfunction*/


//-----------------------------------------------------------------------------
// Task: run_phase
// Initiates the main Driving task 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

