// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : Master_sequencer.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: Master_sequencer
// Description of the class :
// This class controls the flow of sequence_items between
// master_sequence and master_driver
//-----------------------------------------------------------------------------

class master_sequencer extends uvm_sequencer#(master_xtn);
`uvm_component_utils(master_sequencer)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_sequencer",uvm_component parent);

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_sequencer class object
//
// Parameters:
//  name   - instance name of the master_sequencer
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function master_sequencer::new(string name="master_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
