function [detectedSymbol] = ssvep_tryCCA(data, flickerFreq, symbolDuration, samplingFrequency,...
          ccaOrder, onlineAnalysisChannel, delay, onlineAnalysisResampleRate)
  
  [row, column] = butter(4, [5 50]/(0.5*samplingFrequency));
	degree1st = filter(row, column, data);
	degree2nd = resample(degree1st, onlineAnalysisResampleRate, samplingFrequency); 
  resampleFilter = degree2nd(delay + 1 : delay + symbolDuration * onlineAnalysisResampleRate, onlineAnalysisChannel);
  
  [matrix, sinusoidal] = ssvep_createCCAmatrixAndSinusoidal(onlineAnalysisResampleRate,...
                                symbolDuration, flickerFreq, ccaOrder)
                              
  [unused, weightCCA] = ssvep_checkCCA(resampleFilter, sinusoidal);
  unknown = sqrt(weightCCA.^(2*matrix));
  [~, detectedSymbol] = max(unknown);
  
end