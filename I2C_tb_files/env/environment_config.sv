// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : environment_config.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: environment_config
// Description of the class :Lower level components can be configured using
// this class
// This class acts like a container
//-----------------------------------------------------------------------------

class environment_config extends uvm_object;
	`uvm_object_utils(environment_config)

	bit has_functional_coverage = 0;
	bit has_scoreboard = 1;
	bit has_magent = 1;
	bit has_sagent = 1;

	bit has_virtual_sequencer = 1;
	master_agent_config mcfg[];
	slave_agent_config scfg[];

	int no_of_magent=1;
	int no_of_sagent=1;
	int no_of_sb=1;




//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

	extern function new(string name = "environment_config");

endclass: environment_config

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the environment class object
//
// Parameters:
//  name   - instance name of the environment
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function environment_config::new(string name = "environment_config");
       super.new(name);
endfunction: new     



