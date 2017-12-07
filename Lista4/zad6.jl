#Agata Jasionowska - 229726

include("my_module.jl")
using my_module

#a
f(x) = abs(x)
rysujNnfx(f, -1.0, 1.0, 5);
rysujNnfx(f, -1.0, 1.0, 10);
rysujNnfx(f, -1.0, 1.0, 15);

#b
g(x) = 1/(1+x^2)
rysujNnfx(g, -5.0, 5.0, 5);
rysujNnfx(g, -5.0, 5.0, 10);
rysujNnfx(g, -5.0, 5.0, 15);
