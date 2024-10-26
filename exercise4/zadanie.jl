using CairoMakie
b = [0.059949806264792856, 0.17984941879437857, 0.17984941879437857, 0.059949806264792856]
a = [1.0, -1.1611269026881592, 0.9618362953663817, -0.3211109425598799]
x = [0.81, -0.69, 0.73, 0.42, -0.61, -0.02, 0.83, 0.23, -0.16, 0.03, 0.7, 0.27, -0.83, 0.13, -0.3, 0.83, 0.08, -0.55, 1.0, -0.95, 0.33, -0.2, 0.56, 0.18, -0.28, 0.78, 0.38, -0.39, -0.21]
append!(x,zeros(L-length(x)))
L = 54
n = length(x)
m = length(b)
k = length(a)

y = zeros(n)

for i in 1:n
    global B = 0.0
    global A = 0.0
    
    for j in 0:(m-1)
        if i-j > 0
            global B += b[j+1] * x[i-j]
        end
    end
    
    for j in 1:(k-1)
        if i-j > 0
            global A += a[j+1] * y[i-j]
        end
    end
    
    y[i] =  B - A
end
y=y[1:L]

rms_y = sqrt(sum(y .^ 2) / L)
println(rms_y)
lines(1:L,y)
