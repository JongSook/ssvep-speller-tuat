	flickerRefreshRate = [15 13 11 10 9 8 7 6];
	
	allFlickerFreqs = zeros(1,8);	
	allFlickerFreqs(1,:) =  refreshRate ./ flickerRefreshRate;
	
	numOfFlicker = inputCheck('Input target number.', 2:2:8);
	
	
	flickerFreqs = zeros(1,targetNumber);
	
	%[8 9.2 10.9 12 13.3 15 17.1 20];
	for ii = 1:numOfFlicker
		flickerFreqs(1,ii) = inputCheck(['Input' num2str(ii) 'th flicker Frequency.'], allFlickerFreqs(1,:));
	end
	
	
	
	