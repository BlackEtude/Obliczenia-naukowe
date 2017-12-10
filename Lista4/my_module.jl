# Agata Jasionowska - 229726

module my_module

export ilorazyRoznicowe
export warNewton
export naturalna
export rysujNnfx

using Cairo
using Fontconfig
using Gadfly
using DataFrames

#= calculate difference quotients
    PARAMS:
    x - vector of nodes
    f - vector of values of function f

    RETURN:
    fx - vector of computed difference quotients
=#
function ilorazyRoznicowe(x :: Vector{Float64}, f :: Vector{Float64})
    m = length(f)
    fx = Vector{Float64}(m)

    for i = 1: m
        fx[i] = f[i]
    end

    # calculate difference quotients
    for i = 2: m
		for j = m: -1: i
			fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
		end
	end

    return fx
end

#= calculate polynomial value with Newton form using Horner algorithm
    PARAMS:
    x - vector with nodes
    fx - vector of difference quotients
    t - polynomial point where we calc value

    RETURN:
    nt - polynomial value in t
=#
function warNewton(x :: Vector{Float64}, fx :: Vector{Float64}, t :: Float64)
    m = length(fx)
    nt = fx[m]

	for i = m - 1: -1: 1
		nt = fx[i] + (t - x[i]) * nt
	end

    return nt
end

#= calculate coefficients of interpolating polynomial (natural form)
    PARAMS:
    x - vector of nodes
    fx - vector of difference quotients

    RETURN:
    a - vector with coefficients
=#
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    m = length(fx)
    a = Vector{Float64}(m)
    a[m] = fx[m]

    for i = m-1: -1: 1
        p = a[i+1] * x[i]
        a[i] = fx[i] - p
        for k = i+1 : m-1
            p = a[k+1] * x[i]
            a[k] = a[k] - p
        end
    end

    return a
end

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
end
