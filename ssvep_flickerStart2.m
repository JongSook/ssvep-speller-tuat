function [data time] = ssvep_flickerStart2(ai,samplingFrequency,refreshRate,numFlicker,monitor,ST,...
  prepareTime,data,time,startMatrix)

  ratio = samplingFrequency/refreshRate; % 10
  dual = prepareTime*refreshRate; % [0:1:60]*120
  section = 1: ratio; % [1, 10]
  
  if numFlicker > 1
    Screen('DrawTexture', monitor, ST.texture(1), [], ST.position(1, :))
  end
  Screen('Flip', monitor);
  
%   for jj = 1: refreshRate
%     [tempData tempTime] = getdata(ai, ratio);
%     data(section + (jj-1) * ratio,:) = tempData;
%     time(section + (jj-1) * ratio,:) = tempTime;
%   end
  
  for flip = 1: dual
    if numFlicker > 1
      for loop = 1: (ST.length/2)
        Screen('DrawTexture', monitor, ST.texture(startMatrix(flip, loop)+1), [], ST.position(loop, :))
      end
      Screen('Flip', monitor);
    end
%     [tempData tempTime] = getdata(ai, ratio);
%     data(section + (jj-1) * ratio,:) = tempData;
%     time(section + (jj-1) * ratio,:) = tempTime;
  end
  
%   for jj = round(refreshRate + prepareTime * refreshRate) + (1 : refreshRate)
%     [tempData tempTime] = getdata(ai, ratio);
%     data(section + (jj-1) * ratio,:) = tempData;
%     time(section + (jj-1) * ratio,:) = tempTime;
%   end

end