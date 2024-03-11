function root = spmvis_gather_job(subjob)
%% root = spmvis_gather_job(job)
% SPM job to structured array for visualisation toolbox. Contains
% sub-routines for the different user defined options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

root = [];

if iscell(subjob)
for i  = 1:numel(subjob)
fx = cell2mat(fields(subjob{i}));
    if strcmp(fx,'raintype')
        root.type = subjob{i}.raintype;
    elseif strcmp(fx,'outputopts')
        root = spmvis_gather_outputopt(root,subjob{i}.outputopts);
    elseif strcmp(fx,'figureopts')
        root = spmvis_gather_figopt(root,subjob{i}.figureopts);
    elseif strcmp(fx,'coloropts')
        root = spmvis_gather_colopt(root,subjob{i}.coloropts);
     elseif strcmp(fx,'subplotopts')
        root = spmvis_gather_subplotopt(root,subjob{i}.subplotopts);
     elseif strcmp(fx,'dataopts')
        root = spmvis_gather_adddataopt(root,subjob{i}.dataopts);
          elseif strcmp(fx,'axisopts')
        root = spmvis_gather_axisopt(root,subjob{i}.axisopts);
    end
end
elseif isstruct(subjob)
    
fx = fields(subjob);
for i  = 1:numel(fx)
    if strcmp(fx{i},'raintype')
        root.type = subjob.raintype;
    elseif strcmp(fx{i},'outputopts')
        root = spmvis_gather_outputopt(root,subjob.outputopts);
    elseif strcmp(fx{i},'figureopts')
        root = spmvis_gather_figopt(root,subjob.figureopts);
    elseif strcmp(fx{i},'coloropts')
        root = spmvis_gather_colopt(root,subjob.coloropts);
     elseif strcmp(fx{i},'subplotopts')
        root = spmvis_gather_subplotopt(root,subjob.subplotopts);
     elseif strcmp(fx{i},'dataopts')
        root = spmvis_gather_adddataopt(root,subjob.dataopts);
         elseif strcmp(fx,'axisopts')
        root = spmvis_gather_axisopt(root,subjob.axisopts);
    end
end
end
end

