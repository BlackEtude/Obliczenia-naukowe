include("my_module.jl")
using my_module

f(x) = x + 5
g(x) = x^3 - 5

rysujNnfx(f, -10.0, 10.0, 5)
rysujNnfx(f, -10.0, 10.0, 25)

rysujNnfx(g, -10.0, 10.0, 5)
rysujNnfx(g, -10.0, 10.0, 20)

# println(naturalna([1.0, 2.0, 3.0], [1.0, 1.0, 0.0]))
# println(naturalna([3.0, 1.0, 5.0, 6.0], [1.0, 2.0, -0.375, 0.175]))
