function outputopts= tbx_scfg_spmvis_outputopts
%% outputopts= tbx_scfg_spmvis_outputopts
% Specify output options.
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%--------------------------------------------------------------------------

%% GENERIC: SAVE DATA
% ---------------------------------------------------------------------
% Enter filename
% ---------------------------------------------------------------------
filename                 = cfg_entry;
filename.tag             = 'filename';
filename.name            = 'Output filename';
filename.help            = {'Define filename. If this is JSON file it should be the same as the corresponding tsv table'};
filename.strtype         = 's';
filename.val             = {''};
filename.num             = [0 Inf];

% ---------------------------------------------------------------------
% Select output directory
% ---------------------------------------------------------------------
outdir              = cfg_files;
outdir.tag          = 'outdir';
outdir.name         = 'Output directory';
outdir.help         = {'Select output dirctory'};
outdir.filter       = 'dir';
outdir.ufilter      = '.*';
outdir.num          = [1 1];

% ---------------------------------------------------------------------
% Colour (spelt correctly ;-)) options
% ---------------------------------------------------------------------
outputopts              = cfg_repeat;
outputopts.tag          = 'outputopts';
outputopts.name         = 'Output options';
outputopts.values       = {filename,outdir};
outputopts.val          = {filename,outdir};
outputopts.help         = {'Set up figure options'};
end