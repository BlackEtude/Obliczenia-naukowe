# Agata Jasionowska - 229726

include("my_module.jl")
using my_module

#a
f(x) = e^x
rysujNnfx(f, 0.0, 1.0, 5);
rysujNnfx(f, 0.0, 1.0, 10);
rysujNnfx(f, 0.0, 1.0, 15);

#b
g(x) = (x^2)*sin(x)
rysujNnfx(g, -1.0, 1.0, 5);
rysujNnfx(g, -1.0, 1.0, 10);
rysujNnfx(g, -1.0, 1.0, 15);
