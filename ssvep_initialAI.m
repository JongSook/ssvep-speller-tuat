function ai = ssvep_initialAI(eegChannel, samplingFrequency, refreshRate)

  ai = analoginput('contec', 'AIO000');

  set(ai, 'SampleRate', samplingFrequency);
%   set(artificialIntelligence, 'BufferingMode', 'Manual');
%   set(artificialIntelligence, 'BufferingConfig', [sampleRate/refreshRate 2000/sampleRate*refreshRate]);
  set(ai, 'SamplesPerTrigger', Inf);
  set(ai, 'LoggingMode', 'Memory');

  addchannel(ai, (eegChannel - 1));

end