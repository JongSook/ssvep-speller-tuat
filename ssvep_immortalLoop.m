function ssvep_immortalLoop(BGColor)
% use for need to show something until pushed botton

 need = 1;
 
 while need > 0
   Screen('FillRect', monitor, BGColor)
   Screen('TextSize', monitor, 125);
	 Screen('DrawText', monitor, 'SSVEP SPELLING', 750, 450);
   Screen('TextSize', monitor, 75);
	 Screen('DrawText', monitor, 'Hold "0" and Press "Enter" to "EXIT"', 600, 800);
   Screen('Flip', monitor);
   need = ssvep_checkInput('Insert 0 only!!!', 0:0.00000001:1000000);
 end

end