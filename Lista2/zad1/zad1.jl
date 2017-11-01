#Agata Jasionowska - 229726

#Scalar mult for vector x and y (FLOAT32)
#Vectors
x = Float32[2.718281828,-3.141592654,1.414213562,0.577215664,0.301029995]
y = Float32[1486.2497,878366.9879,-22.37492,4773714.647,0.000185049]

#a algorithm
sum = Float32(0.0)
n = length(x)
for i = 1: n
      sum += x[i] * y[i]
end
println("$(typeof(sum)) 'a' result: $sum")

#b algorithm
sum = Float32(0.0)
while n > 0
      sum += x[n] * y[n]
      n -= 1;
end
println("$(typeof(sum)) 'b' result: $sum")

#c algorithm
tab = Float32[]                           #table for
s1 = Float32(0.0)
s2 = Float32(0.0)
i = 1
while i <= length(x)                      #add x[i]*y[i] to table
      push!(tab, Float32(x[i] * y[i]))
      i += 1
end

sort!(tab, rev=true)                      #rev sort table

for i in tab                              #add >0 elements
      if(i > 0)
            s1 += i
      end
end

sort!(tab)                                #sort table

for i in tab                              #add <0 elements
      if(i < 0)
            s2 += i
      end
end

sum = Float32(s1+s2)
println("$(typeof(sum)) 'c' result: $sum")

#d
s1 = Float32(0.0)
s2 = Float32(0.0)

sort!(tab)                                #sort table

for i in tab
      if(i > 0)                           #add >0 elements
            s1 += i
      end
end

sort!(tab, rev=true)                      #rev sort table

for i in tab
      if(i < 0)                           #add <0 eleme
            s2 += i
      end
end

sum = Float32(s1 + s2)
println("$(typeof(sum)) 'd' result: $sum")


#Scalar mult for vector x and y (FLOAT64)
a = Float64(2.718281828)
x = Float64[2.718281828,-3.141592654,1.414213562,0.577215664,0.301029995]
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
