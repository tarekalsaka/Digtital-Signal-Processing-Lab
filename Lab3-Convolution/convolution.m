% Lw 3

function convolution()


    % ex 2, Q1
    convN([1 2 3 4], [1 1 1 1], 1, '0pad')
    convN([1 2 3 4], [1 1 1 1], 1, 'sym')
    convN([1 2 3 4], [1 1 1 1], 1, 'vpad')
    
    %convN([3 2 1 0 9], [1 1 1], 1, 'sym')
    convN([1 2 3 4], [1 1 1]/3, 3, 'sym')
%     % Q2
%     x=convN([3 2 1 0 9],[1 1], 1, 'vsym')
%     convN(x,[1 -1], 1, 'vsym')
%     % Q3
%     convN([3 2 1 0 9],[1 0 -1], 1, 'vsym')
%     % Q4
    x=convN([0 0 0 1 0 0 0 ],[1 -1], 1, 'vsym') % impulse signal
    convN(x,[1 -1], 1, 'vsym') % impulse response -> equivalent filter


end % function convolution
















