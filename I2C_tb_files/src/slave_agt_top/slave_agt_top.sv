// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : slave_agt_top.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: slave_agt_top
// Description of the class :
// This class acts like a container to slave agents 
//-----------------------------------------------------------------------------


class slave_agt_top extends uvm_agent;
`uvm_component_utils(slave_agt_top)

slave_agent sagt[];
environment_config ecfg;


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="slave_agt_top",uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_agt_top class object
//
// Parameters:
//  name   - instance name of the slave_agt_top
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------


function slave_agt_top::new(string name="slave_agt_top",uvm_component parent);
	super.new(name,parent);
endfunction:new


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the slave_agent components 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_agt_top::build_phase(uvm_phase phase);
  if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
  `uvm_fatal("SLAVE_AGT_TOP","couldnt get")

  sagt=new[ecfg.no_of_sagent];
foreach(sagt[i])
 begin
  sagt[i]=slave_agent::type_id::create($sformatf("magt[%0d]",i),this);
   uvm_config_db#(slave_agent_config)::set(this,"*","SLAVE_AGT_CONFIG",ecfg.scfg[i]);
 end
endfunction:build_phase
