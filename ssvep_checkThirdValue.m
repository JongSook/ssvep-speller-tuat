function [FG,trial] = ssvep_checkThirdValue(monitor,code,FG)

  DLfile1 = './inkscape/delete_black.png';
  DLfile2 = './inkscape/delete_white.png';
  PAfile1 = './inkscape/previousaction_black.png';
  PAfile2 = './inkscape/previousaction_white.png';
  FNfile1 = './inkscape/finish_black.png';
  FNfile2 = './inkscape/finish_white.png';
  
  DL1 = imread(DLfile1);
  DL2 = imread(DLfile2);
  PA1 = imread(PAfile1);
  PA2 = imread(PAfile2);  
  FN1 = imread(FNfile1);
  FN2 = imread(FNfile2);
  FG1 = imread(FGfile1);
  FG2 = imread(FGfile2);
  FG3 = imread(FGfile3);
  FG4 = imread(FGfile4);
  FG5 = imread(FGfile5);
  FG6 = imread(FGfile6);
  
  MX1 = Screen('MakeTexture', monitor, DL1);
  MX2 = Screen('MakeTexture', monitor, DL2);
  MX3 = Screen('MakeTexture', monitor, FN1);
  MX4 = Screen('MakeTexture', monitor, FN2); 
  MX5 = Screen('MakeTexture', monitor, PA1);
  MX6 = Screen('MakeTexture', monitor, PA2);
  FG1 = Screen('MakeTexture', monitor, FG1);
  FG2 = Screen('MakeTexture', monitor, FG2);
  FG3 = Screen('MakeTexture', monitor, FG3);
  FG4 = Screen('MakeTexture', monitor, FG4);
  FG5 = Screen('MakeTexture', monitor, FG5);
  FG6 = Screen('MakeTexture', monitor, FG6);
  
  FG.texture = [MX1 MX2 MX3 MX4 MX5 MX6 FG1 FG2 FG3 FG4 FG5 FG6]; % black switch white 
  FG.length = length(FG.texture);
  MXinfo = imfinfo(FGfile1);
  MXCorner = floor([-abs([MXinfo.Width MXinfo.Height]) abs([MXinfo.Width MXinfo.Height])]/2);
  
  FG.position = repmat([... 
    600 150;...
	  1000 150;...
		1400 150;... 
    ...
    600 475;...
    1400 475;...
    ...
    1000 800;...
    ], 1, 2)...
    + repmat(MXCorner, 6, 1);

end
