function root = spmvis_gather_figopt(root,subjob)
%% root = spmvis_gather_figopt(root,subjob)
% SPM job to structured array for figure options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

options = spmvis_defaults;

for i = 1:numel(subjob)
    fx = cell2mat(fields(subjob{i}));

    if strcmp(fx,'figunits')
        root.figunits = cell2mat(lower(options.figunits(subjob{i}.figunits)));
    elseif strcmp(fx,'figcol')
        root.figcol = cell2mat(lower(options.figcol(subjob{i}.figcol)));
    elseif strcmp(fx,'figoutput')
        root.figoutput = cell2mat(lower(options.figoutput(subjob{i}.figoutput)));
        root.figoutputlabel = cell2mat(lower(options.figoutputlabel(subjob{i}.figoutput)));
    elseif strcmp(fx,'figres')
        root.figres = (char(strcat('-r',num2str(subjob{i}.figres))));
    else
        root.(fx)=subjob{i}.(fx);
    end
end
end

