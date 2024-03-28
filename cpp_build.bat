@echo off

REM Copyright (c) 2022: Miles Lubin and contributors
REM
REM Use of this source code is governed by an MIT-style license that can be found
REM in the LICENSE.md file or at https://opensource.org/licenses/MIT.
REM
REM Run as
REM   > gurobi_cpp_build.bat gurobiXX
REM where `gurobiXX` is the version of Gurobi you are compiling for.

REM Update if needed
REM SET GUROBI_HOME=C:\gurobi1101\win64

REM Compile facility_gurobi.cpp
cl /EHsc /O2 facility_gurobi.cpp /I %GUROBI_HOME%\include /link /LIBPATH:%GUROBI_HOME%\lib gurobi_c++mt2017.lib gurobi110.lib /out:facility_gurobi.exe

REM Compile lqcp_gurobi.cpp
cl /EHsc /O2 lqcp_gurobi.cpp /I %GUROBI_HOME%\include /link /LIBPATH:%GUROBI_HOME%\lib gurobi_c++mt2017.lib gurobi110.lib /out:lqcp_gurobi.exe

REM Update if needed
REM SET COPT_HOME=C:\Program Files\copt71

REM Compile facility_copt.cpp
cl /EHsc /O2 facility_copt.cpp /I "%COPT_HOME%\include" /I "%COPT_HOME%\include\coptcpp_inc" /link /LIBPATH:"%COPT_HOME%\lib" copt_cpp.lib copt.lib /out:facility_copt.exe

REM Compile lqcp_copt.cpp
cl /EHsc /O2 lqcp_copt.cpp /I "%COPT_HOME%\include" /I "%COPT_HOME%\include\coptcpp_inc" /link /LIBPATH:"%COPT_HOME%\lib" copt_cpp.lib copt.lib /out:lqcp_copt.exe

del *.obj