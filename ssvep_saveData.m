function ssvep_saveData(timeData,samplingFrequency,flickerFreq,symbolDuration,correctCommand,user)
% detectedSymbol, data,time,

  if exist(['EEG/' user], 'dir')

  else
	  mkdir('EEG', user);
  end

  save(['EEG/' user '/' timeData '.mat'], 'correctCommand', '-v6'); % 'detectedSymbol', 'data', 'time',

  if exist(['EEG/' user '/parameter.mat'], 'file')
	  info = load(['EEG/' user '/parameter.mat']);
    
    if size(info.flickerFreq, 2) > length(flickerFreq)
      flickerFreq = [flickerFreq zeros(1, (size(info.flickerFreqs, 2) - length(flickerFreq)))];
    elseif size(info.flickerFreq, 2) < length(flickerFreq)
      info.flickerFreqs = [info.flickerFreq zeros(size(info.flickerFreq, 1), (length(flickerFreq) - size(info.flickerFreq, 2)))];
    end
	
	  timeData = [info.timeData; timeData];
	  samplingFrequency = [info.samplingFrequency; samplingFrequency];
	  flickerFreq = [info.flickerFreq; flickerFreq];
	  symbolDuration = [info.symbolDuration; symbolDuration];
  end

  save(['EEG/' user '/parameter.mat'], 'timeData', 'samplingFrequency', 'flickerFreq', 'symbolDuration', '-v6');
 
end