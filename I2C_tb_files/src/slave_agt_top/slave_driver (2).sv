//  ###########################################################################
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
// Class: slave_driver
// Description of the class :
// This class drives data to the interface 
//-----------------------------------------------------------------------------

class slave_driver extends uvm_driver#(slave_xtn);
`uvm_component_utils(slave_driver)

  slave_agent_config scfg;
  virtual i2c_intf vif;
  logic [6:0] slave_addr;
  logic [7:0] in_data;
  bit         ack;
  bit start_detected;
  event start_e, stop_e;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="slave_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task start_condition;
extern task slave_address;
extern task valid_slave_address;
extern task slave_ack;
extern task stop_condition;
endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the slave_driver class object
// Parameters:
// name   - instance name of the slave_driver
// parent - parent under which this component is created
//-----------------------------------------------------------------------------


function slave_driver::new(string name="slave_driver",uvm_component parent);
	super.new(name,parent);
endfunction:new
 

//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db#(slave_agent_config)::get(this,"","SLAVE_AGT_CONFIG",scfg))
   `uvm_fatal("slave_driver","COULDNT GET")
endfunction:build_phase



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the slave_driver to the required interface
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------


function void slave_driver::connect_phase(uvm_phase phase);
vif=scfg.vif;
endfunction:connect_phase


//-----------------------------------------------------------------------------
// Task: run_phase
// Initiates the main Driving task 
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------

task slave_driver::run_phase(uvm_phase phase);
 
super.run_phase(phase);
 // bit slave_valid=0;
//fork
	forever
	  begin
		  start_condition();
          end

/*	forever
	  begin
		  stop_condition();
          end
join


         wait(start_e.triggered);
	 //logic to check address
	 @ (negedge scl)
         for (int i=6; i<0; i--)
	 slave_addr[i]=intf.addr;
         

         @ (negedge scl)
	 for (int j=7; j<0; j--)
         in_data[i]=*/
         
endtask:run_phase

task slave_driver::start_condition();
	@ (negedge sda)
	if (scl==1'b1)
	begin
		//if (start_detected==1)
		//phase.raise_objection(this);
	-> start_e;
	$display("start condition detection");
        end
endtask:start_condition

/*task slave_drive::stop_condition();
	@ (posedge sda)
	if (scl==1'b1)
	begin
		//if (start_detected==0)
		//phase.drop_objection(this);
	-> stop_e;
        end
endtask:stop_condition

task slave_driver::slave_ack();
	@ (negedge scl)
	sda==1'b0;

	@ (negedge scl)
	sda==1'b1;
  
endtask:slave_ack
