function [numFlicker, flickerFreq, flickerMatrix, startMatrix] = ssvep_setStimBG2(experimentMode, ...
  refreshRate, symbolDuration, startFreq, prepareTime)
% setStimBG version having flickerFreq check 
  
  % Parameter
  ssvep_setScreen
  
  % Constant
  ssvep_setConstant
  
  % background and ficker frequency
  switch experimentMode
    case freqMode
      portal = 0;
      numFlicker = 6;
      flickerFreq = zeros(1, numFlicker);
      check = zeros(1, numFlicker);
      for sequence = 1: numFlicker
        portal = sequence;
        flickerFreq(1, sequence) = ssvep_checkInput(['Input' num2str(sequence) 'th flicker Frequency.'], allFlickerFreq(1, :)); 
        while portal >= 2 
          if check(1, 1) == flickerFreq(1, sequence) || check(1, 2) == flickerFreq(1, sequence) || check(1, 3) == flickerFreq(1, sequence) ...
             || check(1, 4) == flickerFreq(1, sequence) || check(1, 5) == flickerFreq(1, sequence) || check(1, 6) == flickerFreq(1, sequence)
            flickerFreq(1, sequence) = ssvep_checkInput(['Input' num2str(sequence) 'th flicker Frequency.'], allFlickerFreq(1, :));              
          else
            portal = 0;
          end 
        end
        check(1, sequence) = flickerFreq(1, sequence);
      end
      
    case backgroundMode
      numFlicker = 1;
      flickerFreq = 0;
      
    otherwise
      warning('Unexpected experiment mode. No experiment mode.');
  end
  
  % stimulation and ficker matrix
  if experimentMode == freqMode
    switch experimentMode
      case freqMode
        allFlickerNum = round(refreshRate*symbolDuration);
        startFlickerNum = round(refreshRate*prepareTime);
        flickerMatrix = zeros(allFlickerNum, numFlicker);
        startMatrix = zeros(startFlickerNum, 1);
        
        % build spelling metrix
        for sequenceEnd = 1: numFlicker
	 			  oneFlickerLength =  round(refreshRate/flickerFreq(1, sequenceEnd));
	 			  blockNumber = ceil(flickerFreq(1, sequenceEnd)*symbolDuration/2);
	 			  temp = zeros(2*oneFlickerLength, 1);
          temp(1: oneFlickerLength, 1) = (sequenceEnd*2)-2;
	 			  temp(oneFlickerLength+1: 2*oneFlickerLength, 1) = (sequenceEnd*2)-1;
	 			  temp = repmat(temp, blockNumber, 1); 
	 			  flickerMatrix(:, sequenceEnd) = temp(1:allFlickerNum, 1);
        end
        
        % build start metrix
        for sequenceEnd = 1: 1
	 			  startFlickerLength =  round(refreshRate/startFreq);
	 			  startBlockNumber = ceil(startFreq*prepareTime/2);
	 			  temp = zeros(startFlickerLength*2, 1);
          temp(1: startFlickerLength, 1) = 0;
	 			  temp(startFlickerLength+1: 2*startFlickerLength, 1) = 1;
	 			  temp = repmat(temp, startBlockNumber, 1); 
	 			  startMatrix(:, sequenceEnd) = temp(1:startFlickerNum, 1);
        end
        
      case backgroundMode
        allFlickerNum = round(refreshRate*symbolDuration);
        startFlickerNum = round(refreshRate*prepareTime);
			  flickerMatrix = zeros(allFlickerNum, numFlicker);
        startMatrix = zeros(startFlickerNum, 1);
        
      otherwise
        warning('Unexpected experiment mode. No experiment mode.');
    end
  
  elseif experimentMode == backgroundMode
    flickerMatrix = 0;
    startMatrix = 0;
    
  else
    warning('Unexpected experiment mode. No experiment mode.');
  end
  
end