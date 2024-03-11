function figureopts= tbx_scfg_spmvis_figureopts(options,type)
%% function figureopts= tbx_scfg_smpvis_figureopts
% Specify figure property options, if type is supplied it will pre-poulate
% with best options for that particular figure.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%--------------------------------------------------------------------------

if nargin<1
options = spmvis_defaults;
end

% ---------------------------------------------------------------------
% Figure width:
% ---------------------------------------------------------------------
figx           = cfg_entry;
figx.tag       = 'figx';
figx.name      = 'Figure size: X dimension';
figx.help    = {'Set figure size - Defaults to the scaled pixel size of your screen that is best for visualising each plot'
    'If you want to output a certain paper size, change units to cm and input the size you want'
    'For reference, A4 (UK) is 21 x 29.7cm, or  2480 x 3508 pixels at 300 ppi'};
figx.strtype = 'e';
figx.val = {options.figdims(3)};
figx.num     = [1 Inf];

% ---------------------------------------------------------------------
% Figure height:
% ---------------------------------------------------------------------
figy           = cfg_entry;
figy.tag       = 'figy';
figy.name      = 'Figure size: Y dimension';
figy.help    = {'Set figure size - Defaults to the scaled pixel size of your screen that is best for visualising each plot'
    'If you want to output a certain paper size, change units to cm and input the size you want'
    'For reference, A4 (UK) is 21 x 29.7cm, or  2480 x 3508 pixels at 300 ppi'};
figy.strtype = 'e';
figy.val = {options.figdims(4)};
figy.num     = [1 Inf];

figunits             = cfg_menu;
figunits.tag         = 'figunits';
figunits.val     = {1};
figunits.name        = 'Figure dimensions: Units';
figunits.labels      = options.figunits;
figunits.values      = num2cell(1:1:numel(options.figcol));
figunits.help        = {'Select units for x and y'};

% ---------------------------------------------------------------------
% Figure resolution:
% ---------------------------------------------------------------------
figres           = cfg_entry;
figres.tag       = 'figres';
figres.name      = 'Figure Resolution (dpi)';
figres.help    = {'Set figure size - Defaults to the scaled pixel size of your screen that is best for visualising each plot'
    'If you want to output a certain paper size, change units to cm and input the size you want'
    'For reference, A4 (UK) is 21 x 29.7cm, or  2480 x 3508 pixels at 300 ppi'};
figres.strtype = 'e';
figres.val = {options.figres};
figres.num     = [1 Inf];

figcol             = cfg_menu;
figcol.tag         = 'figcol';
figcol.val     = {1};
figcol.name        = 'Figure background colour';
figcol.labels      = options.figcol;
figcol.values      = num2cell(1:1:numel(options.figcol));
figcol.help        = {'Select background figure colour'};

figoutput             = cfg_menu;
figoutput.tag         = 'figoutput';
figoutput.val     = {1};
figoutput.name        = 'Figure output filetype';
figoutput.labels      = options.figoutputlabel;
figoutput.values      = num2cell(1:1:numel(options.figoutputlabel));
figoutput.help        = {'Select background figure colour'};

% ---------------------------------------------------------------------
% Figure Title:
% ---------------------------------------------------------------------
figtitle           = cfg_entry;
figtitle.tag       = 'figtitle';
figtitle.name      = 'Figure Title';
figtitle.help    = {'Set figure title'};
figtitle.strtype = 's';
figtitle.val = {options.figtitle};
figtitle.num     = [0 Inf];

% ---------------------------------------------------------------------
% Add new variable to JSON: BIDS tabular format - Merge JSON version
% ---------------------------------------------------------------------
figureopts              = cfg_repeat;
figureopts.tag          = 'figureopts';
figureopts.name         = 'Figure options';
figureopts.values       = {figtitle,figx,figy,figunits,figres,figcol,figoutput};
figureopts.val          = {figtitle,figx,figy,figunits,figres,figcol,figoutput};
figureopts.help         = {'Set up figure options'};

end