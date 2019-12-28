function x = Dirac(n,N)
    if n>(N-1)
        disp('n is greater than N!')
        x=0;
    else
        array=zeros(1,N);
        array(n)=1;
        x=array;
    end
end