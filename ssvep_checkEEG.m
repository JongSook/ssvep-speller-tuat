function outputResult = ssvep_checkEEG(data) % not have data value

  outputResult =1;
  threshold = 1.5;

  % for all channel
  for peak = 1: size(data, 2)
    if find( abs(data(:, peak) - mean(data(:, peak))) > threshold)
      outputResult = 0;
    end
  end

end