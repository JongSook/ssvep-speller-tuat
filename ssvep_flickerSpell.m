function [data time] = ssvep_flickerSpell(ai,samplingFrequency,refreshRate,numFlicker,monitor,FG,...
  fickerMatrix,symbolDuration,data,time,sms)

  ratio = samplingFrequency/refreshRate; % 10
  dual = symbolDuration*refreshRate; % [5:.1:10]*120*5 = 60:1200
  section = 1: ratio; % [1, 10]
  if numFlicker > 1
    for pic = 1: (FG.length/2)
      Screen('DrawTexture', monitor, FG.texture((2*pic)-1), [], FG.position(pic, :))
    end
  end
  
  for present = 1: refreshRate
    [tempData tempTime] = getdata(ai, ratio);
    data(section + (present-1) * ratio, :) = tempData;
    time(section + (present-1) * ratio, :) = tempTime;
  end
  Screen('TextSize', monitor, 50);
  Screen('DrawText', monitor, sms, 100, 1000);
  Screen('Flip', monitor);
  
  for flip = refreshRate + (1: dual)
    if numFlicker > 1
      for loop = 1: (FG.length/2)
        Screen('DrawTexture', monitor, FG.texture(fickerMatrix(flip-refreshRate, loop)+1), [], FG.position(loop, :))
      end
      Screen('TextSize', monitor, 50);
      Screen('DrawText', monitor, sms, 100, 1000);
      Screen('Flip', monitor);
    end
	  [tempData tempTime] = getdata(ai, ratio);
    data(section + (flip-1) * ratio, :) = tempData;
    time(section + (flip-1) * ratio, :) = tempTime;
  end
  
  post = round(refreshRate +  symbolDuration * refreshRate);
  for past = post + (1: refreshRate)
    [tempData tempTime] = getdata(ai, ratio);
    data(section + (past-1) * ratio, :) = tempData;
    time(section + (past-1) * ratio, :) = tempTime;
  end    

end