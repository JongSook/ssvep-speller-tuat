function [sms,place] = ssvep_printSpell(code,sms,place)

  place = place + 1; % position+50 % now array+1
  
  switch code
    case 111
      sms(place) = 65;
    case 112
      sms(place) = 66;
    case 113
      sms(place) = 67;
    case 121
      sms(place) = 68;
    case 122
      sms(place) = 69;
    case 123
      sms(place) = 70;
    case 131
      sms(place) = 71;
    case 132
      sms(place) = 72;
    case 133
      sms(place) = 73;
    case 211
      sms(place) = 74;
    case 212
      sms(place) = 75;
    case 213
      sms(place) = 76;
    case 221
      sms(place) = 77;
    case 222
      sms(place) = 78;
    case 223
      sms(place) = 79;
    case 231
      sms(place) = 80;
    case 232
      sms(place) = 81;
    case 233
      sms(place) = 82;
    case 311
      sms(place) = 83;
    case 312
      sms(place) = 84;
    case 313
      sms(place) = 85;
    case 321
      sms(place) = 86;
    case 322
      sms(place) = 87;
    case 323
      sms(place) = 88;
    case 331
      sms(place) = 89;
    case 332
      sms(place) = 90;
    case 333
      sms(place) = 127;
    otherwise
      warning('Unexpected experiment mode. No experiment mode.');
  end

end