#Agata Jasionowska - 229726

#=
Sprawdź eksperymentalnie w języku Julia, że w arytmetyce Float64 (arytmetyce
double w standarcie IEEE 754) liczby zmiennopozycyjne są równomiernie rozmieszczone
w [1,2] z krokiem δ = 2^(− 52). Innymi słowy, każda liczba zmiennopozycyjna x
pomiędzy 1 i 2 może być przedstawione następująco x = 1 + kδ w tej arytmetyce,
gdzie k = 1, 2 , . . . , (2^52 − 1) i δ = 2^(− 52). Jak rozmieszczone są liczby
zmiennopozycyjne w przedziale [1/2, 1], jak w przedziale [2, 4] i jak mogą być
przedstawione dla rozpatrywanego przedziału? Wsk. Skorzystać z funkcji bits
=#

delta = Float64(2.0)^(-52)
steps = 3

#[1,2]
a = Float64(1.0)
println("[1,2]")
i = 0
while i <= steps
    println("a + $i * delta\t$a\t$(bits(a+i*delta))")
    i += 1
end

println("")

i = 0
a = Float64(2.0)
while i <= steps
    println("a - $i * delta\t$a\t$(bits(a-i*delta))")
    i += 1
end

println("\n\n")

#[1/2,1]
delta = Float64(2.0)^(-53)
a = Float64(0.5)
println("\n[0.5,1]")
i = 0
while i <= steps
    println("a + $i * delta\t$a\t$(bits(a+i*delta))")
    i += 1
end

println("")

i = 0
a = Float64(1.0)
while i <= steps
    println("a - $i * delta\t$a\t$(bits(a-i*delta))")
    i += 1
end

println("\n\n")

#[2,4]
delta = Float64(2.0)^(-51)
a = Float64(2.0)
println("\n[2,4]")
i = 0
while i <= steps
    println("a + $i * delta\t$a\t$(bits(a+i*delta))")
    i += 1
end

println("")

i = 0
a = Float64(4.0)
while i <= steps
    println("a - $i * delta\t$a\t$(bits(a-i*delta))")
    i += 1
end
