function spmvis_rainplot_job(job)
%% spmvis_rainplot_job(job)
% Gather the spm job batch, generate the colour map on the fly, structure
% data for raincloud plor functions, send to function, save.
%-------------------------------------------------------------------------
% Version 1.0, March 2023, spmvis version
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

root = spmvis_gather_job(job.newrainplot);
root=spmvis_generate_cmap(root);
[data,options] = spmvis_raincloud_root2input(root);
options.handle=spmvis_call_figure(root);
spmvis_raincloud_plot(data,options)
end