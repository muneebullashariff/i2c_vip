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


interface i2c_intf;
  wire scl;
  wire sda;
  bit clk_int;
  bit sda_int=1;
 // logic scl_i;
 // logic sda_i;

  clocking m_drv_cb_ctrl@(posedge scl);
     default input #1 output #1;
     output sda_int;
  endclocking

  clocking m_drv_cb_data @ (negedge scl);
     default input #1 output #1;
      output sda_int;
  endclocking

  clocking m_mon_cb @(posedge scl);
     default input #1 output #1;
     input scl;
     input sda;
  endclocking

  clocking s_drv_cb @ (posedge scl);
     default input #1 output #1;
     inout scl;
     inout sda;
  endclocking

  clocking s_mon_cb @(posedge scl);
     default input #1 output #1;
     input scl;
     input sda;
  endclocking

   modport M_DRV (clocking m_drv_cb_data);
   modport M_MON (clocking m_mon_cb);
   modport S_DRV (clocking s_drv_cb);
   modport S_MON (clocking s_mon_cb);

  
assign scl=(clk_int) ? 1'bz:1'b0;
assign (weak0,weak1)scl=1'b1;
assign scl_i = scl;

assign sda=(sda_int) ? 1'bz:1'b0;
assign (weak0,weak1)sda=1'b1;
assign sda_i = sda;

endinterface
