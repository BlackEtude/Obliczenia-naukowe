include("fancy_module.jl")
using fancy_module

# MAIN
f(x) = (3 * x) - (e^x)

(r, v, it, err) = mbisekcji(f, 0.0, 1.0, 10 ^ (-4.0), 10^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

(r, v, it, err) = mbisekcji(f, 1.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

(r, v, it, err) = mbisekcji(f, 0.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)