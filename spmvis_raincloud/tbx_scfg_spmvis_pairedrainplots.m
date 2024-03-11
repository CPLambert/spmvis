function subrainplot= tbx_scfg_spmvis_pairedrainplots
%% function subrainplot= tbx_scfg_spmvis_pairedrainplots
% Menu options for rainplots - paired-plot options
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

type='pair';
options = spmvis_defaults(type);
figureopts= tbx_scfg_spmvis_figureopts(options);
colouropts= tbx_scfg_spmvis_colourmapopts(options);
outputopts= tbx_scfg_spmvis_outputopts;
dataopts= tbx_scfg_spmvis_adddataopts(type);
axisopts= tbx_scfg_spmvis_addaxisopts;

% ---------------------------------------------------------------------
% Type of raincloud plot
% ---------------------------------------------------------------------
raintype             = cfg_menu;
raintype.tag         = 'raintype';
raintype.name        = 'Raincloud plot: Type';
raintype.labels      = {'Paired'};
raintype.values      = {'pair'};
raintype.val     = {'pair'};
raintype.help        = {'Paired raincloud plot'};

% ---------------------------------------------------------------------
% Add new variable to JSON: BIDS tabular format - Merge JSON version
% ---------------------------------------------------------------------
newrainplot              = cfg_repeat;
newrainplot.tag          = 'newrainplot';
newrainplot.name         = 'Raincloud plot options';
newrainplot.values       = {raintype outputopts figureopts colouropts axisopts dataopts};%
newrainplot.val          = {raintype outputopts figureopts colouropts axisopts dataopts}; %}raintype
newrainplot.help         = {'Multiple raincloud subplots'};

% % ---------------------------------------------------------------------
% % Main Group
% % ---------------------------------------------------------------------

subrainplot     = cfg_exbranch;
subrainplot.tag = 'subrainplot';
subrainplot.name= 'Raincloud plots: Paired-plots';
subrainplot.val = {newrainplot};
subrainplot.help= {'Put in some reference'};
subrainplot.prog= @spmvis_rainplot_job;
end

