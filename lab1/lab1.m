pkg load communications
binary_data = randi([0 1] , 1 , 1e6);
BER = [];
SNR = 0:2:31;
for i = SNR 
    %Add some noise to generated bits
     Rx = awgn(binary_data,i,'measured');
    %(bit < 0.5 ? 0 : 1)
 	result = Rx >= 0.5;
	% Getting err ratio
        %Compute number of bit errors and bit error rate (BER)
	[err,err_ratio] = biterr(binary_data,result);
    BER = [BER err_ratio];
end
semilogy(SNR,BER,'mo-')
title('Error');
xlabel('SNR');
ylabel('BER');