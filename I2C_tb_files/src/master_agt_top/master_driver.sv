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
// Class: Master_driver
// Description of the class :
// This class drives data to the interface 
//-----------------------------------------------------------------------------
`ifndef master_driver
`define master_driver

class master_driver extends uvm_driver#(master_xtn);
`uvm_component_utils(master_driver)

virtual i2c_intf vif;
master_agent_config mcfg;

//---------------------------------------------
// Externally defined tasks and functions
//---------------------------------------------

extern function new(string name="master_driver",uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task drive_to_dut(master_xtn xtn);
extern task send_start_bit(master_xtn xtn);
extern task send_slave_address(master_xtn xtn);
extern task send_write_data(master_xtn xtn);
extern task send_stop_bit(master_xtn xtn);

endclass


//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the master_driver class object
//
// Parameters:
//  name   - instance name of the master_driver
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------


function master_driver::new(string name="master_driver",uvm_component parent);
	super.new(name,parent);
endfunction


//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void master_driver::build_phase(uvm_phase phase);
  if(!uvm_config_db#(master_agent_config)::get(this,"","MASTER_AGENT_CONFIG",mcfg))
   `uvm_fatal("master_driver","COULDNT GET")
endfunction



//-----------------------------------------------------------------------------
// Function: connect_phase
// Connects the master_driver to the required interface
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------


function void master_driver::connect_phase(uvm_phase phase);
vif=mcfg.vif;
endfunction



//-----------------------------------------------------------------------------
// Task: run_phase
// Initiates the main Driving task 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------

task master_driver::run_phase(uvm_phase phase);

  fork 
    forever
      begin
       #(mcfg.clk_period) vif.clk_int=!vif.clk_int;
      end
  join_none
  
  forever
    begin
 	  seq_item_port.get_next_item(req);
	  drive_to_dut(req);
	  seq_item_port.item_done;
    end
endtask


task master_driver::drive_to_dut(master_xtn xtn);
    send_start_bit(xtn);
    send_slave_address(xtn);
  repeat(mcfg.no_of_data_item)
   begin
    send_write_data(xtn);
   end
   send_stop_bit(xtn);
endtask: drive_to_dut

//-----------------------------------------------------------------------------
// Task: send_start_bit
// sends the start bit of the transaction
//
// Parameters:
//  xtn - stores the transaction object handle 
//-----------------------------------------------------------------------------

task master_driver::send_start_bit(master_xtn xtn);
           @(vif.m_drv_cb_ctrl);
	    vif.m_drv_cb_ctrl.sda_int<=1'b0;//Pulls the line low to indicate start of a transfer
endtask


//-----------------------------------------------------------------------------
// Task:send_slave_address
// sends the slave address of slave for write/read operation 
// 
// Parameters:
//  xtn - stores the transaction object handle 
//-----------------------------------------------------------------------------

task master_driver::send_slave_address(master_xtn xtn);

   // Driving the MSB bit of the slave address
  for(int i=xtn.sl_addr_mode-1; i>=0; i--)
   begin
    @(vif.m_drv_cb_data);
    vif.m_drv_cb_data.sda_int<=xtn.slave_address[i];
   end
   //master decides either read/write operation
    @(vif.m_drv_cb_data);
    vif.m_drv_cb_data.sda_int<=xtn.rd_wr;
    @(vif.m_drv_cb_data);
    vif.m_drv_cb_data.sda_int<=1'b1;     //Release sda line so that slave can send ack/nack

    //@(vif.m_drv_cb_ctrl);
endtask

 
//-----------------------------------------------------------------------------
// Task:send_write_data
// sends the data that is to be written into the slave
// 
// Parameters:
//  xtn - stores the transaction object handle 
//-----------------------------------------------------------------------------

task master_driver::send_write_data(master_xtn xtn);
	for(int i=0;i<8;i++)
	  begin
	    @(vif.m_drv_cb_data);
	     vif.m_drv_cb_data.sda_int<=xtn.write_data[7-i];
	  end
    	    @(vif.m_drv_cb_data);
	    vif.m_drv_cb_data.sda_int<=1'b1;     //Release sda line so that slave can send ack/nack

endtask


//-----------------------------------------------------------------------------
// Task:send_stop_bit
// sends the stop bit to indicate the end of transfer
// 
// Parameters:
//  xtn - stores the transaction object handle 
//-----------------------------------------------------------------------------

task master_driver::send_stop_bit(master_xtn xtn);
           @(vif.m_drv_cb_ctrl);
	   vif.m_drv_cb_ctrl.sda_int<=1'b1;//Releases the line at posedge indicating end of transfer
endtask


`endif
