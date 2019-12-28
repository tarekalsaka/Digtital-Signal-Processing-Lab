function x = Step(n,N)
    if n>(N-1) || n<1
        disp('n is out of range!')
        x=0;
    else
        array=zeros(1,N);
        array(n:N)=1;
        x=array;
    end
end