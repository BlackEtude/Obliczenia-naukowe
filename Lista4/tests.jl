include("my_module.jl")
using my_module

f(x) = x + 5
g(x) = x^3 - 5
rysujNnfx(f, -10.0, 10.0, 5)
rysujNnfx(f, -10.0, 10.0, 25)

rysujNnfx(g, -10.0, 10.0, 5)
rysujNnfx(g, -10.0, 10.0, 20)
