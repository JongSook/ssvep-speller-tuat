function x = inputCheck(displayStr, valid)

if mod(valid(1), 1)
	validStr = sprintf('%2.1f', valid(1));
else
	validStr = num2str(valid(1));
end
	
if length(valid) < 25
	for i = valid(2:length(valid))
		if mod(i, 1)
			validStr = [validStr '/' sprintf('%2.1f', i)];
		else
			validStr = [validStr '/' sprintf('%d', i)];
		end
	end
else
	if mod(valid(end), 1)
		validStr = [validStr '--' sprintf('%2.1f', valid(end))];
	else
		validStr = [validStr '--' sprintf('%d', valid(end))];
	end
end

ok = 0;
while ok == 0
	y = input([displayStr ' (' validStr ')\n']);

	for i = valid
		if abs(y - i) < 0.05
			x = i;
			ok = 1;
		end
	end
end

end