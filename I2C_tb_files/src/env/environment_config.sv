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
// Class: environment_config
// Description of the class :Lower level components can be configured using
// this class
// This class acts like a container
//-----------------------------------------------------------------------------

`ifndef environment_config
`define environment_config

class environment_config extends uvm_object;
	`uvm_object_utils(environment_config)

	bit has_functional_coverage = 0;
	bit has_scoreboard = 1;
	bit has_magent = 1;
	bit has_sagent = 1;

	bit has_virtual_sequencer = 1;
	master_agent_config mcfg[];
	slave_agent_config scfg[];

	int no_of_magent=1;
	int no_of_sagent=1;
	int no_of_sb=1;


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name = "environment_config");


endclass: environment_config

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the environment class object
//
// Parameters:
//  name   - instance name of the environment
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function environment_config::new(string name = "environment_config");
       super.new(name);
endfunction: new     

`endif
