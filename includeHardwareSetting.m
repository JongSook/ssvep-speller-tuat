	
	samplingFrequency = 1200;
	%EEGChannels = 16 + (1:14); % 1 to 16 and 17 to 32
    EEGChannels = 1:32;
    chNumber = length(EEGChannels);
    
	screenNum = 1;
	refreshRate = 120;