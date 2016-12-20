function ai = initAi(EEGChannels, sampleRate, refreshRate)

ai = analoginput('contec', 'AIO000');

set(ai, 'SampleRate', sampleRate);
%set(ai, 'BufferingMode', 'Manual');
%set(ai, 'BufferingConfig', [sampleRate/refreshRate 2000/sampleRate*refreshRate]);
set(ai, 'SamplesPerTrigger', Inf);
set(ai, 'LoggingMode', 'Memory');

addchannel(ai, (EEGChannels - 1));

end
