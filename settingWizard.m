function [experimentMode trial symbolDuration onlineAnalysis subject] = settingWizard
	
	
	% Name of flags
	includeFlagParameter
	
	% wizard
	subject = input('Input subject name: ', 's');
	
	experimentMode = inputCheck('What type of experiment?  freqMode: 1, backGroundMode: 2', 1:2);

	trial = inputCheck('How many trials?', 1:480);
	
  symbolDuration = inputCheck('Input the SYMBOL DURATION (sec).', .5:.1:8);
		
	onlineAnalysis = inputCheck('Do you want to execute the online analysis?', [0 1]);
	
	
end