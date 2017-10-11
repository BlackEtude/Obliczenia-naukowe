#Agata Jasionowka - 229726

#=
Przybliżoną wartość pochodnej f(x) w punkcie x można obliczyć za pomocą
następującego wzoru f′. Skorzystać z tego wzoru do obliczenia w języku
Julia w arytmetyce Float64 przybliżonej wartości pochodnej funkcji f(x)
w punkcie x0 = 1 oraz błędów dla h.. Jak wytłumaczyć, że od pewnego momentu
zmniejszanie wartości h nie poprawia przybliżenia wartości pochodnej?
Jak zachowują się wartości 1+h ? Obliczone przybliżenia pochodnej porównać
z dokładną wartością pochodnej, tj. zwróć uwagę na błędy.
=#

f(x) = sin(x) + cos(3 * x)
g(x) = cos(x) - 3 * sin(3 * x)

x = Float64(1.0)
n = 54

function aproxderivative(y)
    return ((f(x + y) - f(x)) / y)
end

function approximationerror(y)
    return (abs(g(x) - aproxderivative(y)))
end

println("i:\t\t\t2^h\t\t\t\t2^(h+1)")
for i = 0: 54
    y = Float64(2.0)^(-i)
    z = Float64(2.0)^(-i+1)
    println("i=$i\t$(aproxderivative(y))\t$(approximationerror(y))\t$(aproxderivative(z))\t$(approximationerror(z))")
end
