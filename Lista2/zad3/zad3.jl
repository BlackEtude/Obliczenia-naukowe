include("hilb.jl")
include("matcond.jl")

function printMatrix(A, n)
    for i = 1:n
        for j = 1:n
            @printf("%.15f ", A[i,j])
        end
        println()
    end
end

function printVector(V, n)
    for i = 1:n
        println(abs(V[i] - 1))
    end
    println()
end

println("\n HILBERT MATRIX \n")
result1 = Float64(0.0)
result2 = Float64(0.0)
for n = 1:20
    A = hilb(n)
    x = ones(n)
    b = A * x

    result1 = A\b
    result2 = inv(A) * b
    # println(rank(A))
    # println(cond(A))
    print("n = ", n, " \n")
    println(norm(x - result1)/norm(x));
    println(norm(x - result2)/norm(x));
    # println();
    # printVector(x, n)
end
