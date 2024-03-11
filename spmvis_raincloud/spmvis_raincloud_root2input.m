function [data,options] = spmvis_raincloud_root2input(root)
%% function [data,options] = spmvis_raincloud_root2input(root)
% Simple wrapper - Takes the SPM menu input and re-structures it into data
% and options variables for the raincloud plot functions
%__________________________________________________________________________
% Version History:
% Version 1.0, March 2023: Added for spmvis toolbox.
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

options = spmvis_raincloud_options;
options.save = true;
options.type = root.type;
options.title = root.figtitle;
options.col = root.cmap;
options.figdims = [10 10 root.figx root.figy];
options.output = root.outdir;
options.fname = root.filename;
options.resolution = root.figres;
options.ftype = root.figoutput;
options.xlimits = root.xlim;
options.ylimits = root.ylim;
options.fontsize=14;

if strcmp(options.type,'vertical') || strcmp(options.type,'horizontal')
    options.subplot = true;
    options.subplotset = [root.subplotrows root.subplotcols];
    options.subplotorder = [root.data.subplotpos]';
else
    options.subplot = false;
end

data = [];

for i = 1:numel(root.data)
    if ~strcmp(root.type,'pair')
        data.(root.data(i).arraylab) = root.data(i).addvar;
        options.label{1,i} = root.data(i).vec2lab;
    else
        data.(root.data(i).arraylab).var1 = root.data(i).addvar1;
        data.(root.data(i).arraylab).var2 = root.data(i).addvar2;
        data.(root.data(i).arraylab).linkvec = root.data(i).linkvec;
        data.(root.data(i).arraylab).linkalpha = root.data(i).linkalpha;
        data.(root.data(i).arraylab).linkweight = root.data(i).linkweight;
        options.label{1,i} = root.data(i).vec2lab;
    end
end

%Re-order colour
[~,bb] = sort([root.data.vec2col],'ascend');
options.col(bb(:),:);

end


