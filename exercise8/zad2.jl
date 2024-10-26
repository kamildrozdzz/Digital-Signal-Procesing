using CairoMakie
function rozwiazanie(;
    b::Vector{Float64} = [0.3737111588959988, -4.304859245960847, 22.90418356820279, -74.4151991288783, 164.41104513671885, -260.20643864172416, 302.4751144044225, -260.20643864172416, 164.41104513671883, -74.41519912887831, 22.904183568202793, -4.304859245960849, 0.3737111588959989],
    a::Vector{Float64} = [1.0, -11.291766029627695, 59.07141166863114, -189.34827683730566, 414.2500402104261, -651.7141015993209, 756.0653851899248, -651.7141015993209, 414.25004021042605, -189.34827683730566, 59.071411668631136, -11.291766029627691, 1.0],
)
    x = zeros(Float64, 10000)
    x[1]=1
    n=length(x)
    m=length(b)
    k=length(a)
    y=zeros(Float64, n)
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

    energia_1 = sum(y[1:Int(n/2)].^2)
    energia_2 = sum(y[Int(n/2):n].^2)
    stosunek=energia_1/energia_2

    if round(stosunek, digits=2)==1.0
        return 0
    elseif energia_1<energia_2
        return -1
    elseif energia_1>energia_2
        return 1
    end
end
rozwiazanie()