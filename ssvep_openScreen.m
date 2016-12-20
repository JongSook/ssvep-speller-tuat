function [monitor,ST,FG,BF,KF,BGColor,soundwave] = ssvep_openScreen(screenNum)
% function [monitor,DL,PA,FN,MX,ST,FG,BGColor,soundwave] = ssvep_openScreen(screenNum)
% return texture,position,length,filesize of MX,ST,FG

  monitor = Screen('OpenWindow', screenNum); % this is flickerMonitor of old code
  BGColor = [0 0 0]; % blackBG % maybe change bg
%   BGColor = [85 85 102]; % grayBG % maybe change bg
%   BGColor = [255 255 255]; % whiteBG % maybe change bg

  STfile1 = './inkscape/start_black.png';
  STfile2 = './inkscape/start_white.png';
  PAfile1 = './inkscape/previousaction_black.png';
  PAfile2 = './inkscape/previousaction_white.png';
  FNfile1 = './inkscape/finish_black.png';
  FNfile2 = './inkscape/finish_white.png';
  DLfile1 = './inkscape/delete_black.png';
  DLfile2 = './inkscape/delete_white.png';
  FGfile1 = './inkscape/abcdefghi_black.png';
  FGfile2 = './inkscape/abcdefghi_white.png';
  FGfile3 = './inkscape/jklmnopqr_black.png';
  FGfile4 = './inkscape/jklmnopqr_white.png';
  FGfile5 = './inkscape/stuvwxyz__black.png';
  FGfile6 = './inkscape/stuvwxyz__white.png';
  
  ST1 = imread(STfile1);
  ST2 = imread(STfile2);
  PA1 = imread(PAfile1);
  PA2 = imread(PAfile2);  
  FN1 = imread(FNfile1);
  FN2 = imread(FNfile2);
  DL1 = imread(DLfile1);
  DL2 = imread(DLfile2);
  FG1 = imread(FGfile1);
  FG2 = imread(FGfile2);
  FG3 = imread(FGfile3);
  FG4 = imread(FGfile4);
  FG5 = imread(FGfile5);
  FG6 = imread(FGfile6);
  
  STinfo1 = imfinfo(STfile1);
  STinfo2 = imfinfo(STfile2);
  PAinfo1 = imfinfo(PAfile1);
  PAinfo2 = imfinfo(PAfile2);
  FNinfo1 = imfinfo(FNfile1);
  FNinfo2 = imfinfo(FNfile2);
  DLinfo1 = imfinfo(DLfile1);
  DLinfo2 = imfinfo(DLfile2);
  FGinfo1 = imfinfo(FGfile1);
  FGinfo2 = imfinfo(FGfile2);
  FGinfo3 = imfinfo(FGfile3);
  FGinfo4 = imfinfo(FGfile4);
  FGinfo5 = imfinfo(FGfile5);
  FGinfo6 = imfinfo(FGfile6);
  MXinfo = imfinfo(DLfile1);
  
  ST1 = Screen('MakeTexture', monitor, ST1);
  ST2 = Screen('MakeTexture', monitor, ST2);
  MX1 = Screen('MakeTexture', monitor, PA1);
  MX2 = Screen('MakeTexture', monitor, PA2);
  MX3 = Screen('MakeTexture', monitor, FN1);
  MX4 = Screen('MakeTexture', monitor, FN2); 
  MX5 = Screen('MakeTexture', monitor, DL1);
  MX6 = Screen('MakeTexture', monitor, DL2); 
  FG1 = Screen('MakeTexture', monitor, FG1);
  FG2 = Screen('MakeTexture', monitor, FG2);
  FG3 = Screen('MakeTexture', monitor, FG3);
  FG4 = Screen('MakeTexture', monitor, FG4);
  FG5 = Screen('MakeTexture', monitor, FG5);
  FG6 = Screen('MakeTexture', monitor, FG6);
  
  FG.filesize = [FGinfo1.FileSize FGinfo2.FileSize FGinfo3.FileSize FGinfo4.FileSize FGinfo5.FileSize FGinfo6.FileSize];
  
  ST.texture = [ST1 ST2];
  MX.texture = [MX1 MX2 MX3 MX4 MX5 MX6]; % black switch white of delete, preact, finish
  FG.texture = [MX1 MX2 MX3 MX4 MX5 MX6 FG1 FG2 FG3 FG4 FG5 FG6]; % black switch white 
  
  ST.length = length(ST.texture);
  MX.length = length(MX.texture); 
  FG.length = length(FG.texture);
  
%   STCorner = floor([-abs([STInfo1.Width STInfo1.Height]) abs([STInfo1.Width STInfo1.Height])]/2);
%   PACorner = floor([-abs([PAInfo.Width PAInfo.Height]) abs([PAInfo.Width PAInfo.Height])]/2);
%   FNCorner = floor([-abs([FNInfo.Width FNInfo.Height]) abs([FNInfo.Width FNInfo.Height])]/2); 
%   DLCorner = floor([-abs([DLInfo.Width DLInfo.Height]) abs([DLInfo.Width DLInfo.Height])]/2);
%   FGCorner = floor([-abs([FGInfo1.Width FGInfo1.Height]) abs([FGInfo1.Width FGInfo1.Height])]/2);
  MXCorner = floor([-abs([MXinfo.Width MXinfo.Height]) abs([MXinfo.Width MXinfo.Height])]/2);
  
  tone = [587.33 783.99 987.77 1174.66 1567.98 1975.53]; % freq. 6 type
  soundLength = 0.125;
  
%   HideCursor; % follow original code
  priorityLevel = MaxPriority(monitor); % follow original code
  Priority(priorityLevel); % follow original code
  Screen('FillRect', monitor, BGColor);
  Screen('TextColor', monitor, 255);
  Screen('Flip', monitor)
  
  ST.position = repmat([...
	  1000 475;...
    ], 1, 2)...
    + repmat(MXCorner, 1, 1); % 1 point (center) 
  
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
    + repmat(MXCorner, 6, 1); % 3 point (above) % now 6 point
  
  MX.position = repmat([...
	  600 150;...
	  1000 150;...
		1400 150;... 
		], 1, 2)...
		+ repmat(MXCorner, 3, 1); % 3 point (2 center, 1 below) % noe unused
    
  soundwave = sin(sort(tone(:))*(0:(round(8192*soundLength) - 1))*2*pi/8192);
  
  BF = FG;
  KF = BF;
%   point for matrix 3*3 
% 
%   600 150;...
% 	1000 150;...
% 	1400 150;...
%   ...
% 	600 475;...
%   1000 475;...
% 	1400 475;...
%   ...
%  	600 800;...
% 	1000 800;...
%   1400 800;...
%       
%   if numOfCB ~=0
%     glow.positions = CB.positions + repmat((glowCorner - CBCorner), numOfCB, 1);
%   end
     
end