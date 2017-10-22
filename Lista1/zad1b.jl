#Agata Jasionowska - 229726

#Calculate ETA and print it with defined ETA on stdout for Float16 type
a = Float16(1.0)                    #eta
b = Float16(2.0)                    #value of 2.0 in Float16
while (a/b > Float16(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float16(0.0)))")

#Calculate ETA and print it with defined ETA on stdout for Float32 type
a = Float32(1.0)                    #eta
b = Float32(2.0)                    #value of 2.0 in Float32
while (a/b > Float32(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float32(0.0)))")
println("Bits: $(bits(a))")

#Calculate ETA and print it with defined ETA on stdout for Float64 type
a = Float64(1.0)                    #eta
b = Float64(2.0)                    #value of 2.0 in Float64
while (a/b > Float64(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float64(0.0)))")
