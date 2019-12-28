function x = Ramp(a,n,N)
    if n>(N-1) || n<1
        disp('n is out of range!')
        x=0;
    else
        array=zeros(1,N);
        for i=n:N
            array(i)=a*(i-n);
        end
        x=array;
    end
end