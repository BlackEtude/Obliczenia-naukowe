# Agata Jasionowska - 229726

#= calculate interpolation and draw plot with polynomial and function

    PARAMS
    f - function
    a - min range
    b - max range
    n - polynomial deg
=#

function rysujNnfx(f, a :: Float64, b :: Float64, n :: Int)
    x = Vector{Float64}(n + 1)      # nodes
    y = Vector{Float64}(n + 1)      # value of f(x_i)
    fx = Vector{Float64}(n + 1)     # difference quotients

    mult = 25                       #multiplier for more detailed plot
    kh = 0.0
    max = n + 1
    h = (b - a) / (max - 1)

    plot_x = Vector{Float64}(mult * (n + 1))
    plot_y = Vector{Float64}(mult * (n + 1))
    plot_h = Vector{Float64}(mult * (n + 1))

    for i = 1: max
        x[i] = a + kh
        y[i] = f(x[i])
        kh += h
    end

    fx = ilorazyRoznicowe(x, y);

    kh = 0.0
    max *= mult
    h = (b - a) / (max - 1)

    for i = 1: max
        plot_x[i] = a + kh
        plot_h[i] = warNewton(x, fx, plot_x[i])
        plot_y[i] = f(plot_x[i])
        kh += h
    end

    # draw plot
    df1 = DataFrame(x = plot_x, y = plot_y, Legend = "f(x)")
    df2 = DataFrame(x = plot_x, y = plot_h, Legend = "w(x)")
    df = vcat(df1, df2)
    Gadfly.draw(PNG("plot5$a$b$n.png", 8inch, 5inch, dpi=600), plot(df, x=:x, y=:y, color=:Legend, Geom.line,
    Geom.line, Coord.Cartesian(xmin = a, xmax = b), Theme(panel_fill = "white"),
    Scale.discrete_color_manual("red", "blue")))
end
