## Run benchmark experiments

```
# optimizer = gurobi/copt
$ julia facility.jl gurobi
$ julia lqcp.jl gurobi

$ python facility_gurobipy.py
$ python facility_poi.py gurobi
$ python lqcp_gurobipy.py
$ python lqcp_poi.py gurobi
$ python facility_pyomo.py gurobi
$ python lqcp_pyomo.py gurobi

$ julia facility.jl copt
$ julia lqcp.jl copt

$ python facility_coptpy.py
$ python facility_poi.py copt
$ python lqcp_coptpy.py
$ python lqcp_poi.py copt
$ python facility_pyomo.py copt
$ python lqcp_pyomo.py copt

$ cpp_build.bat
$ julia cpp_run.jl gurobi
$ julia cpp_run.jl copt

# analyze result
$ julia produce_table.jl

# AMPL test
$ ampl facility.run
$ ampl lqcp.run
```