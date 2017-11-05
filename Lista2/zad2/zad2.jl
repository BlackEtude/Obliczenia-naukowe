using Cairo
using Fontconfig
using Gadfly
using SymPy

theme = Theme(
    panel_fill = "white",
    default_color = "blue"
)

f(x) = log(1+exp.(-x))*exp.(x)
# draw(SVG("zad2/plotGadfly1.svg", 6inch, 3inch), plot(f, -1000, 1000, theme))
# draw(SVG("zad2/plotGadfly2.svg", 6inch, 3inch), plot(f, 32, 37, theme))

draw(PNG("zad2/plotGadfly1.png", 8inch, 5inch, dpi=600), plot(f, -1000, 1000, theme))
draw(PNG("zad2/plotGadfly2.png", 8inch, 5inch, dpi=), plot(f, 32, 37, theme))

x = symbols("x")
println("Expression's limit: $(limit(log(1+exp.(-x))*exp.(x), x => oo))")
