#Agata Jasionowska - 229726

#=
Napisz program w języku Julia realizujący następujący eksperyment
obliczania iloczynu skalarnego dwóch wektorów: x, y. Zaimplementuj
poniższe algorytmy i policz sumę na cztery sposoby dla n = 5:
(a) “w przód”
(b) “w tył”
(c) od największego do najmniejszego (dodaj dodatnie liczby w porządku
od największego do najmniejszego, dodaj ujemne liczby w porządku od
najmniejszego do największego, a następnie daj do siebie obliczone sumy
częściowe),
(d) od najmniejszego do największego (przeciwnie do metody (c)).
Użyj pojedynczej i podwójnej precyzji (typy Float32 i Float64 w języku
Julia). Porównaj wyniki z prawidłową wartością (dokładność do 15 cyfr)
− 1.00657107000000 10^(−11).
=#

#FLOAT32
a = Float32(2.718281828)
x = Float32[2.718281828,-3.141592654,1.414213562,0.5772156649,0.3010299957]
y = Float32[1486.2497,878366.9879,-22.37492,4773714.647,0.000185049]

#a
sum = Float32(0.0)
n = length(x)
for i = 1: n
      sum += x[i] * y[i]
end
println("$(typeof(sum)) 'a' result: $sum")

#b
sum = Float32(0.0)
while n > 0
      sum += x[n] * y[n]
      n -= 1;
end
println("$(typeof(sum)) 'b' result: $sum")

#c
tab = Float32[]
s1 = Float32(0.0)
s2 = Float32(0.0)
i = 1
while i <= length(x)
      push!(tab, Float32(x[i] * y[i]))
      i += 1
end

sort!(tab, rev=true)

for i in tab
      if(i > 0)
            s1 += i
      end
end

sort!(tab)

for i in tab
      if(i < 0)
            s2 += i
      end
end

sum = Float32(s1+s2)
println("$(typeof(sum)) 'c' result: $sum")

#d
s1 = Float32(0.0)
s2 = Float32(0.0)

sort!(tab)

for i in tab
      if(i > 0)
            s1 += i
      end
end

sort!(tab, rev=true)

for i in tab
      if(i < 0)
            s2 += i
      end
end

sum = Float32(s1 + s2)
println("$(typeof(sum)) 'd' result: $sum")

#FLOAT64
a = Float64(2.718281828)
x = Float64[2.718281828,-3.141592654,1.414213562,0.5772156649,0.3010299957]
y = Float64[1486.2497,878366.9879,-22.37492,4773714.647,0.000185049]

#a
sum = Float64(0.0)
n = length(x)
for i = 1: n
      sum += x[i] * y[i]
end
println("$(typeof(sum)) 'a' result: $sum")

#b
sum = Float64(0.0)
while n > 0
      sum += x[n] * y[n]
      n -= 1;
end
println("$(typeof(sum)) 'b' result: $sum")

#c
tab1 = Float64[]
s1 = Float64(0.0)
s2 = Float64(0.0)
i = 1
while i <= length(x)
      push!(tab1, Float64(x[i] * y[i]))
      i += 1
end

sort!(tab1, rev=true)

for i in tab1
      if(i > 0)
            s1 += i
      else
            break
      end
end

sort!(tab1)

for i in tab1
      if(i < 0)
            s2 += i
      else
            break
      end
end

sum = Float64(s1+s2)
println("$(typeof(sum)) 'c' result: $sum")

#d
s1 = Float64(0.0)
s2 = Float64(0.0)

sort!(tab1)

for i in tab1
      if(i > 0)
            s1 += i
      end
end

sort!(tab1, rev=true)

for i in tab1
      if(i < 0)
            s2 += i
      end
end

sum = Float64(s1 + s2)
println("$(typeof(sum)) 'd' result: $sum")
