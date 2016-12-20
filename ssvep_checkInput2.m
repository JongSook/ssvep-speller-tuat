function value = ssvep_checkInput2(sentence, total)
  
  pass = 0;
  
  if mod(total(1), 1)
	  totalStr = num2str(sprintf('%2.1f', total(1)));
  else
	  totalStr = num2str(total(1));
  end
	
  if length(total) < 15
	  for whole = total(2:length(total))
		  if mod(whole, 1)
			  totalStr = [totalStr '/' sprintf('%2.1f', whole)];
      else
			  totalStr = [totalStr '/' sprintf('%d', whole)];
      end
    end
  else
	  if mod(total(end), 1)
		  totalStr = [totalStr '--' sprintf('%2.1f', total(end))];
    else
		  totalStr = [totalStr '--' sprintf('%d', total(end))];
    end
  end
 
  while pass == 0
	  lineSent = input([sentence ' (' totalStr ')\n']);
	  for final = total
		  if abs(lineSent - final) < 0.05
			  value = final;
			  pass = 1;
      end
    end
  end

end