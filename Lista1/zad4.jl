#Agata Jasionowska - 229726

#Find min value x, 1<x<2, x*(1/2x) != 1
a = Float64(1.0)                   #current value

while a < Float64(2.0)
    if ((Float64(1.0) / a) * a) != Float64(1.0)
        println("$a")
    end
    a = nextfloat(a)
end
