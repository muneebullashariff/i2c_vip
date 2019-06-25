// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : master_agent.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: master_agent
// Description of the class :
// This class acts like a container. 
//-----------------------------------------------------------------------------

class master_agent extends uvm_agent;
`uvm_component_utils(master_agent)

master_driver driver;
master_monitor monitor;
master_sequencer sequencer;

master_agent_config mcfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_agent",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agent class object
//
// Parameters:
//  name   - instance name of the master_agent
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function master_agent::new(string name="master_agent",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the components according to is_active value 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void master_agent::build_phase(uvm_phase phase);

  if(!uvm_config_db#(master_agent_config)::get(this,"","MASTER_AGT_CONFIG",mcfg))
   `uvm_fatal("master_agent","COULDNT GET")

     monitor=master_monitor::type_id::create("monitor",this);
  if(mcfg.is_active==UVM_ACTIVE)
   begin
     driver=master_driver::type_id::create("driver",this);
     sequencer=master_sequencer::type_id::create("sequencer",this);
   end

endfunction


//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects master_driver to master_sequencer using TLM Ports if
// is_active==UVM_ACTIVE
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

function void master_agent::connect_phase(uvm_phase phase);
  if(mcfg.is_active==UVM_ACTIVE)
    driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction
