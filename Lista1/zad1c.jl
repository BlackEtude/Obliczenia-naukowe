#Agata Jasionowska

#=
Napisać program w języku Julia wyznaczający iteracyjnie liczbę
(MAX) dla wszystkich typów zmiennopozycyjnych Float16, Float32,
Float64, zgodnych ze standardem IEEE 754 (half, single, double),
i porównać z wartościami zwracanymi przez funkcje: realmax(Float16),
realmax(Float32), realmax(Float64) oraz z danymi zawartymi w pliku
nagłówkowym float.h dowolnej instalacji języka C lub z danymi z
wykładu lub zob. raport[2].
=#

println("MAX:")

#Float16
a = Float16(1.0)
while !isinf(a * Float16(2.0))
    a *= Float16(2.0)
end
a *= (Float16(2.0) - eps(typeof(a)))
println("Result for $(typeof(a)): $a, real: $(realmax(typeof(a)))")

#Float32
a = Float32(1.0)
while !isinf(a * Float32(2.0))
    a *= Float32(2.0)
end
a *= (Float16(2.0) - eps(typeof(a)))
println("Result for $(typeof(a)): $a, real: $(realmax(typeof(a))), in C: 3.402823e+38")

#Float64
a = Float64(1.0)
while !isinf(a * Float64(2.0))
    a *= Float64(2.0)
end
a *= (Float64(2.0) - eps(typeof(a)))
println("Result for $(typeof(a)): $(prevfloat(a)), real: $(realmax(typeof(a)))")
