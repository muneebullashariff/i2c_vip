// ############################################################################
//
// Project : Verification of I2C VIP
//
// File_name : i2c_test.sv
//
// https://github.com/muneebullashariff/i2c_vip
//
// ############################################################################

//-----------------------------------------------------------------------------
// Class: i2c_test
// Description of the class :
// This class acts like a individual block intended to test the design
//-----------------------------------------------------------------------------
class i2c_test extends uvm_test;

  `uvm_component_utils(i2c_test)
  master_agent_config mcfg[];
  slave_agent_config scfg[];
  
  environment_config     env_cfg;
  environment            env;
  int no_of_magent=1;
  int no_of_sagent=1;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

    extern function new (string name = "i2c_test", uvm_component parent);
    extern function void build_phase(uvm_phase phase);
endclass:i2c_test
//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the i2c_test class object
//
// Parameters:
//  name   - instance name of the i2c_test
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function i2c_test::new(string name="i2c_test",uvm_component parent);
	super.new(name,parent);
endfunction:new





//-----------------------------------------------------------------------------
// Function: build_phase
// Creates component for environment 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void i2c_test :: build_phase(uvm_phase phase);
        super.build_phase(phase);
       
        
        //creating environment and environment config
        
        env     = environment         ::  type_id :: create("env",this);
        env_cfg = environment_config  ::  type_id :: create("env_cfg");
        env_cfg.mcfg=new[no_of_magent];
        env_cfg.scfg=new[no_of_sagent];

        mcfg=new[no_of_magent];
        foreach(mcfg[i])
   	    begin
          mcfg[i]=master_agent_config::type_id::create($sformatf("mcfg[%0d]",i));
               env_cfg.mcfg[i]=mcfg[i];
            end

         scfg=new[no_of_sagent];
        foreach(scfg[i])
   	    begin
          scfg[i]=slave_agent_config::type_id::create($sformatf("scfg[%0d]",i));
               env_cfg.scfg[i]=scfg[i];
            end
        
        uvm_config_db#(environment_config) :: set(this, "*", "ENVIRONMENT_CONFIG", env_cfg);
        
      endfunction : build_phase


//-----------------------------------------------------------------------------
// Task: run_phase
// Starts virtual_sequence on to virtual_sequencer in environment
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------



