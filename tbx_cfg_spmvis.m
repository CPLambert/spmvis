function spmvis = tbx_cfg_spmvis
%% spmvis = tbx_cfg_spmvis
% Data Visualisation Toolbox
% This essentially forms a wrapper for some nice techniques to visualise
% different forms of data (that are normally a bit of a pain to use)
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if ~isdeployed
    addpath(fullfile(spm('Dir'),'toolbox','spmvis'));
end

%% MAIN SPM MENU: BIDS TOOLBOX
rainplot=tbx_scfg_spmvis_rainplot_menu;
testcol = tbx_scfg_spmvis_testcols;

spmvis                 = cfg_choice;
spmvis.tag             = 'spmvis';
spmvis.name            = 'Data Visualisation Toolbox';
spmvis.values          = {testcol,rainplot};
end