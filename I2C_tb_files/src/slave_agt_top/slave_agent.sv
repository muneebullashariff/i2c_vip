// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_agent.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_agent
// Description of the class :
// This class acts like a container. 
//-----------------------------------------------------------------------------

class slave_agent extends uvm_agent;
`uvm_component_utils(slave_agent)

slave_driver driver;
slave_monitor monitor;
slave_sequencer sequencer;

slave_agent_config scfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="slave_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_agent class object
//
// Parameters:
//  name   - instance name of the slave_agent
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function slave_agent::new(string name="slave_agent",uvm_component parent);
	super.new(name,parent);
endfunction:new


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the components according to is_active value 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_agent::build_phase(uvm_phase phase);

  if(!uvm_config_db#(slave_agent_config)::get(this,"","SLAVE_AGT_CONFIG",scfg))
   `uvm_fatal("slave_agent","COULDNT GET")

     monitor=slave_monitor::type_id::create("monitor",this);
  if(scfg.is_active==UVM_ACTIVE)
   begin
     driver=slave_driver::type_id::create("driver",this);
     sequencer=slave_sequencer::type_id::create("sequencer",this);
   end

endfunction:build_phase


//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects slave_driver to slave_sequencer using TLM Ports if
// is_active==UVM_ACTIVE
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

function void slave_agent::connect_phase(uvm_phase phase);
  if(scfg.is_active==UVM_ACTIVE)
    driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction:connect_phase
