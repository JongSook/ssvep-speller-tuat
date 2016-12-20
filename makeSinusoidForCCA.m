function y = makeSinusoidForCCA(sampleRate, frameLength, freq,order) 
% (resamplingFrequency, analysisPeriod * resamplingFrequency, flickerFreqs, ccaOrder)
% 240 [.5:8]*240 6of[8 9.2 10.9 12 13.3 15 17.1 20] 2

t = (1:frameLength)'/sampleRate*2*pi; % [.5:8]*240,1

y = zeros(frameLength, length(freq)*2*order); % [.5:8]*240,24
for ii = 1:length(freq) % 1:6
	for jj=1:order % 1:2
		y(:,2*(ii-1)* order+2*jj-1 ) = sin(freq(ii)*jj*t);
		y(:, 2*(ii-1)* order+2*jj) = cos(freq(ii)*jj*t);

	end

end
end