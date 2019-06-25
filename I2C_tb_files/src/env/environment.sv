// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : environment.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: environment
// Description of the class :
// This class acts like a container
//-----------------------------------------------------------------------------

class environment extends uvm_env;
`uvm_component_utils(environment)

master_agt_top mtop;
slave_agt_top stop;
scoreboard sb;
  environment_config ecfg;
//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="environment",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the environment class object
//
// Parameters:
//  name   - instance name of the environment
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function environment::new(string name="environment",uvm_component parent);
super.new(name,parent);
endfunction



//-----------------------------------------------------------------------------
// Function: build_phase
// Creates components for  master_agt_top,slave_agt_top and virtual_sequencer 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void environment::build_phase(uvm_phase phase);
  if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
 `uvm_error("ENV","COULDNT GET")

mtop=master_agt_top::type_id::create("mtop",this);

stop=slave_agt_top::type_id::create("stop",this);

sb=scoreboard::type_id::create("sb",this);

endfunction


//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects sequencers of virtaul sequencer to sequencers of respective agents
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

/*function void environment::connect_phase(uvm_phase phase);

foreach(mtop.magt[i])
  begin
	mtop.magt[i].monitor.mon_port.connect(sb.wrh[i].analysis_export);
  end

foreach(rtop.ragt[i])
   begin
	vseqr.rseqr[i]=rtop.ragt[i].seq;
	rtop.ragt[i].mon.mon_port.connect(sb.rdh[i].analysis_export);
  end

endfunction*/


