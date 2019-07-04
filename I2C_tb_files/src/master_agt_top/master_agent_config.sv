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
// Class: master_agent_config
// Description of the class :Lower level components can be configured using
// this class
// This class acts like a container  
//-----------------------------------------------------------------------------

`ifndef master_agent_config
`define master_agent_config

class master_agent_config extends uvm_object;
  `uvm_object_utils(master_agent_config)
   virtual i2c_intf vif;
   uvm_active_passive_enum is_active=UVM_ACTIVE;  
	
  //Each master can decide its own frequenecy of operation based on this value
   int clk_period=10;


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new (string name = "master_agent_config");
endclass: master_agent_config


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agent_config class object
//
// Parameters:
//  name   - instance name of the master_agent_config
//-----------------------------------------------------------------------------

function master_agent_config::new(string name = "master_agent_config");
		super.new(name);
endfunction: new

`endif



