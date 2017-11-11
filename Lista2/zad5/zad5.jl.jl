#Agata Jasionowska - 229726

using Cairo
using Fontconfig
using Gadfly
using DataFrames

#Float32/Float64 normal 40 iterations
function iterations{T}(t :: T, n, r)
    A = zeros(t, n+1)
    p = t(0.01)
    A[1] = p
    for i = 1:n
        p = p + r * p * (t(1.0) - p)
        A[i+1] = p
    end
    return A
end

#40 iterations with floor after 10th one
function iterations2{T}(t :: T, n, r)
    B = zeros(t, n+1)
    p = t(0.01)
    for i = 1:4
      for j = 1:10
        B[10*(i-1) + j] = p
        p = p + r * p * (t(1.0) - p)
      end
      p = floor(p,3)
    end
    B[n+1] = p;
    return B
end

#draw plot from two vectors with labels
function drawPlot(n, A, B, label1, label2)
    df1 = DataFrame(x = 1:41, y = A, Legend = label1)
    df2 = DataFrame(x = 1:41, y = B, Legend = label2)
    df = vcat(df1, df2)

    Gadfly.draw(PNG("zad5/plot$n.png", 8inch, 5inch, dpi=600), plot(df, x=:x, y=:y, color=:Legend, Geom.line,
    Guide.xlabel("Iteration"), Geom.line, Coord.Cartesian(xmin = 0, xmax = 42, ymin = 0),
    Theme(panel_fill = "white"), Scale.discrete_color_manual("red", "blue")))
end

# MAIN
n = 40
r = 3
X = Array{Float32}(n+1)
Y = Array{Float64}(n+1)
Z = Array{Float32}(n+1)

X = iterations(Float32, n, r)
# println(X, "\n")
Y = iterations(Float64, n, r)
# println(Y, "\n")
Z = iterations2(Float32, n, r)
# println(X, "\n")

drawPlot(1, X, Y, "Float32", "Float64")
drawPlot(2, X, Z, "Float32", "Float32 obcięcie")
