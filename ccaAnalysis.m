function [detectedSymbols]=ccaAnalysis(data, flickerFreqs, analysisPeriod, samplingFrequency, ccaOrder, analysisChannel,...
  delay,resamplingFrequency) % ... ... [.5:8] 1200 2 [2 5:7] 120 240

	% filtering and resample
	[B,A] = butter(4,[5 50]/(0.5*samplingFrequency)); % 1.0e-03 * [9,9]
	temp = filter(B,A,data); % follow data
	temp2 = resample(temp,resamplingFrequency,samplingFrequency); % 2
    %analysisPeriod=2;
    
    %frames=temp2(delay+1:delay+analysisLength*resamplingFrequency/samplingFrequency,2:length(buffer(1,:)));
  
    %mat = delay + analysisPeriod * resamplingFrequency
    frames=temp2(delay + 1 : delay + analysisPeriod * resamplingFrequency, analysisChannel); % only signal from channel
    y = makeSinusoidForCCA(resamplingFrequency, analysisPeriod * resamplingFrequency, flickerFreqs, ccaOrder);
    % (sampleRate, frameLength, freq, order)
    E = makeCCA2Matrix(length(flickerFreqs),ccaOrder); % (numOfFreqs,order)
    % line 14 15 call fanction to build
    [r ccaWeight]=CCA2(frames, y);
    w=sqrt(ccaWeight.^2*E);
    [~, detectedSymbols] = max(w);
	
	
	
    
end