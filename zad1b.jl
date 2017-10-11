#Agata Jasionowska - 229726

#=
Napisać program w języku Julia wyznaczający iteracyjnie liczbę
eta taką, że eta > 0 . 0 dla wszystkich typów zmiennopozycyjnych
Float16, Float32, Float64 , zgodnych ze standar- dem IEEE 754 (
half, single, double ), i porównać z wartościami zwracanymi przez
funkcje: nextfloat(Float16(0.0)) , nextfloat(Float32(0.0)),
nextfloat(Float64(0.0))
=#

println("ETA")

#Float16
a = Float16(1.0)
b = Float16(2.0)
while (a/b > Float16(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float16(0.0)))")

#Float32
a = Float32(1.0)
b = Float32(2.0)
while (a/b > Float32(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float32(0.0)))")

#Float64
a = Float64(1.0)
b = Float32(2.0)
while (a/b > Float64(0.0))
    a /= b
end
println("Result for $(typeof(a)): $a, real: $(nextfloat(Float64(0.0)))")

#=
TODO - Jaki związek ma liczba eta z liczbą MIN sub
(zob. wykład lub raport [ 2 ])?
=#
