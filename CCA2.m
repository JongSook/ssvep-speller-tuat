 function [rho w_y] = CCA2(frames, y)

% tic
% fprintf('CCA... ')
 
if size(frames, 1) ~= size(y, 1)
	error('Frame length (%d) and length of y (%d) must be match.', size(frames, 1), size(y, 1))
end

Cov_yy = y'*y;

w_x = zeros(size(frames, 3), size(frames, 2));
w_y = zeros(size(frames, 3), size(y, 2));
rho = zeros(size(frames, 3), 1);
 
for n = 1:size(frames, 3)
	Cov_xx = frames(:, :, n)'*frames(:, :, n);
	Cov_xy = frames(:, :, n)'*y;
	Cov_yx = y'*frames(:, :, n);

	[V_x D_rhosq] = eig(Cov_xx\Cov_xy/Cov_yy*Cov_yx)
	columnOfMaxRho = diag(D_rhosq) == max(diag(D_rhosq));
	rho(n) = sqrt(D_rhosq(columnOfMaxRho, columnOfMaxRho))
	w_x(n, :) = V_x(:, columnOfMaxRho)';
    

	[V_y D_rhosq] = eig(Cov_yy\Cov_yx/Cov_xx*Cov_xy)
	columnOfMaxRho = diag(D_rhosq) == max(diag(D_rhosq));
	w_y(n, :) = V_y(:, columnOfMaxRho)';
    
    r = w_x(n, :)*Cov_xy*w_y(n,:)'/(sqrt(w_x(n, :)*Cov_xx*w_x(n,:)')*sqrt(w_y(n, :)*Cov_yy*w_y(n,:)'))
end
% elapsedTime = toc;
% fprintf('%3.2f sec\n', elapsedTime)

end