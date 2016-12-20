function [FG,trial] = ssvep_checkSecondValue(monitor,code,FG)

  switch code
    case 11
      FGfile1 = './inkscape/a_black.png';
      FGfile2 = './inkscape/a_white.png';
      FGfile3 = './inkscape/b_black.png';
      FGfile4 = './inkscape/b_white.png';
      FGfile5 = './inkscape/c_black.png';
      FGfile6 = './inkscape/c_white.png';
      trial = 0;
      
    case 21
      FGfile1 = './inkscape/d_black.png';
      FGfile2 = './inkscape/d_white.png';
      FGfile3 = './inkscape/e_black.png';
      FGfile4 = './inkscape/e_white.png';
      FGfile5 = './inkscape/f_black.png';
      FGfile6 = './inkscape/f_white.png';
      trial = 0;
      
    case 31
      FGfile1 = './inkscape/g_black.png';
      FGfile2 = './inkscape/g_white.png';
      FGfile3 = './inkscape/h_black.png';
      FGfile4 = './inkscape/h_white.png';
      FGfile5 = './inkscape/i_black.png';
      FGfile6 = './inkscape/i_white.png';
      trial = 0;
      
    case 12
      FGfile1 = './inkscape/j_black.png';
      FGfile2 = './inkscape/j_white.png';
      FGfile3 = './inkscape/k_black.png';
      FGfile4 = './inkscape/k_white.png';
      FGfile5 = './inkscape/l_black.png';
      FGfile6 = './inkscape/l_white.png';
      trial = 0;
      
    case 22
      FGfile1 = './inkscape/m_black.png';
      FGfile2 = './inkscape/m_white.png';
      FGfile3 = './inkscape/n_black.png';
      FGfile4 = './inkscape/n_white.png';
      FGfile5 = './inkscape/o_black.png';
      FGfile6 = './inkscape/o_white.png';
      trial = 0;
      
    case 32
      FGfile1 = './inkscape/p_black.png';
      FGfile2 = './inkscape/p_white.png';
      FGfile3 = './inkscape/q_black.png';
      FGfile4 = './inkscape/q_white.png';
      FGfile5 = './inkscape/r_black.png';
      FGfile6 = './inkscape/r_white.png';
      trial = 0;
      
    case 13
      FGfile1 = './inkscape/s_black.png';
      FGfile2 = './inkscape/s_white.png';
      FGfile3 = './inkscape/t_black.png';
      FGfile4 = './inkscape/t_white.png';
      FGfile5 = './inkscape/u_black.png';
      FGfile6 = './inkscape/u_white.png';
      trial = 0;
      
    case 23
      FGfile1 = './inkscape/v_black.png';
      FGfile2 = './inkscape/v_white.png';
      FGfile3 = './inkscape/w_black.png';
      FGfile4 = './inkscape/w_white.png';
      FGfile5 = './inkscape/x_black.png';
      FGfile6 = './inkscape/x_white.png';
      trial = 0;
      
    case 33
      FGfile1 = './inkscape/y_black.png';
      FGfile2 = './inkscape/y_white.png';
      FGfile3 = './inkscape/z_black.png';
      FGfile4 = './inkscape/z_white.png';
      FGfile5 = './inkscape/__black.png';
      FGfile6 = './inkscape/__white.png';
      trial = 0;
      
    case 4
      FG = FG;
      trial = 0;
      % return to pre-action
    
    case 5
      FG = FG;
      trial = 5;
      % finish experiment and still show word
    
    case 6
      FGfile1 = './inkscape/abcdefghi_black.png';
      FGfile2 = './inkscape/abcdefghi_white.png';
      FGfile3 = './inkscape/jklmnopqr_black.png';
      FGfile4 = './inkscape/jklmnopqr_white.png';
      FGfile5 = './inkscape/stuvwxyz__black.png';
      FGfile6 = './inkscape/stuvwxyz__white.png';
      trial = 0;
      % break loop and delete pre-letter 
      
    otherwise
      warning('Unexpected experiment mode. No experiment mode.');
  end  
  
  PAfile1 = './inkscape/previousaction_black.png';
  PAfile2 = './inkscape/previousaction_white.png';
  FNfile1 = './inkscape/finish_black.png';
  FNfile2 = './inkscape/finish_white.png';
  DLfile1 = './inkscape/delete_black.png';
  DLfile2 = './inkscape/delete_white.png';
  
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