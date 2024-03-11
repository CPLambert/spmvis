function root=spmvis_generate_cmap(root)
%% root=spmvis_generate_cmap(root)
% Generate an n x 3 colourmap as defined by the root.ncols and root.colmap
% options. If Brewer palatte will load this and select. If ncols>brewcols
% then will linear interpolate to ncols using max brewcols
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

options = spmvis_defaults;

if isfield(root,'data')
if root.ncols < numel(root.data)
root.ncols = numel(root.data);
end
end
if ~root.usebrew
    root.cmap=eval(fullfile([root.colmap,'(',num2str(root.ncols),')']));
else
    bmap=load(options.colormaps.brewer);
    if numel(bmap.lookup.(root.colmap))>=root.ncols
        root.cmap = bmap.lookup.(root.colmap)./256;
    else
        tmp =  bmap.lookup.(root.colmap){end}; %Take the last one
        P = size(tmp,1);
        root.cmap = (interp1(1:size(tmp,1), tmp, linspace(1,P,root.ncols), 'linear'))./256;
    end
end
end