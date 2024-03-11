function colouropts= tbx_scfg_spmvis_colourmapopts(options)
%% colouropts= tbx_scfg_spmvis_colourmapopts(options)
% Specify colourmap property options. You can define colour to variable
% when entering data if you want. You can use the test colourmap routine to
% spit out a numbered map to allow you to pick best colours for
% visualisations. Yes, colour should be spelt with a 'u'! ;-)
%
% Acknowledgements: I adapted the colorbrewer.mat file from https://github.com/scottclowe/cbrewer2.git
% (which is a port of Cynthia Brewer's ColorBrewer palettes) to serve as a lookup
% reference file. I implemented colour interpolation using inbuilt MATLAB functions.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%--------------------------------------------------------------------------

if nargin<1
options = spmvis_defaults;
end

manualcolour           = cfg_entry;
manualcolour.tag       = 'manualcolour';
manualcolour.name      = 'Manually defined colour map';
manualcolour.help    = {'Enter in nx3 colour map'};
manualcolour.strtype = 'e';
manualcolour.num     = [Inf 3];

% ---------------------------------------------------------------------
% Add data
% ---------------------------------------------------------------------
collist=[options.colormaps.internal;options.colormaps.brewerlist];

groupcolour             = cfg_menu;
groupcolour.tag         = 'groupcolour';
groupcolour.name        = 'Select colour';
groupcolour.labels      = collist;
groupcolour.values      = [num2cell(1:1:numel(collist))];
groupcolour.val     = {1};
groupcolour.help        = {'Select colourmap: These combines inbuilt MATLAB and the ColorBrewer palettes'};

% ---------------------------------------------------------------------
% Number in this group
% ---------------------------------------------------------------------
ncols           = cfg_entry;
ncols.tag       = 'ncols';
ncols.name      = 'Number of Colours?';
ncols.help    = {'Select number of colours'};
ncols.strtype = 'e';
ncols.val     = {16};
ncols.num     = [1 Inf];

% ---------------------------------------------------------------------
% Colour (spelt correctly ;-)) options
% ---------------------------------------------------------------------
colouropts              = cfg_repeat;
colouropts.tag          = 'coloropts';
colouropts.name         = 'Colour options';
colouropts.values       = {groupcolour ncols manualcolour};
colouropts.val          = {groupcolour ncols};
colouropts.help         = {'Set up figure options'};
end