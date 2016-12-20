function timeData = ssvep_time()

  serial = fix(clock);
  timeData = sprintf('%04d%02d%02d-%02d%02d%02d', serial(1), serial(2), serial(3), serial(4), serial(5), serial(6));
  
end