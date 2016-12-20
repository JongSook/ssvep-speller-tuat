function startExperiment
% test SSVEP response 

%% SETTING
	
	% Name of flags
	includeFlagParameter
	
	% HardwareSetting
	includeHardwareSetting
	
	% Setting Analysis parameter
	includeAnalysisSetting
	
	% Experiment setting wizerd
	[...
	experimentMode,...
	numOfTrial,...
	symbolDuration,...
	onlineAnalysis,...
	subject...
	] = settingWizard;
	
	
	
	%Stimuli setting (initialize)
	[...
	preFixationTime,...
	postFixationTime,...
	numOfFlicker...
  flickerFreqs...
	] = setStimuliParams(experimentMode, refreshRate);
	
	
	%Stimuli timing (initialize)
  if experimentMode == freqMode
	  [flickerTimingMatrix] = setFlickerTimingMatrix(experimentMode,  ...
    numOfFlicker, refreshRate, flickerFreqs(1,:), ...
    symbolDuration);
  else
    flickerTimingMatrix = 0;
  
  end
  
  
	%% PREPARING
	% Open the flicker window and load images
	[...
	flickerMonitor,...
	CB,...
	EC,...
	glow,...
	BGColor,...
	soundwave...
	] = openFlickerWindow(numOfFlicker, screenNum);

    

    
	%% MEASUREMENT
	trial = numOfTrial;
	while trial > 0
    
    
    
    allDataLength = (preFixationTime + postFixationTime +  symbolDuration) * samplingFrequency;
    data = zeros(allDataLength, chNumber);
    time = zeros(allDataLength,1);
    
		
		
  		
	


		correctCommands = mod((numOfTrial-trial), numOfFlicker) + 1; 
	
		% Show message to let press any key.
		Screen('FillRect', flickerMonitor, BGColor)
		Screen('DrawText', flickerMonitor, 'Press any key to start.', 320, 1000);
		Screen('DrawText', flickerMonitor, [num2str(numOfTrial - trial + 1) '/' num2str(numOfTrial)], 1560, 1000);
    
    % Show flicker
    if experimentMode == freqMode
		  Screen('DrawTexture', flickerMonitor, EC.texture, [], EC.positions(correctCommands, :))
      for ii = 1:numOfFlicker
		    Screen('DrawTexture', flickerMonitor, CB.textures(1), [], CB.positions(ii, :))
      end
    end
    
		Screen('Flip', flickerMonitor);
		
		% Create an A/D converter.
		ai = initAi(EEGChannels, samplingFrequency, refreshRate);
		% set(ai, 'SamplesAcquiredFcnCount', sampleRate/refreshRate);
    
    if numOfFlicker ==1
      pause
    elseif mod(numOfTrial - trial + 1, numOfFlicker) == 1
			pause
		else
			pause(0.5);
    end

		timeStr = yyyymmddHHMMSS;
		startSec = GetSecs;
	
		% START RECORDING
		start(ai);
	
		% START STIMULI
		[data time] = flickerAndGetData(ai, samplingFrequency, refreshRate, numOfFlicker, flickerMonitor, CB,...
    	flickerTimingMatrix, symbolDuration, preFixationTime, postFixationTime, data, time);
	
		%% STOP RECORDING
		stop(ai);
		delete(ai);
		endSec = GetSecs;
	
		% Output secs.
		fprintf('\nElapsed time: %2.5f s.\n', endSec - startSec);
		%fprintf('Data acquisition time: %2.5f s.\n\n', time(round(t*samplingFrequency)));
	
		% Show blank screen.
		Screen('Flip', flickerMonitor);
	
    	%% DataAnlizing
  		if onlineAnalysis
        switch experimentMode
      			case freqMode
        			[detectedSymbols] = ccaAnalysis(data, flickerFreqs(1,:), symbolDuration, samplingFrequency,...
          			ccaOrder, onlineAnalysisChannel, delay, onlineAnalysisResampleRate);
          			
              
          			Screen('DrawTexture', flickerMonitor, glow.texture, [], glow.positions(detectedSymbols, :))
      				  Screen('Flip', flickerMonitor);
      				
      			case backGroundMode
              detectedSymbols = 0;
    		     
      			
      			otherwise
        			warning('Unexpected experiment mode.');
        end
 	 	  else
    		detectedSymbols = 0;
    		
  		end  
	
		%% SAVING
    	if saving
        if checkEEGData(data) ==1
			saveData(...
			data,...
			time,...
			timeStr,...
			samplingFrequency,...
			flickerFreqs(1,:),...
			symbolDuration,...
			correctCommands,...
			detectedSymbols,...
			preFixationTime,...
			postFixationTime,...
			subject)
        else
          trial = trial+1;
        end
        
      end
      
      clear data
      clear time
	
		%% MEASUREMENT SETTING (CONTINUE)
		if trial == 1
      Screen('FillRect', flickerMonitor, BGColor)
		  Screen('DrawText', flickerMonitor, 'Press 0 to end experiment.', 320, 1000);
      Screen('Flip', flickerMonitor);
			trial = inputCheck('Continue?', 0:100); % don't input 0 occur loop inf
		
			if trial
            	%setOnetimeParams
			end
		else
			trial = trial - 1;
		end
	
	end   %(end while) 


	
	
	%% CLOSE FLICKER WINDOW
	closeFlickerWindow(flickerMonitor);
	clear all

end