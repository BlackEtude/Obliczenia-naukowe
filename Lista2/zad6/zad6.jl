#Agata Jasionowska - 229726

using Cairo
using Fontconfig
using Gadfly

n = 40

theme = Theme(
    panel_fill = "white",
    default_color = "red"
)

#Calculate expression x_(x+1) = x_n + c and draw with 'j' label
function calculateExpression(j, x, c)
    A = zeros(n)
    oldVal = x
    for i = 1:n
        newVal = oldVal^(2.0) + c
        oldVal = newVal
        A[i] = oldVal
    end
    printVector(A)
    drawPlot(j, A)
end

#Draw plot from vector with 'i' label
function drawPlot(i, A)
    X = A * diagm(40:40)
    Gadfly.draw(PNG("zad6/plot$i.png", 8inch, 5inch, dpi=700), Gadfly.plot(X, x = Row.index, y = Col.value, Geom.line,
    Geom.point, Theme(panel_fill = "white", default_color = "blue")))
end

#Print vector
function printVector(A)
  for i = 1:n
      println(A[i])
  end
end

println("X[0] = 1 C = -2")
calculateExpression(1, 1.0, -2.0)

println("\nX[0] = 2 C = -2")
calculateExpression(2, 2.0, -2.0)

println("\nX[0] = 1.99999999999999 C = -2")
calculateExpression(3, 1.99999999999999, -2.0)

println("\nX[0] = 1 C = -1")
calculateExpression(4, 1.0, -1.0)

println("\nX[0] = -1 C = -1")
calculateExpression(5, -1.0, -1.0)

println("\nX[0] = 0.75 C = -1")
calculateExpression(6, 0.75, -1.0)

println("\nX[0] = 0.25 C = -1")
calculateExpression(7, 0.25, -1.0)
