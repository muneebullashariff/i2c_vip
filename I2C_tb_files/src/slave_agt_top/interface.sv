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


`ifndef i2c_intf__sv
`define i2c_intf__sv

// 

interface i2c_intf;
  bit scl;
  logic sda;


  clocking m_drv_cb @ (posedge scl);
     default input #1 output #0;
     input scl;
     output sda;
  endclocking

  clocking m_mon_cb @(posedge scl);
     default input #1 output #0;
     input scl;
     input sda;
  endclocking

  clocking s_drv_cb @ (posedge scl);
     default input #1 output #0;
     input scl;
     output sda;
  endclocking

  clocking s_mon_cb @(posedge scl);
     default input #1 output #0;
     input scl;
     input sda;
  endclocking

   modport M_DRV (clocking m_drv_cb);
   modport M_MON (clocking m_mon_cb);
   modport S_DRV (clocking s_drv_cb);
   modport S_MON (clocking s_mon_cb);

endinterface


`endif
