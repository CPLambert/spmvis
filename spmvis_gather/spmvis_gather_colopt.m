function root = spmvis_gather_colopt(root,subjob)
%% root = spmvis_gather_colopt(root,subjob)
% SPM job to structured array for colour options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

options=spmvis_defaults;
collist=[options.colormaps.internal;options.colormaps.brewerlist];
root.usebrew = false;
for i = 1:numel(subjob)
    fx = cell2mat(fields(subjob{i}));
    if strcmp(fx,'groupcolour')
        root.colmap = cell2mat(collist(subjob{i}.groupcolour));
    else
        root.(fx)=subjob{i}.(fx);
    end
end

if contains(root.colmap,'seq') || contains(root.colmap,'div') || contains(root.colmap,'qual')
    root.usebrew=true;
end

end
