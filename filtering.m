function [filteredData] = filtering(data, frequency, sampleRate)
		%filterOrder = 120
		w = frequency / (0.5 * sampleRate);
		%B = fir1(filterOrder, w)
		%filteredData = filter(B, 1, data);
	
		filterOrder = 3;
		 [B, A] = butter(filterOrder, w);
		 filteredData = filtfilt(B, A, data);
		 %filteredData = filter(B, A, data);
		% figure(1)
		%freqz(B,A);
		 %filterdDataSize=size(filteredData)
end