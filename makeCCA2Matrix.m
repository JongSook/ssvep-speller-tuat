  function E = makeCCA2Matrix(numOfFreqs,order) % (length(flickerFreqs),ccaOrder) 6 2

E = zeros(numOfFreqs*2*order, numOfFreqs);

for ii=1:2*order
	E(ii:2*order:end, :) = eye(numOfFreqs);

end

end