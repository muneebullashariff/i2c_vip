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
// Class: environment
// Description of the class :
// This class acts like a container
//-----------------------------------------------------------------------------

`ifndef environment
`define environment

class environment extends uvm_env;
`uvm_component_utils(environment)

master_agt_top mtop;
slave_agt_top stop;
scoreboard sb;
environment_config ecfg;
virtual_sequencer vseqr;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------


extern function new(string name="environment",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);


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

vseqr=virtual_sequencer::type_id::create("vsqr",this);

endfunction


//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects sequencers of virtaul sequencer to sequencers of respective agents
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

function void environment::connect_phase(uvm_phase phase);

foreach(mtop.magt[i])
  begin
	//mtop.magt[i].monitor.mon_port.connect(sb.wrh[i].analysis_export);
	vseqr.mseqr[i]=mtop.magt[i].sequencer;
  end

foreach(stop.sagt[i])
   begin
	//rtop.ragt[i].mon.mon_port.connect(sb.rdh[i].analysis_export);
 	vseqr.sseqr[i]=stop.sagt[i].sequencer;
   end

endfunction

  function void environment:: end_of_elaboration_phase (uvm_phase phase);
         uvm_top.print_topology ();
      endfunction
 
`endif
