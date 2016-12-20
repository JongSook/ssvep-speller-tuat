	
  samplingFrequency = 1200;
  eegChannel = 1:32; % 16 + (1:14) % 1 to 16 and 17 to 32
  chNum = length(eegChannel); % 32
  
	screenNum = 1;
	refreshRate = 120;
  
  saving = 1; % 1
	onlineAnalysisChannel = [2 5:7];
	onlineAnalysisResampleRate = 240;
% 	onlineAnalysisSampleInterval = 5;
% 	delayToBeIgnored = .1;
	delay = 120;
	ccaOrder = 2;
	overLapSamples = 0;
  
  flickerRefreshRate = [15 13 11 10 9 8 7 6];
	
	allFlickerFreq = zeros(1,8); % array [0 0 0 0 0 0 0 0]
	allFlickerFreq = refreshRate ./ flickerRefreshRate; % [8 9.2308 10.9091 12 13.3333 15 17.1429 20]
	
% 	numFlicker = 6;
%   numOfFlicker = inputCheck('Input target number.', 2:2:8);
% 	flickerFreq = zeros(1,targetNumber);
  
  topic = 0;
  tictoc = 0;
  trial = 1;
  numTrial = trial;
  
%   dataLength = (2 +  symbolDuration) * samplingFrequency;
%   data = zeros(dataLength, chNum);
%   time = zeros(dataLength, 1);

%   [monitor,ST,FG,BGColor,soundwave] = ssvep_openScreen(screenNum);
%   BF = FG;
%   Screen('CloseAll');

place = 0;
sms = [''];