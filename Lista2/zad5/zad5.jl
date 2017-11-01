using PyPlot
n = 40
r = 3
A = zeros(Float32, n+1)
B = zeros(Float32, n+1)
C = zeros(Float64, n+1)

#Float32 normal 40 iterations
p = Float32(0.01)
A[1] = p
for i = 1:n
    println(p)
    p = p + r * p * (Float32(1.0) - p)
    A[i+1] = p
end
println(p)
println()

#10 iterations with floor
p = Float32(0.01)
for i = 1:4
  for j = 1:10
    println(p)
    B[10*(i-1) + j] = p
    p = p + r * p * (Float32(1.0) - p)
  end
  p = floor(p,3)
end
B[n+1] = p;
println(p)
println()

#Float64 normal iterations
p = Float64(0.01)
C[1] = p
for i = 1:n
    println(p)
    p = p + r * p * (Float64(1.0) - p)
    C[i+1] = p
end
println(p)

# plot(A)
# plot(B)
# plot(C)
