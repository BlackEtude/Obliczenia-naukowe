#Agata Jasionowska - 229726

include("roots_module.jl")
using roots_module

# MAIN
f(x) = (3 * x) - (e^x)

# Call for [a,b] = [0.0,1.0]
(r, v, it, err) = mbisekcji(f, 0.0, 1.0, 10 ^ (-4.0), 10^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

# Call for [a,b] = [1.0,2.0]
(r, v, it, err) = mbisekcji(f, 1.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)

# Call for [a,b] = [1.0,2.0]
(r, v, it, err) = mbisekcji(f, 0.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("\nBisection:")
println("root = ", r)
println("value = ", v)
println("iters = ", it)
println("err = ", err)
