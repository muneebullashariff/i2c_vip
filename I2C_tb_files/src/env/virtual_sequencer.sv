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
// Class: virtual_sequencer
// Description of the class :
// This class acts like a container to sequencers of
// master agents and slave agents 
//-----------------------------------------------------------------------------

`ifndef virtual_sequencer
`define virtual_sequencer


class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
`uvm_component_utils(virtual_sequencer)

  master_sequencer mseqr[];
  slave_sequencer sseqr[];
  environment_config ecfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="virtual_sequencer",uvm_component parent);
extern function void build_phase(uvm_phase phase);

endclass
//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the virtual_sequencer class object
//
// Parameters:
//  name   - instance name of the virtual_sequencer
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------

function virtual_sequencer::new(string name="virtual_sequencer",uvm_component parent);
super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Get the configuration object
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

function void virtual_sequencer::build_phase(uvm_phase phase);
if(!uvm_config_db#(environment_config)::get(this,"","ENVIRONMENT_CONFIG",ecfg))
  `uvm_error("VSEQR","COULDNT GET")

  mseqr=new[ecfg.no_of_magent];
  sseqr=new[ecfg.no_of_sagent];

endfunction

`endif
