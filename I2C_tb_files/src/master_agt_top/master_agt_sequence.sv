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
// Class: master_agt_sequence
// Description of the class :
// This class is responsible for generating different stimulus for master
//-----------------------------------------------------------------------------

class master_agt_sequence extends uvm_sequence#(master_xtn);
`uvm_object_utils(master_agt_sequence)


//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_agt_sequence");
extern task body;

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_agt_sequence class object
//
// Parameters:
//  name   - instance name of the master_agt_sequence
//-----------------------------------------------------------------------------


function master_agt_sequence::new(string name="master_agt_sequence");
	super.new(name);
endfunction


//-----------------------------------------------------------------------------
// Task: body
// master_xtn is randomized to get differnet test stimulus
//-----------------------------------------------------------------------------

task master_agt_sequence::body;
     req=master_xtn::type_id::create("req");
     
     start_item(req);
       assert(req.randomize());
     finish_item(req);
    
endtask
