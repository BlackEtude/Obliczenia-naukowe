# Pkg.add("Cairo")
# Pkg.add("Fontconfig")
# Pkg.add("Gadfly")

using Cairo
using Fontconfig
using Gadfly
using SymPy

theme = Theme(
    panel_fill = "white",
    default_color = "red"
)

f(x) = log(1+exp.(-x))*exp.(x)
draw(SVG("plotGadfly.svg", 6inch, 3inch), plot(f, -1000, 1000, theme))

x = symbols("x")
println("Expression's limit: $(limit(log(1+exp.(-x))*exp.(x), x => oo))")
