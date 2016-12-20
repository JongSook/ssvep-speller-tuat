function [data time] = flickerAndGetData(ai, samplingFrequency, refreshRate, numOfFlicker, flickerMonitor, CB, flickerTimingMatrix, symbolDuration, preFixationTime, postFixationTime, data,time)

  section = 1:samplingFrequency/refreshRate;
  
  
  %% draw first image
  if numOfFlicker ~=1
    for ii = 1:numOfFlicker
      Screen('DrawTexture', flickerMonitor, CB.textures(1), [], CB.positions(ii, :))
    end
    
  end
 Screen('Flip', flickerMonitor);
 
  %% get data on pre-stimuli intarval 
  for jj = 1: preFixationTime * refreshRate
    [tempData tempTime] = getdata(ai, samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end


 %% get data on stimuli intarval 
  pre = preFixationTime * refreshRate;
  
  for jj = pre + (1 :   symbolDuration * refreshRate)

	  %stimuli control
    if numOfFlicker ~=1
      for ii = 1:numOfFlicker
        Screen('DrawTexture', flickerMonitor, CB.textures(flickerTimingMatrix(jj - pre,ii)+1), [], CB.positions(ii, :))
      end
      Screen('Flip', flickerMonitor);
    end
	
	  %getting data
	  [tempData tempTime] = getdata(ai,samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end

  %% get data on post-stimuli intarval 
  post = round(pre +  symbolDuration * refreshRate);
  for jj = post + (1 : postFixationTime * refreshRate)
    [tempData tempTime] = getdata(ai,samplingFrequency/refreshRate);
    data(section + (jj-1) * samplingFrequency/refreshRate,:) = tempData;
    time(section + (jj-1) * samplingFrequency/refreshRate,:) = tempTime;
  end
  
  
  
end


