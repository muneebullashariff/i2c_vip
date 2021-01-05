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
// Class: virtual_sequence
// Description of the class :
// This class is responsible for starting various sequences
// on to respective sequencers 
//-----------------------------------------------------------------------------

`ifndef virtual_sequence
`define virtual_sequence

class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
`uvm_object_utils(virtual_sequence)

environment_config ecfg;
master_sequencer mseqr[];
slave_sequencer sseqr[];
virtual_sequencer vseqr;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="virtual_sequence");
extern task body;

endclass

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the virtual_sequence class object
//
// Parameters:
//  name   - instance name of the virtual_sequence
//-----------------------------------------------------------------------------


function virtual_sequence::new(string name="virtual_sequence");
         super.new(name);
endfunction



//-----------------------------------------------------------------------------
// Task: body
// master_agt_sequence and slave_agent_sequence is started on 
// respective  sequencers
//-----------------------------------------------------------------------------

task virtual_sequence::body;
if(!uvm_config_db#(environment_config)::get(null,get_full_name(),"ENVIRONMENT_CONFIG",ecfg))
  `uvm_error("VSEQ","COULDNT GET")

mseqr=new[ecfg.no_of_magent];
sseqr=new[ecfg.no_of_sagent];

assert($cast(vseqr,m_sequencer))
  else
  `uvm_error("VSEQ","COULDNT CAST")

foreach(mseqr[i])
 mseqr[i]=vseqr.mseqr[i];
foreach(sseqr[i])
 sseqr[i]=vseqr.sseqr[i];

endtask

`endif


class sequence_one extends virtual_sequence;
`uvm_object_utils(sequence_one)

master_agt_sequence mseq;

function new(string name="sequence_one");
super.new(name);
endfunction

task body;
super.body;

mseq=master_agt_sequence::type_id::create("mseq");

mseq.start(mseqr[0]);

endtask

endclass


         
