// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_monitor.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_monitor
// Description of the class :
// This class samples the DUT signals through virtual interface
//-----------------------------------------------------------------------------


class slave_monitor extends uvm_monitor;
`uvm_component_utils(slave_monitor)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="slave_monitor",uvm_component parent);
//extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass



//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_monitor class object
//
// Parameters:
//  name   - instance name of the slave_monitor
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function slave_monitor::new(string name="slave_monitor",uvm_component parent);
	super.new(name,parent);
endfunction:new



//-----------------------------------------------------------------------------
// Function: build_phase
// Gets the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------




