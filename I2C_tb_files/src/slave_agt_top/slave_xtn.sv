// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_xtn.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_xtn
// Description of the class :
// This class contains variables that would ultimately be provided to
// interface
//-----------------------------------------------------------------------------


class slave_xtn extends uvm_sequence_item;
`uvm_object_utils(slave_xtn)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="slave_xtn");

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_xtn class object
//
// Parameters:
//  name   - instance name of the slave_xtn
//-----------------------------------------------------------------------------


function slave_xtn::new(string name="slave_xtn");
	super.new(name);
endfunction
