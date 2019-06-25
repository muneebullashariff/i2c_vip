// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : master_agent_config.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: master_agent_config
// Description of the class :Lower level components can be configured using
// this class
// This class acts like a container  
//-----------------------------------------------------------------------------

class master_agent_config extends uvm_object;
	`uvm_object_utils(master_agent_config)
	//virtual i2c_if vif;
	uvm_active_passive_enum is_active=UVM_ACTIVE;  



//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new (string name = "master_agent_config");
endclass: master_agent_config


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agent_config class object
//
// Parameters:
//  name   - instance name of the master_agent_config
//-----------------------------------------------------------------------------

function master_agent_config::new(string name = "master_agent_config");
		super.new(name);
	endfunction: new




