function wsd = ws_distance(u_samples, v_samples, p)
% WS_DISTANCE 1- and 2- Wasserstein distance between two discrete 
% probability measures 
%   
%   wsd = WS_DISTANCE(u_samples, v_samples) returns the 1-Wasserstein 
%   distance between the discrete probability measures u and v 
%   corresponding to the sample vectors u_samples and v_samples
%
%   wsd = WS_DISTANCE(u_samples, v_samples, p) returns the p-Wasserstein 
%   distance between the discrete probability measures u and v
%   corresponding to the sample vectors u_samples and v_samples. 
%   p must be 1 or 2.
%
% from https://github.com/nklb/wasserstein-distance

if ~exist('p', 'var')
    p = 1;
end

u_samples_sorted = sort(u_samples(:));
v_samples_sorted = sort(v_samples(:));

if p == 1
    
    all_samples = unique([u_samples_sorted; v_samples_sorted], 'sorted');
    
    u_cdf = find_interval(u_samples_sorted, all_samples(1:end-1)) ...
        / numel(u_samples);
    v_cdf = find_interval(v_samples_sorted, all_samples(1:end-1)) ...
        / numel(v_samples);
    
    wsd = sum(abs(u_cdf - v_cdf) .* diff(all_samples));
    
elseif p == 2
    
    u_N = numel(u_samples);
    v_N = numel(v_samples);    
    all_prob = unique([(0:u_N) / u_N, (0:v_N) / v_N], 'sorted').';
    
    u_icdf = u_samples_sorted(fix(all_prob(1:end-1) * u_N) + 1);
    v_icdf = v_samples_sorted(fix(all_prob(1:end-1) * v_N) + 1);
    
    wsd = sqrt(sum((u_icdf-v_icdf).^2 .* diff(all_prob)));
    
else
    
    error('Only p=1 or p=2 allowed.')
    
end
end

function idx = find_interval(bounds, vals)
% Given the two sorted arrays bounds and vals, the function 
% idx = FIND_INTERVAL(bounds, vals) identifies for each vals(i) the index 
% idx(i) s.t. bounds(idx(i)) <= vals(i) < bounds(idx(i) + 1).

m = 0;
bounds = [bounds(:); inf];
idx = zeros(numel(vals), 1);

for i = 1:numel(vals)
    while bounds(m+1) <= vals(i)
        m = m + 1;
    end
    idx(i) = m;
end
end