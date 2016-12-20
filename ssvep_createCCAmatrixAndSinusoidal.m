function [matrix, sinusoidal] = ssvep_createCCAmatrixAndSinusoidal(onlineAnalysisResampleRate,...
                                symbolDuration, flickerFreq, ccaOrder)
 
  % build specific constant
  horder = 2*ccaOrder;
  row = numfreq*horder;
  frameLength = onlineAnalysisResampleRate * symbolDuration;
  numFreq = length(flickerFreq);
  
  % build cca matrix
  matrix = zeros(row, numFreq); 
  for i = 1:2*ccaOrder
    matrix(i:horder, :) = eye(numFreq);
  end
  
  % build cca sinusoidal
  t = (1:frameLength)'/onlineAnalysisResampleRate*2*pi;
  sinusoidal = zeros(frameLength, numFreq*horder);
  for ii = 1:numFreq
	  for jj = 1:ccaOrder
		  sinusoidal(:, 2*(ii-1)* ccaOrder+2*jj-1) = sin(flickerFreq(ii)*jj*t);
		  sinusoidal(:, 2*(ii-1)* ccaOrder+2*jj) = cos(flickerFreq(ii)*jj*t);
    end
  end

end