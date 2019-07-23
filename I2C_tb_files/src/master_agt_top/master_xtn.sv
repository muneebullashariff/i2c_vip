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
// Class: master_xtn
// Description of the class :
// This class contains variables that would ultimately be provided to
// interface
//-----------------------------------------------------------------------------
`ifndef master_xtn
`define master_xtn

typedef enum {ADDRESS_7BIT=7, ADDRESS_10BIT=10} slave_address_e; 

class master_xtn extends uvm_sequence_item;
`uvm_object_utils(master_xtn)

rand bit [9:0]slave_address;
rand bit rd_wr;
bit ack;
rand bit [7:0]write_data;
rand slave_address_e sl_addr_mode; 

//--------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_xtn");
extern function void do_print(uvm_printer printer);

constraint w_data{ write_data == 8'b0000_0000;}
constraint s_addr{ 
                  if (sl_addr_mode == ADDRESS_7BIT)  { slave_address == 7'b100_0000; }
                  if (sl_addr_mode == ADDRESS_10BIT) { slave_address == 10'b00_0000_0001; } 
                  }
constraint slave_address_mode_c { sl_addr_mode == ADDRESS_7BIT; }
constraint read_write{ rd_wr == 1'b0;}

endclass:master_xtn
//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_xtn class object
//
// Parameters:
//  name   - instance name of the master_xtn
//-----------------------------------------------------------------------------


function master_xtn::new(string name="master_xtn");
	super.new(name);
endfunction:new


//-----------------------------------------------------------------------------
// Function: do_print
// prints the transaction items when called 
//
// Parameters:
// phase - stores the current phase 
//-----------------------------------------------------------------------------

function void master_xtn::do_print(uvm_printer printer);
        super.do_print(printer);
printer.print_field("RD_WR",		this.rd_wr,	        1,	UVM_BIN);
printer.print_field("SLAVE_ADDR",	this.slave_address,	7,	UVM_BIN);
printer.print_field("WRITE_DATA",	this.write_data,	8,	UVM_BIN);
endfunction

`endif
