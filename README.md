## Preparation

- Install Julia
```
julia> ] activate .
julia> instantiate
```
- Install Python and dependencies
```
pip install -r requirements.txt
```


## Run benchmark experiments

This folder contains the benchmark experiments for the facility location and LQCP problems. The experiments are implemented in Julia, Python, C++. The experiments are run with the following solvers:

- C++
```
$ cpp_build.bat
$ julia cpp_run.jl gurobi
$ julia cpp_run.jl copt
```

- JuMP
```
$ julia facility.jl gurobi
$ julia lqcp.jl gurobi

$ julia facility.jl copt
$ julia lqcp.jl copt
```

- PyOptInterface
```
$ python facility_poi.py gurobi
$ python lqcp_poi.py gurobi

$ python facility_poi.py copt
$ python lqcp_poi.py copt
```

- gurobipy
```
$ python facility_gurobipy.py
$ python lqcp_gurobipy.py
```

- coptpy
```
$ python facility_coptpy.py
$ python lqcp_coptpy.py
```

- Pyomo
```
$ python facility_pyomo.py gurobi
$ python lqcp_pyomo.py gurobi

$ python facility_pyomo.py copt
$ python lqcp_pyomo.py copt
```

## Show results
The result is stored in `benchmarks.csv` file and can be shown by running
```
$ julia produce_table.jl
```

## Reference
The code for benchmark is adapted from https://github.com/jump-dev/JuMPPaperBenchmarks