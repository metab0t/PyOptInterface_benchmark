# Copyright (c) 2022: Miles Lubin and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function main(io::IO)
    optimizer = ARGS[1]

    for n in [25, 50, 75, 100]
        start = time()
        file = joinpath(@__DIR__, "facility_$optimizer")
        run(`$file $n $n`)
        run_time = round(time() - start, digits=1)
        content = "$optimizer fac-$n 0 $run_time"
        println(stdout, content)
        println(io, content)
    end
    for n in [500, 1000, 1500, 2000]
        start = time()
        file = joinpath(@__DIR__, "lqcp_$optimizer")
        run(`$file $n $n`)
        run_time = round(time() - start, digits=1)
        content = "$optimizer lqcp-$n 0 $run_time"
        println(stdout, content)
        println(io, content)
    end
    return
end

open(joinpath(@__DIR__, "benchmarks.csv"), "a") do io
    main(io)
end
