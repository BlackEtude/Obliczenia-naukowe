#Agata Jasionowska - 229726

using Cairo
using Fontconfig
using Gadfly
using SymPy

theme = Theme(
    panel_fill = "white",
    default_color = "blue"
)

f(x) = log(1+exp.(-x))*exp.(x)
g(x) = Float32(log(1+Float32(exp.(-x)))*Float32(exp.(x)))
h(x) = Float16(log(1+Float16(exp.(-x)))*Float16(exp.(x)))
# draw(SVG("zad2/plotGadfly1.svg", 6inch, 3inch), plot(f, -1000, 1000, theme))
# draw(SVG("zad2/plotGadfly2.svg", 6inch, 3inch), plot(f, 32, 37, theme))

# draw(PNG("zad2/plotGadfly1.png", 8inch, 5inch, dpi=400), plot(f, -1000, 1000, theme))
draw(PNG("zad2/Float64.png", 8inch, 5inch, dpi=400), plot(f, 32, 37, theme))
draw(PNG("zad2/Float32.png", 8inch, 5inch, dpi=400), plot(g, 10, 20, theme))
draw(PNG("zad2/Float16.png", 8inch, 5inch, dpi=400), plot(h, 0, 10, theme))

x = symbols("x")
println("Expression's limit: $(limit(log(1+exp.(-x))*exp.(x), x => oo))")
