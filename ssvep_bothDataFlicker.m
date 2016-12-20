function [data,time] = ssvep_bothDataFlicker(artificialIntelligence,samplingFrequency,refreshRate,numFlicker,monitor,MX,...
  fickerMatrix,symbolDuration,data,time)

  section = 1:samplingFrequency/refreshRate;
  if numFlicker ~=1
    for ii = 1: numFlicker
      Screen('DrawTexture', monitor, MX.texture(ii), [], MX.position(ii, :))
    end  
  end
  Screen('Flip', monitor);
  for jj = 1: refreshRate
    [tempData tempTime] = getdata(artificialIntelligence, samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end
  pre = refreshRate;
  
  for jj = pre + (1 : symbolDuration * refreshRate)

	  %stimuli control
    if numFlicker ~=1
      for ii = 1: numFlicker
        Screen('DrawTexture', monitor, MX.texture(fickerMatrix(jj - pre,ii)+1), [], MX.position(ii, :))
      end
      Screen('Flip', monitor);
    end
	
	  %getting data
	  [tempData tempTime] = getdata(artificialIntelligence, samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end
  post = round(pre +  symbolDuration * refreshRate);
  for jj = post + (1 : refreshRate)
    [tempData tempTime] = getdata(artificialIntelligence, samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end

end