#!/bin/sh -f
# ****************************************************************************
# Vivado (TM) v2017.3 (64-bit)
#
# Filename    : setup.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Script for creating setup files and library mappings
#
# Generated by Vivado on Fri Oct 18 17:27:30 CST 2019
# SW Build 2018833 on Wed Oct  4 19:58:07 MDT 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
#
# usage: setup.sh
#
# ****************************************************************************

# Script usage
usage()
{
  msg="Usage: setup.sh [-help]\n\
Usage: setup.sh [-reset_run]\n\n\
\
[-help] -- Print help\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
\t\tfrom the previous run will be removed automatically.\n"
  echo -e $msg
  exit 1
}

# Create design library directory paths and define design library mappings in cds.lib
create_lib_mappings()
{
  libs=(xil_defaultlib)
  file="synopsys_sim.setup"
  dir="vcs_lib"

  if [[ -e $file ]]; then
    rm -f $file
  fi
  if [[ -e $dir ]]; then
    rm -rf $dir
  fi

  touch $file
  lib_map_path="/home/wangguobin/vivado_2017_4_vcs_lib"
  incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
  for (( i=0; i<${#libs[*]}; i++ )); do
    lib="${libs[i]}"
    lib_dir="$dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
      mapping="$lib : $dir/$lib"
      echo $mapping >> $file
    fi
  done
  echo $incl_ref >> $file
}

# Delete generated files from the previous run
reset_run()
{
  files_to_remove=(64 ucli.key AN.DB csrc fifo_generator_0_tb_simv fifo_generator_0_tb_simv.daidir inter.vpd vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done
}

setup()
{
  case $1 in
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    * )
    ;;
  esac

  create_lib_mappings
  touch hdl.var
  echo -e "INFO: Simulation setup files and library mappings created.\n"
  # Add any setup/initialization commands here:-
  # <user specific commands>
}

# Script info
echo -e "setup.sh - Script generated by launch_simulation (Vivado v2017.3 (64-bit)-id)\n"

# Check command line args
if [[ $# > 1 ]]; then
  echo -e "ERROR: invalid number of arguments specified\n"
  usage
fi

if [[ ($# == 1 ) && ($1 != "-reset_run" && $1 != "-help" && $1 != "-h") ]]; then
  echo -e "ERROR: unknown option specified '$1' (type "setup.sh -help" for for more info)"
  exit 1
fi

if [[ ($1 == "-help" || $1 == "-h") ]]; then
  usage
fi

# Launch script
setup $1
