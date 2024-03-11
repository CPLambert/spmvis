function root = spmvis_gather_axisopt(root,subjob)
%% root = spmvis_gather_axisopt(root,subjob)
% SPM job to structured array for axis options.
%__________________________________________________________________________
% Version History:
% Version 1.0, May 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

root.xlim = [];root.ylim = [];
for i = 1:numel(subjob)
    fx = cell2mat(fields(subjob{i}));
    if strcmp(fx,'addxlim')
        root.xlim = subjob{i}.addxlim;
    elseif strcmp(fx,'addylim')
        root.ylim = subjob{i}.addylim;
    end
end
end

