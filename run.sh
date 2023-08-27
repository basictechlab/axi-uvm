#!/bin/bash
export TB_PATH=`pwd`/uvm_add.srcs/sim_1/new
export SRC_PATH=`pwd`/uvm_add.srcs/sources_1/new
export TEST_NAME="dwc_eth_test_default"

vsim -c -do "do runtest.do TEST_NAME"

