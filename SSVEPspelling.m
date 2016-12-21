 function SSVEPspelling
%% run spelling experiment 

%% Constant Parameter

  % set screen
  ssvep_setScreen
  
  % set experiment
  [user, experimentMode, prepareTime, startFreq, symbolDuration, onlineAnalysis] = ssvep_setExperiment; % trial,... 
  
  % set all of constant
  ssvep_setConstant
  
  % set stimulation and flicker
  [numFlicker,flickerFreq,fickerMatrix,startMatrix] = ssvep_setStimBG(experimentMode,refreshRate,symbolDuration,...
    startFreq, prepareTime);

%% Preparing Screen 

	% Open the flicker window and load image
	[monitor,ST,FG,BF,KF,BGColor,soundwave] = ssvep_openScreen(screenNum);

%% Start Calibration

  % start start screen
  while trial > 0
%% Start Data Analysis
    
    dataLength = (2 +  symbolDuration) * samplingFrequency;
    data = zeros(dataLength, chNum);
    time = zeros(dataLength, 1);
    tictoc = tictoc + 1;
    % message and flicker for 1st screen before run experiment
    if experimentMode == freqMode
      if trial == 1
		    Screen('FillRect', monitor, BGColor)
        Screen('TextSize', monitor, 75);
		    Screen('DrawText', monitor, 'SSVEP SPELLING', 550, 150);
        Screen('TextSize', monitor, 50);
		    Screen('DrawText', monitor, 'Concentrate To Figure For "START"', 350, 800);
      end
		  Screen('DrawTexture', monitor, ST.texture(1), [], ST.position(1, :))
      
    elseif experimentMode == backgroundMode
      if trial == 1
        Screen('FillRect', monitor, BGColor)
        Screen('TextSize', monitor, 75);
		    Screen('DrawText', monitor, 'SSVEP SPELLING', 550, 150);
        Screen('TextSize', monitor, 50);
		    Screen('DrawText', monitor, 'Welcome to Background Mode', 400, 800);
      end
        
    else
        warning('Unexpected experiment mode. No experiment mode.');
    end
    Screen('Flip', monitor);
    
    % experiment time
    timeData = ssvep_time;
    
    % screen of start
    correctCommand = mod((trial-numTrial), numFlicker) + 1; 
    ai = ssvep_initialAI(eegChannel, samplingFrequency, refreshRate);
    startExp = GetSecs;
    start(ai);
    [data time] = ssvep_flickerStart(ai,samplingFrequency,refreshRate,numFlicker,monitor,ST,...
    prepareTime,data,time,startMatrix);
    stop(ai);
		delete(ai);
    endExp = GetSecs;

    % time per experiment
    if trial > 0
		  fprintf('\nTime of Experiment %d : %2.5f s.\n', tictoc, endExp - startExp);
      Screen('Flip', monitor);
    end
    
%% Save and Clear Data
    
    % save all of data
    tic
    if saving && experimentMode == freqMode
			ssvep_saveData(timeData,samplingFrequency,flickerFreq,symbolDuration,correctCommand,user) % data,time, % detectedSymbol,
    elseif experimentMode == backgroundMode
      WaitSecs(prepareTime);
    else
        warning('Unexpected experiment mode. No experiment mode.');  
    end
    toc
    
    % clear some data
    clear data
    clear time
    
%% Part of End Experiment

    % control loop by myself 555
    if trial == 1
      if experimentMode == freqMode
        Screen('FillRect', monitor, BGColor)
        Screen('TextSize', monitor, 75);
		    Screen('DrawText', monitor, 'SSVEP SPELLING', 545, 350);
        Screen('TextSize', monitor, 50);
        Screen('DrawText', monitor, 'Hold "0" and Press "Enter" to "SPELLING"', 200, 700);
        Screen('Flip', monitor);
        trial = ssvep_checkInput('Insert 0 only!!!', 0:1000);
         
      elseif experimentMode == backgroundMode
        Screen('FillRect', monitor, BGColor)
        Screen('TextSize', monitor, 75);
		    Screen('DrawText', monitor, 'SSVEP SPELLING', 545, 350);
        Screen('TextSize', monitor, 50);
        Screen('DrawText', monitor, 'Hold "0" and Press "Enter" to "EXIT"', 250, 700);
        Screen('Flip', monitor);
        trial = ssvep_checkInput('Insert 0 only!!!', 0:1000);
        
      else
        warning('Unexpected experiment mode. No experiment mode.');
      end
      
    else 
      trial = trial - numTrial + 1;
    end

  end
  % finish start screen

%% Spelling Calibration

  % determine experimental mode only
  if experimentMode == freqMode
    % start spelling screen
    while trial < 1
%% Start Data Analysis
    
      % screen of spelling
      tic
      dataLength = (2 +  symbolDuration) * samplingFrequency;
      data = zeros(dataLength, chNum);
      time = zeros(dataLength, 1);
      ai = ssvep_initialAI(eegChannel, samplingFrequency, refreshRate);
      start(ai);
      [data time] = ssvep_flickerSpell(ai,samplingFrequency,refreshRate,numFlicker,monitor,FG,...
      fickerMatrix,symbolDuration,data,time,sms);
      stop(ai);
		  delete(ai);
      toc
    
      % clear some data
      clear data
      clear time
      
%% Spelling Data Analysis

%       % output of data analyze control code value
%       if onlineAnalysis
%         switch experimentMode
%       	  case freqMode
%         	  [detectedSymbol] = ssvep_tryCCA(data, flickerFreq, symbolDuration, samplingFrequency,...
%               ccaOrder, onlineAnalysisChannel, delay, onlineAnalysisResampleRate);
%       	  case backGroundMode
%             detectedSymbol = 1;
%           otherwise
%         	  warning('Unexpected experiment mode.');
%         end
%  	 	  else
%     		detectedSymbol = 1;	
%       end
    
%       collect = 1;
%       for i = 2:6
%         if detectedSymbol(i) > detectedSymbol(i-1)
%           collect = i;
%         end
%       end
%       code = round(collect);
    
%% Part of End Experiment

      % control loop by myself 555 % when use keyboard
      if trial == 0
        Screen('FillRect', monitor, BGColor)
        Screen('TextSize', monitor, 75);
		    Screen('DrawText', monitor, 'SSVEP SPELLING', 545, 350);
        Screen('TextSize', monitor, 50);
		    Screen('DrawText', monitor, 'Choice 1:A 2:J 3:S 4:preact 5:fin 6:del', 225, 700);
        Screen('TextSize', monitor, 50);
        Screen('DrawText', monitor, sms, 100, 1000);
        Screen('Flip', monitor);
        code = ssvep_checkInput('Insert 1:A 2:J 3:S 4:preact 5:fin 6:del', 0:1:6);
        if code ~= 0
          code = topic + code;
          [FG,trial,topic,sms,place] = ssvep_checkFirstValue(monitor,code,KF,sms,place,topic);
          if BF.filesize(1) ~= FG.filesize(1) || BF.filesize(2) ~= FG.filesize(2) || BF.filesize(3) ~= FG.filesize(3) ...
             || BF.filesize(4) ~= FG.filesize(4) || BF.filesize(5) ~= FG.filesize(5) || BF.filesize(6) ~= FG.filesize(6)
            KF = BF; BF = FG;
          end
        end
      else 
        trial = trial + 1;
      end
    
%       % control loop by myself 555 % when use EEG
%       if trial == 0
%         if numFlicker > 1
%           for pic = 1: (FG.length/2)
%             Screen('DrawTexture', monitor, FG.texture((2*pic)-1), [], FG.position(pic, :))
%           end
%         end
%         Screen('TextSize', monitor, 50);
%         Screen('DrawText', monitor, sms, 100, 1000);
%         Screen('Flip', monitor);
%         code = round(detectedSymbol);
%         if code ~= 0
%           code = topic + code;
%           [FG,trial,topic,sms,place] = ssvep_checkFirstValue(monitor,code,KF,sms,place,topic);
%           if BF.filesize(1) ~= FG.filesize(1) || BF.filesize(2) ~= FG.filesize(2) || BF.filesize(3) ~= FG.filesize(3) ...
%              || BF.filesize(4) ~= FG.filesize(4) || BF.filesize(5) ~= FG.filesize(5) || BF.filesize(6) ~= FG.filesize(6)
%             KF = BF; BF = FG;
%           end
%         end
%       else 
%         trial = trial + 1;
%       end
  
    end
    % finish spelling screen
  
%% Conclude Your Spelling
  
  % show your spelling 2 second
  Screen('FillRect', monitor, BGColor)
  Screen('TextSize', monitor, 75);
	Screen('DrawText', monitor, 'SSVEP SPELLING', 545, 350);
  Screen('TextSize', monitor, 150);
  Screen('DrawText', monitor, sms, 400, 700);
  Screen('Flip', monitor);
  WaitSecs(2);
      
  end
  % finish experimental mode
  
%% Close Screen

  % finish of finish close and clear everything  
  Screen('CloseAll'); % ssvep_closeScreen(monitor);
  clear all
   
end