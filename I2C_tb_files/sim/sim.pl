#!usr/bin/perl

system "vlib work";
system "vmap work work";

#system "vlog -work work -sv +incdir+E:/Windows/ethernet/EthernetRAL/RAL +incdir+E:/WIndows/ethernet/EthernetRAL/rtl ../rtl/defines/eth_defines.v ../rtl/*.v ../top.sv ../RAL/ethernet_ral_pkg.sv";

system "vlog -work work -sv ../env/top.sv ../test/i2c_pkg.sv";
system "vsim -voptargs=\"+acc=rnb\" -l i2c_sim.log +UVM_VERBOSITY=UVM_HIGH -novopt top -c -do \"log -r /*; add wave -r /*; run -all;\" +UVM_TESTNAME=i2c_test -wlf waveform.wlf";

## +acc=rnb 
## Compile my design so that all of it has:
## registers (r)
## nets (n)
## vector bits (b)
## Visible so that backdoor access will work correctly

