function root = spmvis_gather_outputopt(root,subjob)
%% root = spmvis_gather_outputopt(root,subjob)
% SPM job to structured array for output options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

for i = 1:numel(subjob)
    fx = cell2mat(fields(subjob{i}));
    root.(fx)=subjob{i}.(fx);
    if iscell(root.(fx))
       root.(fx)=cell2mat(root.(fx));
    end
end
end
