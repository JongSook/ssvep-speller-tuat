function [FG,trial,topic,sms,place] = ssvep_checkFirstValue(monitor,code,FG,sms,place,topic)

  switch code
    case 1
      FGfile1 = './inkscape/abc_black.png';
      FGfile2 = './inkscape/abc_white.png';
      FGfile3 = './inkscape/def_black.png';
      FGfile4 = './inkscape/def_white.png';
      FGfile5 = './inkscape/ghi_black.png';
      FGfile6 = './inkscape/ghi_white.png';
      trial = 0; topic = 10;
      
    case 11
      FGfile1 = './inkscape/a_black.png';
      FGfile2 = './inkscape/a_white.png';
      FGfile3 = './inkscape/b_black.png';
      FGfile4 = './inkscape/b_white.png';
      FGfile5 = './inkscape/c_black.png';
      FGfile6 = './inkscape/c_white.png';
      trial = 0; topic = 110;
      
    case 111
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 112
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 113
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 12
      FGfile1 = './inkscape/d_black.png';
      FGfile2 = './inkscape/d_white.png';
      FGfile3 = './inkscape/e_black.png';
      FGfile4 = './inkscape/e_white.png';
      FGfile5 = './inkscape/f_black.png';
      FGfile6 = './inkscape/f_white.png';
      trial = 0; topic = 120;
      
    case 121
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 122
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 123
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 13
      FGfile1 = './inkscape/g_black.png';
      FGfile2 = './inkscape/g_white.png';
      FGfile3 = './inkscape/h_black.png';
      FGfile4 = './inkscape/h_white.png';
      FGfile5 = './inkscape/i_black.png';
      FGfile6 = './inkscape/i_white.png';
      trial = 0; topic = 130;
      
    case 131
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 132
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 133
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 2
      FGfile1 = './inkscape/jkl_black.png';
      FGfile2 = './inkscape/jkl_white.png';
      FGfile3 = './inkscape/mno_black.png';
      FGfile4 = './inkscape/mno_white.png';
      FGfile5 = './inkscape/pqr_black.png';
      FGfile6 = './inkscape/pqr_white.png';
      trial = 0; topic = 20;
      
    case 21
      FGfile1 = './inkscape/j_black.png';
      FGfile2 = './inkscape/j_white.png';
      FGfile3 = './inkscape/k_black.png';
      FGfile4 = './inkscape/k_white.png';
      FGfile5 = './inkscape/l_black.png';
      FGfile6 = './inkscape/l_white.png';
      trial = 0; topic = 210;
      
    case 211
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 212
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 213
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 22
      FGfile1 = './inkscape/m_black.png';
      FGfile2 = './inkscape/m_white.png';
      FGfile3 = './inkscape/n_black.png';
      FGfile4 = './inkscape/n_white.png';
      FGfile5 = './inkscape/o_black.png';
      FGfile6 = './inkscape/o_white.png';
      trial = 0; topic = 220;
      
    case 221
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 222
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 223
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 23
      FGfile1 = './inkscape/p_black.png';
      FGfile2 = './inkscape/p_white.png';
      FGfile3 = './inkscape/q_black.png';
      FGfile4 = './inkscape/q_white.png';
      FGfile5 = './inkscape/r_black.png';
      FGfile6 = './inkscape/r_white.png';
      trial = 0; topic = 230;
      
    case 231
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 232
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 233
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 3
      FGfile1 = './inkscape/stu_black.png';
      FGfile2 = './inkscape/stu_white.png';
      FGfile3 = './inkscape/vwx_black.png';
      FGfile4 = './inkscape/vwx_white.png';
      FGfile5 = './inkscape/yz__black.png';
      FGfile6 = './inkscape/yz__white.png';
      trial = 0; topic = 30;
      
    case 31
      FGfile1 = './inkscape/s_black.png';
      FGfile2 = './inkscape/s_white.png';
      FGfile3 = './inkscape/t_black.png';
      FGfile4 = './inkscape/t_white.png';
      FGfile5 = './inkscape/u_black.png';
      FGfile6 = './inkscape/u_white.png';
      trial = 0; topic = 310;
      
    case 311
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 312
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 313
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 32
      FGfile1 = './inkscape/v_black.png';
      FGfile2 = './inkscape/v_white.png';
      FGfile3 = './inkscape/w_black.png';
      FGfile4 = './inkscape/w_white.png';
      FGfile5 = './inkscape/x_black.png';
      FGfile6 = './inkscape/x_white.png';
      trial = 0; topic = 320;
      
    case 321
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 322
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 323
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 33
      FGfile1 = './inkscape/y_black.png';
      FGfile2 = './inkscape/y_white.png';
      FGfile3 = './inkscape/z_black.png';
      FGfile4 = './inkscape/z_white.png';
      FGfile5 = './inkscape/__black.png';
      FGfile6 = './inkscape/__white.png';
      trial = 0; topic = 330;
      
    case 331
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 332
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 333
      [sms,place] = ssvep_printSpell(code,sms,place);
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      
    case 4 % not perfect
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      % return to pre-action
      
    case 14 % not perfect
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      % return to pre-action
      
    case 114 % not perfect
      FG = FG;
      trial = 0; topic = 10;
      % return to pre-action
      
    case 124 % not perfect
      FG = FG;
      trial = 0; topic = 10;
      % return to pre-action
      
    case 134 % not perfect
      FG = FG;
      trial = 0; topic = 10;
      % return to pre-action
      
    case 24 % not perfect
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      % return to pre-action
      
    case 214 % not perfect
      FG = FG;
      trial = 0; topic = 20;
      % return to pre-action
      
    case 224 % not perfect
      FG = FG;
      trial = 0; topic = 20;
      % return to pre-action
      
    case 234 % not perfect
      FG = FG;
      trial = 0; topic = 20;
      % return to pre-action
      
    case 34 % not perfect
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      % return to pre-action
      
    case 314 % not perfect
      FG = FG;
      trial = 0; topic = 30;
      % return to pre-action
      
    case 324 % not perfect
      FG = FG;
      trial = 0; topic = 30;
      % return to pre-action
      
    case 334 % not perfect
      FG = FG;
      trial = 0; topic = 30;
      % return to pre-action
    
    case 5
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 15
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 115
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 125
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 135
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 25
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 215
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 225
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 235
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 35
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 315
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 325
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
      
    case 335
      FG = FG;
      trial = 5; topic = 0;
      % finish experiment and still show word
    
    case 6
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter 
      
    case 16
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 116
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 126
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 136
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 26
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 216
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 226
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 236
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 36
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 316
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 326
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    case 336
      [FGfile1,FGfile2,FGfile3,FGfile4,FGfile5,FGfile6,trial,topic] = ssvep_pic();
      sms(place) = ' ';
      if place ~= 1
        place = place - 1;
      end
      % break loop and delete pre-letter
      
    otherwise
      warning('Unexpected experiment mode. No experiment mode.');
  end
 
  if code ~= 114:10:664 & code ~= 115:10:665 & code ~= 5:10:555
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
    
    FGinfo1 = imfinfo(FGfile1);
    FGinfo2 = imfinfo(FGfile2);
    FGinfo3 = imfinfo(FGfile3);
    FGinfo4 = imfinfo(FGfile4);
    FGinfo5 = imfinfo(FGfile5);
    FGinfo6 = imfinfo(FGfile6);
    
    FG.filesize = [FGinfo1.FileSize FGinfo2.FileSize FGinfo3.FileSize FGinfo4.FileSize FGinfo5.FileSize FGinfo6.FileSize];
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

end