#Agata Jasionowska - 229726

#=
Epsilonem maszynowym macheps (ang. machine epsilon) nazywamy najmniejszą
liczbę macheps > 0 taką, że 1 . 0 ⊕ macheps > 1 . 0 . Napisać program w
języku Julia wyznaczający iteracyjnie epsilony maszynowe dla wszystkich
dostępnych typów zmiennopozycyjnych Float16, Float32, Float64, zgodnych
ze standardem IEEE 754 ( half, single, double), i porównać z wartościami
zwracanymi przez funkcje: eps(Float16) , eps(Float32), eps(Float64) oraz
=#

println("Macheps")

#Float16
a = Float16(1.0)
b = Float16(1.0)

while Float16(1.0) + a > Float16(1.0)
    b = a
    a /= Float16(2.0)
    println("b:$b\ta:$b")
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b))), in C: 1E-5")

#Float32
a = Float32(1.0)
b = Float32(1.0)

while Float32(1.0) + a > Float32(1.0)
    b = a
    a /= Float32(2.0)
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b))), in C: 1E-9")

#Float64
a = Float64(1.0)
b = Float64(1.0)

while Float64(1.0) + a > Float64(1.0)
    b = a
    a /= Float64(2.0)
end
println("Result for $(typeof(b)): $b, eps = $(eps(typeof(b))), in C: 1E-9")

#=
TODO związek macheps z precyzją arytmetyki
in c: 1.192093e-07
=#
