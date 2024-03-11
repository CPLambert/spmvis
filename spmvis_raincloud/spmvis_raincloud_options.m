function options=spmvis_raincloud_options
%% function options=spmvis_raincloud_options
% Create an array of options for raincloud plots. This will be populated in
% the spmvis_raincloud_plot_default function (as some of the options are
% dependent on how the data is supplied). For reference, full list of possible
% options are:
%
% options.type = [];      %Type of plot from 'rain', 'horizontal', 'paired'
% options.title = [];     %Figure title
% options.label = [];     %Labels of each subplot
% options.subplot = [];   %Logical - Subplots?
% options.subplotset = [];%Configuration of subplot
% options.subplotorder =[];%Ordering of subplot
% options.width = [];     %Width of scatter
% options.position = [];  %Position of scatter
% options.xlimits = [];   %X axis limits
% options.ylimits = [];   %Y axis limits
% options.xticks = [];    %X tick data
% options.xticklabels = [];%Cell array of X tick labels
% options.col = [];       %Colors (3xn)
% options.output = [];    %Output directory path
% options.fname = [];     %Output filename
% options.figdims = [];   %Figure dimensions
% options.fontsize = [];  %Fontsize
% options.resolution = [];%Output resolution
% options.ftype = [];     %Type of image to save
% options.save = [];      %Logical - save the data?
% options.manualmean = [];%Logical - use manually defined mean?
% options.manualstd = []; %Logical - save manually defined std/var?
%
%__________________________________________________________________________
% Version History:
% Version 1.0, March 2023: Added for spmvis toolbox.
% Version 1.1, March 2024: GitHub release
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

options.type = [];      %Type of plot from 'rain', 'horizontal', 'paired'
options.title = [];     %Figure title
options.label = [];     %Labels of each subplot
options.subplot = [];   %Logical - Subplots?
options.subplotset = [];%Configuration of subplot
options.subplotorder =[];%Ordering of subplot
options.width = [];     %Width of scatter
options.position = [];  %Position of scatter
options.xlimits = [];   %X axis limits
options.ylimits = [];   %Y axis limits
options.xticks = [];    %Logical - X tick data?
options.xticklabels = [];%Cell array of X tick labels
options.col = [];       %Colors (3xn)
options.output = [];    %Output directory path
options.fname = [];     %Output filename
options.figdims = [];   %Figure dimensions
options.fontsize = [];  %Fontsize
options.resolution = [];%Output resolution
options.ftype = [];     %Type of image to save
options.save = [];      %Logical - save the data?
options.manualmean = [];%Logical - use manually defined mean?
options.manualstd = []; %Logical - save manually defined std/var?
options.addstat = [];
end

