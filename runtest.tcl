#
# QuestaSim run test example uvm
#
echo "ARGS = $argc"

## vlib vmap options
set QUESTA_LIB_DIR ./work
set QUESTA_LIB_NAME work
set outsim_dir outsim
cd $outsim_dir
rm -rf $QUESTA_LIB_NAME

vlib $QUESTA_LIB_NAME
vmap $QUESTA_LIB_NAME $QUESTA_LIB_DIR

## vlog options
set tb_dir C:/source/axi-uvm-master/tb
set compile_files $tb_dir/tb.sv
set TUTORIAL $argc
set compile_opts +define+TUTORIAL=$TUTORIAL
set questa_compile_opts "$compile_opts +define+CL_USE_QUESTA"

vlog +acc \
    $questa_compile_opts \
    -timescale 1ns/1ps \
    -sv     $tb_dir/params_pkg.sv \
            $tb_dir/axi_pkg.sv \
            $tb_dir/axi_uvm_pkg.sv \
            $tb_dir/axi_if.sv \
            $tb_dir/tb.sv \
            +incdir+C:/intelFPGA_lite/22.1std/questa_fse/uvm-1.1d/../verilog_src/uvm-1.1d/src

## vsim options
set top_module tb
set testname axi_sequential_reads_test
set questa_run_cmd_file ../questasim.cmd
set run_opts +UVM_TESTNAME=$testname
set questa_run_opts $run_opts

vsim $questa_run_opts $top_module -do $questa_run_cmd_file
