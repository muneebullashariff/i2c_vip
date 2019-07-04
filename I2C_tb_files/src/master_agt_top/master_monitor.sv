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
// Class: Master_monitor
// Description of the class :
// This class samples the DUT signals through virtual interface
//-----------------------------------------------------------------------------

`ifndef master_monitor
`define master_monitor


class master_monitor extends uvm_monitor;
`uvm_component_utils(master_monitor)

master_agent_config mcfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_monitor",uvm_component parent);
extern function void build_phase(uvm_phase phase);
//extern function void connect_phase(uvm_phase phase);

endclass



//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_monitor class object
//
// Parameters:
//  name   - instance name of the master_monitor
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function master_monitor::new(string name="master_monitor",uvm_component parent);
	super.new(name,parent);
endfunction



//-----------------------------------------------------------------------------
// Function: build_phase
// Gets the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------



function void master_monitor::build_phase(uvm_phase phase);
  if(!uvm_config_db#(master_agent_config)::get(this,"","MASTER_AGENT_CONFIG",mcfg))
   `uvm_fatal("master_monitor","COULDNT GET")
endfunction



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the virtual interface to the interface handle of the monitor
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------





//-----------------------------------------------------------------------------
// Task: run_phase
// Collects the data
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

`endif
