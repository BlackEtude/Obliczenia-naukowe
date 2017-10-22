#Agata Jasionowska - 229726

#Calculate machine epsilone and print it with defined eps on stdout for Float16 type
a = Float16(1.0)                    #machine epsilon
b = Float16(1.0)                    #keep prev value

while Float16(1.0) + a > Float16(1.0)
    b = a
    a /= Float16(2.0)
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b)))")


#Calculate machine epsilone and print it with defined eps on stdout for Float32 type
#Check value of (1.0+macheps)
a = Float32(1.0)                    #machine epsilon
b = Float32(1.0)                    #keep prev value

while Float32(1.0) + a > Float32(1.0)
    b = a
    a /= Float32(2.0)
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b))), in C: 1.19209289550781e-07")
println("Check: $(bits(Float32(1.0) + b))")


#Calculate machine epsilone and print it with defined eps on stdout for Float64 type
a = Float64(1.0)                    #machine epsilon
b = Float64(1.0)                    #keep prev value

while Float64(1.0) + a > Float64(1.0)
    b = a
    a /= Float64(2.0)
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b))), in C: 2.220446049250313080847263336181640625e-16")
