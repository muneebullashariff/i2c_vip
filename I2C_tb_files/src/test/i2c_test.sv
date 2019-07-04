//  ############################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//  ###########################################################################

//-----------------------------------------------------------------------------
// Class: i2c_test
// Description of the class :
// This class acts like a individual block intended to test the design
//-----------------------------------------------------------------------------

`ifndef i2c_test
`define i2c_test

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
        
        env_cfg = environment_config  ::  type_id :: create("env_cfg");
        env_cfg.mcfg=new[no_of_magent];
        env_cfg.scfg=new[no_of_sagent];

        mcfg=new[no_of_magent];
        foreach(mcfg[i])
   	    begin
               mcfg[i]=master_agent_config::type_id::create($sformatf("mcfg[%0d]",i));
		if(!uvm_config_db#(virtual i2c_intf)::get(this,"","VIF_0",mcfg[i].vif))
      		   `uvm_fatal("TEST","COULDNT GET")
                env_cfg.mcfg[i]=mcfg[i];
            end

        scfg=new[no_of_sagent];
        foreach(scfg[i])
   	    begin
               scfg[i]=slave_agent_config::type_id::create($sformatf("scfg[%0d]",i));
		if(!uvm_config_db#(virtual i2c_intf)::get(this,"","VIF_0",scfg[i].vif))
      		   `uvm_fatal("TEST","COULDNT GET")
                env_cfg.scfg[i]=scfg[i];
            end
        
        uvm_config_db#(environment_config) :: set(this, "*", "ENVIRONMENT_CONFIG", env_cfg);
        
        env     = environment         ::  type_id :: create("env",this);
      endfunction : build_phase


//-----------------------------------------------------------------------------
// Task: run_phase
// Starts virtual_sequence on to virtual_sequencer in environment
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

`endif

`ifndef test1
`define test1

class test1 extends i2c_test;
`uvm_component_utils(test1)

sequence_one seq;

function new(string name="test1",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
seq=sequence_one::type_id::create("seq");

phase.raise_objection(this);
  seq.start(env.vseqr);
  #20;
phase.drop_objection(this);
endtask

endclass

`endif
