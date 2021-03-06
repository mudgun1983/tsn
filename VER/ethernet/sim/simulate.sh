#!/bin/sh -f
# ****************************************************************************
# Vivado (TM) v2017.3 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Oct 18 17:28:23 CST 2019
# SW Build 2018833 on Wed Oct  4 19:58:07 MDT 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************

# installation path setting
bin_path="/usr/synopsys/L-2016.06/bin"

# set fifo_generator_0_tb_simv command line args
fifo_generator_0_tb_simv_opts="-ucli -licqueue -l simulate.log"

# run simulation
./fifo_generator_0_tb_simv -gui $fifo_generator_0_tb_simv_opts -do fifo_generator_0_tb_simulate.do
