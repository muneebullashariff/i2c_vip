// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : master_xtn.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: master_xtn
// Description of the class :
// This class contains variables that would ultimately be provided to
// interface
//-----------------------------------------------------------------------------

class master_xtn extends uvm_sequence_item;
`uvm_object_utils(master_xtn)




//--------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_xtn");

endclass
//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_xtn class object
//
// Parameters:
//  name   - instance name of the master_xtn
//-----------------------------------------------------------------------------


function master_xtn::new(string name="master_xtn");
	super.new(name);
endfunction
