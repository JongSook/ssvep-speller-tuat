function [user, experimentMode, prepareTime, startFreq, symbolDuration, onlineAnalysis] = ssvep_setExperiment
% function [experimentMode trial symbolDuration onlineAnalysis subject] = ssvep_setExperiment

  % Parameter
  ssvep_setScreen
  
  % set all of constant
  ssvep_setConstant
  
  % user and experiment
  user = input('Input user name : ', 's');
	experimentMode = ssvep_checkInput('Determine experimental type.  freqMode : 1, backgroundMode : 2', 1:2);
  prepareTime = ssvep_checkInput('How long do you want to prepare (sec).', 0:1:60);
  startFreq = ssvep_checkInput('Input the Start Flicker Frequency (sec).', allFlickerFreq(1, :));	
  symbolDuration = ssvep_checkInput('Input the SYMBOL DURATION (sec).', 5:.1:10);
  onlineAnalysis = ssvep_checkInput('Do you want to execute the online analysis?', [0 1]);
% 	trial = ssvep_checkInput('Input number of trials.', 1:480); % 	unnecessary for spelling
  symbolDuration = symbolDuration - 1.5;
  
end