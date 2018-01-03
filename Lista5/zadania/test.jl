#Agata Jasionowska - 229726

include("matrixgen.jl")
include("blocksys.jl")
using matrixgen
using blocksys

function test()
    memory = 0
    a = 0
    i = 4
    while i < 50000
        time = 0
        j = 0;
        while j < 50
            blockmat(i, 4, 1.0, "test")
            (A, n, l) = readMatrixFromFile("test")
            b = computeRightSideVector(A, n, l)
            a = @timed lu(A, n, l, b)
            time += a[2]
            j += 1
        end
        println(i, ";", time/50, ";", a[3])
        i += 160;
    end
end

function lu(A, n, l, b)
    p = matrixToLUPivots(A, n, l)
    solveLUPivots(A, b, n, l, p)
end

# println("n;time;memory")
# test()
(A, n, l) = readMatrixFromFile("Dane50000_1_1/A.txt")
b = readVectorFromFile("Dane50000_1_1/b.txt")
p = matrixToLUPivots(A, n, l)
c = solveLUPivots(A, b, n, l, p)
println(c)

# p = matrixToLUPivots(A, n, l)
# println(solveLUPivots(A, b, n, l, p))

# matrixToLU(A, n, l)
# println(solveLU(A, b, n, l))
