// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_agent_config.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_agent_config
// Description of the class : Lower level components can be configured using
// this class
// This class acts like a container  
//-----------------------------------------------------------------------------

class slave_agent_config extends uvm_object;
	`uvm_object_utils(slave_agent_config)
	//virtual i2c_if vif;
	uvm_active_passive_enum is_active=UVM_ACTIVE;  



//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new (string name = "slave_agent_config");
endclass: slave_agent_config


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_agent_config class object
//
// Parameters:
//  name   - instance name of the slave_agent_config
//-----------------------------------------------------------------------------

function slave_agent_config::new(string name = "slave_agent_config");
		super.new(name);
	endfunction: new




