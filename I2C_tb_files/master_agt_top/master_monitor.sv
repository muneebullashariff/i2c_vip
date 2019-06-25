// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : Master_monitor.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: Master_monitor
// Description of the class :
// This class samples the DUT signals through virtual interface
//-----------------------------------------------------------------------------


class master_monitor extends uvm_monitor;
`uvm_component_utils(master_monitor)


master_agent_config mcfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_monitor",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass



//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_monitor class object
//
// Parameters:
//  name   - instance name of the master_monitor
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function master_monitor::new(string name="master_monitor",uvm_component parent);
	super.new(name,parent);
endfunction



//-----------------------------------------------------------------------------
// Function: build_phase
// Gets the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------



function void master_monitor::build_phase(uvm_phase phase);
  if(!uvm_config_db#(master_agent_config)::get(this,"","MASTER_AGT_CONFIG",mcfg))
   `uvm_fatal("master_monitor","COULDNT GET")
endfunction



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the virtual interface to the interface handle of the monitor
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------





//-----------------------------------------------------------------------------
// Task: run_phase
// Collects the data
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

