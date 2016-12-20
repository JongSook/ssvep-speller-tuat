function saveData(data,...
			time,...
			fileName,...
			samplingFrequency,...
			flickerFreqs,...
			symbolDuration,...
			correctCommands,...
			detectedSymbols,...
			preFixationTime,...
			postFixationTime,...
			subject)

if exist(['EEG/' subject], 'dir')

else
	mkdir('EEG', subject);
end

save(['EEG/' subject '/' fileName '.mat'], 'data', 'time', 'correctCommands', 'detectedSymbols', '-v6')



if exist(['EEG/' subject '/parameter.mat'], 'file')
	P = load(['EEG/' subject '/parameter.mat']);
    
    if size(P.flickerFreqs, 2) > length(flickerFreqs)
        flickerFreqs = [flickerFreqs zeros(1, (size(P.flickerFreqs, 2) - length(flickerFreqs)))];
    elseif size(P.flickerFreqs, 2) < length(flickerFreqs)
        P.flickerFreqs = [P.flickerFreqs zeros(size(P.flickerFreqs, 1), (length(flickerFreqs) - size(P.flickerFreqs, 2)))];
    end
	
	fileName = [P.fileName; fileName];
	samplingFrequency = [P.samplingFrequency; samplingFrequency];
	flickerFreqs = [P.flickerFreqs; flickerFreqs];
	symbolDuration = [P.symbolDuration; symbolDuration];
	preFixationTime = [P.preFixationTime; preFixationTime];
	postFixationTime = [P.postFixationTime; postFixationTime];

end

save(['EEG/' subject '/parameter.mat'], 'fileName', 'samplingFrequency', 'flickerFreqs', 'symbolDuration',...
  'preFixationTime', 'postFixationTime', '-v6');

end
