#Agata Jasionowska - 229726


#Calculate MAX value and print it with defined MAX on stdout for Float16 type
a = Float16(1.0)                    #max value
while !isinf(a * Float16(2.0))
    a *= Float16(2.0)
end
a *= (Float16(2.0) - myEps(typeof(a)))
println("Result for $(typeof(a)): $a, real: $(realmax(typeof(a)))")


#Calculate MAX value and print it with defined MAX on stdout for Float32 type
a = Float32(1.0)                    #max value
while !isinf(a * Float32(2.0))
    a *= Float32(2.0)
end
a *= (Float16(2.0) - myEps(typeof(a)))
println("Result for $(typeof(a)): $a, real: $(realmax(typeof(a))), in C: 3.402823e38")


#Calculate MAX value and print it with defined MAX on stdout for Float64 type
a = Float64(1.0)                    #max value
while !isinf(a * Float64(2.0))
    a *= Float64(2.0)
end
a *= (Float64(2.0) - myEps(typeof(a)))
println("Result for $(typeof(a)): $(prevfloat(a)), real: $(realmax(typeof(a)))")


#Function from prev exercise, returns machine epsilon for given type
function myEps(T :: Type)
    local x = T(1.0)
    local y
    while T(1.0) + x > T(1.0)
        y = x
        x /= T(2.0)
    end
    return y
end
