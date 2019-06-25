// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : master_agt_sequence.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: master_agt_sequence
// Description of the class :
// This class is responsible for generating different stimulus for master
//-----------------------------------------------------------------------------

class master_sequence extends uvm_sequence#(master_xtn);
`uvm_object_utils(master_sequence)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_sequence");

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agt_sequence class object
//
// Parameters:
//  name   - instance name of the master_agt_sequence
//-----------------------------------------------------------------------------


function new(string name="master_agt_sequence");
	super.new(name);
endfunction


//-----------------------------------------------------------------------------
// Task: body
// master_xtn is randomized to get differnet test stimulus
//-----------------------------------------------------------------------------


