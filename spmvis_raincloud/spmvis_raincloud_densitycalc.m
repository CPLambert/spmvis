function rcdensity=spmvis_raincloud_densitycalc(data,weights)
%% function rcdensity=spmvis_raincloud_densitycalc(data,weights)
% Return density plots for either raw or weighted data
%
% rcdensity.a - y data
% rcdensity.b - x data
% rcdensity.mn - minimum data
% rcdensity.mx - max data
%__________________________________________________________________________
% Version History:
% Version 1.0, March 2023: Added for spmvis toolbox.
% Version 1.1, March 2024: GitHub release
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if ~isstruct(data)
    if isempty(weights)
        [rcdensity.a{1},rcdensity.b{1}]=ksdensity(data);
    else
        [rcdensity.a{1},rcdensity.b{1}]=ksdensity(weights);
    end
    rcdensity.a{1} = rcdensity.a{1}./max(rcdensity.a{1});%normalise to 0-1
    rcdensity.mn=min(rcdensity.b{1});rcdensity.mx=max(rcdensity.b{1});

elseif isstruct(data)
    fx=fields(data);
    for k=1:numel(fx)
        if isempty(weights)
            [rcdensity.a{k},rcdensity.b{k}]=ksdensity(data.(fx{k}));
        else
            [rcdensity.a{k},rcdensity.b{k}]=ksdensity(weights.(fx{k}));
        end
        rcdensity.a{k} = rcdensity.a{k}./max(rcdensity.a{k});%normalise to 0-1
        rcdensity.mn(k)=min(rcdensity.b{1});rcdensity.mx(k)=max(rcdensity.b{1});
    end
end
