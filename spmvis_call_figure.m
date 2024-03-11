function h = spmvis_call_figure(root)
%% spmvis_call_figure(type,opts)
% Call a figure, optimised for the plot
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if nargin<1
options = spmvis_defaults;
h = figure('NumberTitle', 'off');
set(gcf,'color','w');
set(gcf,'Position',options.figdims);
else
  h = figure('NumberTitle', 'off','Name',root.figtitle,'Units',root.figunits,'Color',root.figcol,'Position',[10 10 root.figx root.figy]);
end

% if strcmp(type,'river')
% axis ij;axis off;hold on
% end
end