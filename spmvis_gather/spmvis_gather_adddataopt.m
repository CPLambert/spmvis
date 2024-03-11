function root = spmvis_gather_adddataopt(root,subjob)
%% root = spmvis_gather_adddataopt(root,subjob)
% SPM job to structured array for data options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if ~isfield(root,'data')
    pos=1;
    root.data=[];
    root.data.addvar=[];
    root.data.arraylab=fullfile(['data_',num2str(pos)]);
    root.data.vec2lab=fullfile(['data_',num2str(pos)]);
    root.data.vec2col=pos;
    root.data.subplotpos=pos;
    root.data.weights=[];
    root.data.manualmean=[];
    root.data.manualstd=[];
    root.data.addstat=[];
    root.data.linkvec=[];
    root.data.linkalpha=[];
    root.data.linkweight=[];
    pos = numel(root.data);
else
    pos = numel(root.data)+1;
    root.data(pos).addvar=[];
    root.data(pos).arraylab=fullfile(['data_',num2str(pos)]);
    root.data(pos).vec2lab=fullfile(['data_',num2str(pos)]);
    root.data(pos).vec2col=pos;
    root.data(pos).subplotpos=pos;
    root.data(pos).weights=[];
    root.data(pos).manualmean=[];
    root.data(pos).manualstd=[];
    root.data(pos).addstat=[];
    root.data(pos).linkvec=[];
    root.data(pos).linkalpha=[];
    root.data(pos).linkweight=[];
end

for i = 1:numel(subjob)
    fx = cell2mat(fields(subjob{i}));
    root.data(pos).(fx)=subjob{i}.(fx);
end
end
