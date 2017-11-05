include("hilb.jl")
include("matcond.jl")

n = [5, 10, 20]
c = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]

# hilbert matrix
println("Hilbert matrix:\n")
for i = 1:20
    hilbertMatrix = hilb(i)
    x = ones(Float64, i);
    b = hilbertMatrix * x

    result1 = hilbertMatrix \ b
    result2 = inv(hilbertMatrix) * b

    println("Size $i x $i \t cond: $(cond(hilbertMatrix))")
    println("Error for A \\ b: $(norm(result1 - x) / norm(x))")
    println("Error for inv(A)*b: $(norm(result2 - x) / norm(x))")
    println()
end

# random matrix
println("\n\nRandom Matrix\n")
for i = 1:length(n)
    for j = 1:length(c)
        x = ones(Float64, n[i]);
        matrix_random = matcond(n[i], c[j])
        b = matrix_random * x

        result1 = matrix_random \ b
        result2 = inv(matrix_random) * b

        println("Dim: $(n[i]) x $(n[i]) \t cond: $(cond(matrix_random))")
        println("Error for A \\ b: $(norm(result1 - x) / norm(x))")
        println("Error for  inv(A)*b: $(norm(result2 - x) / norm(x))")
        println()
    end
end
