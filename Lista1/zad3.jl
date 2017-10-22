#Agata Jasionowska - 229726

steps = 3

#Calculate 1+k*delta in [1,2] and print result with bits on stdout
println("[1,2]")
a = Float64(1.0)                    #first value in range
delta = Float64(2.0)^(-52)          #delta value
i = 0
while i <= steps
    println("$a + $i * delta\t\t$(bits(a+i*delta))")
    i += 1
end
println("")

i = 0
a = Float64(2.0)                    #last value in range
while i <= steps
    println("$a - $i * delta\t\t$(bits(a-i*delta))")
    i += 1
end
println("\n\n")

#Calculate 1+k*delta in [0.5,1] and print result with bits on stdout
println("\n[0.5,1]")
delta = Float64(2.0)^(-53)          #delta value
a = Float64(0.5)                    #first value in range
i = 0
while i <= steps
    println("$a + $i * delta\t\t$(bits(a+i*delta))")
    i += 1
end
println("")

i = 0
a = Float64(1.0)                    #last value in range
while i <= steps
    println("$a - $i * delta\t\t$(bits(a-i*delta))")
    i += 1
end

println("\n\n")

#Calculate 1+k*delta in [2,4] and print result with bits on stdout
println("\n[2,4]")
delta = Float64(2.0)^(-51)          #delta value
a = Float64(2.0)                    #first value in range
i = 0
while i <= steps
    println("$a + $i * delta\t\t$(bits(a+i*delta))")
    i += 1
end

println("")

i = 0
a = Float64(4.0)                    #last value in range
while i <= steps
    println("$a - $i * delta\t\t$(bits(a-i*delta))")
    i += 1
end
