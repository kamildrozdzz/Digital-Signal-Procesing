using CairoMakie
function rozwiazanie_1(;
    fp::Float64 = 379.51,
    t1::Float64 = -1.66,
    N::Int = 774,
)
    dt=1/fp
    t=t1:dt:(t1+(N-1)*dt)
    d=(3.3.*t)
    d=(d.-3.3)
    y=react.(d,1.3,1,0)
    srednia = sum(y)/N
    energia=sum(y.^2)
    moc = energia/N
    skuteczna=sqrt(moc)
    return skuteczna  
end

function react(t,A,T,Ao)
    g=A*(sign(sin(2*pi*t/T)))+Ao; #bipolarna fala prostokątna
    #g=2*A/(pi)*asin(sin(2*pi*t/T)) #fala trójkątna
    #g = A*(2*(t./T.-floor(t./T+0.5))) #fala piłokształtna
end

rozwiazanie_1()
