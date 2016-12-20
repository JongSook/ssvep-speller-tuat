function [flickerTimingMatrix] = setFlickerTimingMatrix(experimentMode, numOfFlicker, refreshRate, flickerFrequency, symbolDuration)
	
  % Name of flags
  includeFlagParameter
  
  
  
  %params


	switch experimentMode
	 	case freqMode
      allFlickerNumber = round(refreshRate*symbolDuration);
			flickerTimingMatrix = zeros(allFlickerNumber, numOfFlicker);
	 		
	 		
	 	 %% duty 1:1
      
     
	 		for ii = 1:numOfFlicker
	 			oneFlickerLength =  round(refreshRate / flickerFrequency(1,ii));
	 			blockNumber = ceil(flickerFrequency(1,ii) * symbolDuration / 2);
	 			% make flickerTimingMatrix
	 			temp = zeros(2 * oneFlickerLength, 1);
	 			temp(oneFlickerLength + 1: 2 * oneFlickerLength, 1) = 1;
	 			temp = repmat(temp, blockNumber ,1); 
	 			flickerTimingMatrix(:, ii) = temp(1:allFlickerNumber ,1);
	 		end
	 		
	 		
	 	
	 	case backGroundMode
	 		allFlickerNumber = round(refreshRate*symbolDuration);
			flickerTimingMatrix = zeros(allFlickerNumber, numOfFlicker);
	 		 	
	 	otherwise
        	warning('Unexpected experiment mode.');
	end

end