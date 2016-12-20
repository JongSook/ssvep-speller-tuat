function [unused, weightCCA] = ssvep_checkCCA(resampleFilter, sinusoidal)

  Cov_yy = sinusoidal'*sinusoidal;
  w_x = zeros(size(resampleFilter, 3), size(resampleFilter, 2));
  weightCCA = zeros(size(resampleFilter, 3), size(y, 2));
  unused = zeros(size(resampleFilter, 3), 1);
  
  if size(resampleFilter, 1) ~= size(sinusoidal, 1)
	  error('Frame length (%d) and length of y (%d) must be match.', size(resampleFilter, 1), size(sinusoidal, 1))
  end
 
  for n = 1: size(frames, 3)
	  Cov_xx = resampleFilter(:, :, n)'*resampleFilter(:, :, n);
	  Cov_xy = resampleFilter(:, :, n)'*sinusoidal;
	  Cov_yx = sinusoidal'*resampleFilter(:, :, n);

	  [V_x D_rhosq] = eig(Cov_xx\Cov_xy/Cov_yy*Cov_yx);
	  columnOfMaxRho = diag(D_rhosq) == max(diag(D_rhosq));
	  unused(n) = sqrt(D_rhosq(columnOfMaxRho, columnOfMaxRho));
	  w_x(n, :) = V_x(:, columnOfMaxRho)';
    
	  [V_y D_rhosq] = eig(Cov_yy\Cov_yx/Cov_xx*Cov_xy);
	  columnOfMaxRho = diag(D_rhosq) == max(diag(D_rhosq));
	  weightCCA(n, :) = V_y(:, columnOfMaxRho)';
    
    r = w_x(n, :)*Cov_xy*weightCCA(n, :)'/(sqrt(w_x(n, :)*Cov_xx*w_x(n, :)')*sqrt(weightCCA(n, :)*Cov_yy*weightCCA(n, :)'));  
  end

end