#Agata Jasionowska - 229726

#=
Kahan stwierdził, że epsilon maszynowy (macheps) można otrzymać obliczając
wyrażenie 3(4 / 3 − 1) − 1 w arytmetyce zmiennopozycyjnej. Sprawdzić
eksperymentalnie w języku Julia słuszność tego stwierdzenia dla wszystkich
typów zmiennopozycyjnych Float16, Float32, Float64.
=#

#Float16
a = Float16(3) * ((Float16(4) / Float16(3)) - Float16(1)) - Float16(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")

#Float32
a = Float32(3) * ((Float32(4) / Float32(3)) - Float32(1)) - Float32(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")

#Float64
a = Float64(3) * ((Float64(4) / Float64(3)) - Float64(1)) - Float64(1)
println("Result for $(typeof(a)):\nKahan's: $a, real: $(eps(typeof(a)))\n")
