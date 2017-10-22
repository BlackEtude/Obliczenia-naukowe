#Agata Jasionowska - 229726

#Calculate macheps by Kahan and print it on stdout for Float16 type
a = Float16(3) * ((Float16(4) / Float16(3)) - Float16(1)) - Float16(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")

#Calculate macheps by Kahan and print it on stdout for Float32 type
a = Float32(3) * ((Float32(4) / Float32(3)) - Float32(1)) - Float32(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")

#Calculate macheps by Kahan and print it on stdout for Float64 type
a = Float64(3) * ((Float64(4) / Float64(3)) - Float64(1)) - Float64(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")
