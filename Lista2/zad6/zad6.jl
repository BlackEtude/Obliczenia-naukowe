function calculatecalculateExpression(x, c, n)
    oldVal = x
    for i = 1:n
        newVal = oldVal^(2.0) + c
        oldVal = newVal
    end
    return oldVal
end

n = 40

println("X[0] = 1 C = -2")
println("X[",n,"] = ", calculateExpression(1.0, -2.0, n))
println("\nX[0] = 2 C = -2")
println("X[",n,"] = ", calculateExpression(2.0,-2.0,n))
println("\nX[0] = 1.99999999999999 C = -2")
println("X[",n,"] = ", calculateExpression(1.99999999999999,-2.0,n))
println("\nX[0] = 1 C = -1")
println("X[",n,"] = ", calculateExpression(1.0,-1.0,n))
println("\nX[0] = -1 C = -1")
println("X[",n,"] = ", calculateExpression(-1.0,-1.0,n))
println("\nX[0] = 0.75 C = -1")
println("X[",n,"] = ", calculateExpression(0.75,-1.0,n))
println("\nX[0] = 0.25 C = -1")
println("X[",n,"] = ", calculateExpression(0.25,-1.0,n))
