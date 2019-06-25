// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_agt_sequence.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_sequencer
// Description of the class :
// This class is responsible for generating different stimulus for slave
//-----------------------------------------------------------------------------


class slave_sequencer extends uvm_sequencer#(slave_xtn);
`uvm_component_utils(slave_sequencer)



//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="slave_sequencer",uvm_component parent);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_agt_sequence class object
//
// Parameters:
//  name   - instance name of the slave_agt_sequence
//-----------------------------------------------------------------------------



function slave_sequencer::new(string name="slave_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Task: body
// slave_xtn is randomized to get differnet test stimulus
//-----------------------------------------------------------------------------


