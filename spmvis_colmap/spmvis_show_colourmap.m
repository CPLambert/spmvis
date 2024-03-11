function spmvis_show_colourmap(job)
%% spmvis_show_colourmap(job)
% Visualise a colour map: Useful for planning your figures
% Gathers job from spm, uses those to generate colourmap, and then patch
% Will write out a reference .jpeg
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

root = spmvis_gather_job(job);
root=spmvis_generate_cmap(root);
h = spmvis_call_figure(root);

for i = 1:root.ncols
    axis ij,hold on
    patch([0 0 1 1],[i-1 i i i-1],root.cmap(i,:));
end
ylim([0 root.ncols]);
xticks([]);
yticks(0.5:1:root.ncols);
yticklabels(1:1:root.ncols);

fout=fullfile(root.outdir,[root.filename,'.',root.figoutputlabel]);
print(h,fout,root.figoutput,root.figres);
end