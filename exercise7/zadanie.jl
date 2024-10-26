using CairoMakie
function rozwiazanie_9(;
    order::Int = 100,
    fp::Float64 = 177.0,
    f0::Float64 = 61.95,
    z::Vector{Int} = [18, 34, 73],
)
    trojkatne(M) = [1-abs(n)/(M+1) for n in -M:M]
    blackman(M) = [0.42+0.5cospi(2*n/(2M+1))+0.08*cospi(4*n/(2M+1)) for n in -M:M]
    hanninga(M) = [0.5+0.5*cos(2*pi*n/(2*M+1)) for n in -M:M]
    hamminga(M) = [0.54+0.46*cos(2*pi*n/(2*M+1)) for n in -M:M]
    n = -order/2:order/2
    #F1 = f1/fp
    #F2 = f2/fp
    F0 = f0/fp
    h = zeros(Float64,length(n))
    for i in 1:length(n)
        #h[i] = 2*F2*sinc(2*F2*n[i]) - 2*F1*sinc(2*F1*n[i]) #pasmowoprzepustowy
        #h[i] = 2*F0*sinc(2*F0*n[i]) #dolnoprzepustowy
        #if n[i]==0
        #    h[i]=1-2*F0
        #end
        h[i] = 0 - 2*F0*sinc(2*F0*n[i]) #górnoprzepustowy
        if n[i]==0
            h[i]=1-2*F0
        end
        #h[i] = 0 - (2*F2*sinc(2*F2*n[i]) - 2*F1*sinc(2*F1*n[i])) #pasmowozaporowe
    end

    w = hamminga(order/2)
    hw = h.*w
    out = 0

    for i in z
        out += hw[i]
    end
    return out
end

rozwiazanie_9()