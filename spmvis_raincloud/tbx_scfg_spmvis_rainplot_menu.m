function rainplot= tbx_scfg_spmvis_rainplot_menu
%% rainplot= tbx_scfg_spmvis_rainplot_menu
% Create SPM menu for rainplots
%--------------------------------------------------------------------------
% Version 1.0, March 2023, spmvis construct
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------
subrainplot= tbx_scfg_spmvis_subrainplots;
pairedrainplot= tbx_scfg_spmvis_pairedrainplots;

rainplot     = cfg_choice;
rainplot.tag = 'addrainplot';
rainplot.name= 'Raincloud plots';
rainplot.values = {subrainplot,pairedrainplot};
%addrainplot.help= {'Put in some reference'};
end
