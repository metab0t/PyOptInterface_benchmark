#!/bin/bash

# Copyright (c) 2022: Miles Lubin and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

# Run as
#   $ ./gurobi_cpp_build.sh gurobiXX
# where `gurobiXX` is the version of Gurobi you are compiling for.

# Update if needed
# export GUROBI_HOME="/Library/gurobi951/macos_universal2/"

clang++ -O2 facility_gurobi.cpp -o facility_gurobi -I$GUROBI_HOME/include/ -L$GUROBI_HOME/lib -std=c++11 -lgurobi_c++ -lgurobi110
clang++ -O2 lqcp_gurobi.cpp -o lqcp_gurobi -I$GUROBI_HOME/include/ -L$GUROBI_HOME/lib -std=c++11 -lgurobi_c++ -lgurobi110

clang++ -O2 facility_copt.cpp -o facility_copt -I$COPT_HOME/include/ -I$COPT_HOME/include/coptcpp_inc -L$COPT_HOME/lib -std=c++11 -lcopt_cpp -lcopt
clang++ -O2 lqcp_copt.cpp -o lqcp_copt -I$COPT_HOME/include/ -I$COPT_HOME/include/coptcpp_inc -L$COPT_HOME/lib -std=c++11 -lcopt_cpp -lcopt
