// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : virtual_sequencer.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: virtual_sequencer
// Description of the class :
// This class acts like a container to sequencers of
// master agents and slave agents 
//-----------------------------------------------------------------------------



class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
`uvm_component_utils(virtual_sequencer)

  master_sequencer mseqr[];
  slave_sequencer sseqr[];
environment_config ecfg;
//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="virtual_sequencer",uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass
//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the virtual_sequencer class object
//
// Parameters:
//  name   - instance name of the virtual_sequencer
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function virtual_sequencer::new(string name="virtual_sequencer",uvm_component parent);
super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Get the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

function void virtual_sequencer::build_phase(uvm_phase phase);
if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
  `uvm_error("VSEQR","COULDNT GET")

  mseqr=new[ecfg.no_of_magent];
  sseqr=new[ecfg.no_of_sagent];

endfunction


