#Agata Jasionowska - 229726

#=
a) Znajdź eksperymentalnie w arytmetyce Float64 zgodnej ze standardem IEEE 754
(double) liczbę zmiennopozycyjną x w przedziale 1 < x < 2, taką, że
x ∗ (1 /x ) 6 = 1 ; tj. fl(xfl (1 /x )) 6 = 1 (napisz program w języku
Julia znajdujący tę liczbę).
(b) Znajdź najmniejszą taką liczbę.
=#

#a
a = Float64(1.0)
b = Int32(0)

while a < Float64(2.0)
    if ((Float64(1.0) / a) * a) != Float64(1.0)
        b += 1
        println("S $b : $a")
    end
    a = nextfloat(a)
end

#TODO - calculate on PC!
