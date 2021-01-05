// ############################################################################
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
// Class: scoreboard
// Description of the class :
// This class acts like a place to validate data integrity  
//-----------------------------------------------------------------------------


class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)


environment_config ecfg;

uvm_tlm_analysis_fifo #(master_xtn) wrh[];
uvm_tlm_analysis_fifo #(slave_xtn)  rdh[];

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="scoreboard",uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the scoreboard class object
//
// Parameters:
//  name   - instance name of the scoreboard
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------



function scoreboard::new(string name="scoreboard",uvm_component parent);
super.new(name,parent);
endfunction



//-----------------------------------------------------------------------------
// Function: build_phase
// Get the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void scoreboard::build_phase(uvm_phase phase);
if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
 `uvm_error("SCOREBOARD","COULDNT GET")

wrh=new[ecfg.no_of_magent];
rdh=new[ecfg.no_of_sagent];

foreach(wrh[i])
wrh[i]=new($sformatf("wrh[%0d]",i),this);

foreach(rdh[i])
rdh[i]=new($sformatf("rdh[%0d]",i),this);


endfunction






