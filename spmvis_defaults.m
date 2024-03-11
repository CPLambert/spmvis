function options = spmvis_defaults(type)
%% options = spmvis_defaults(type)
% Some default labels/values for toolbox
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
% Version 1.1, March 2024, Github release of Rainplots only
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if nargin<1
    type=[];
end

%% Figure properties
dz=get(0, 'ScreenSize');
options.figtitle = 'Plot';
options.figdims=[10 10 round(dz(3)/3) round(dz(4)/1.15)];
options.figunits = {'pixels','centimeters','inches'};
options.figcol={'white','black','none'};
options.figres=300;
options.figout='jpeg';
options.figoutputlabel = {'JPEG','PNG','TIFF'};
options.figoutput = {'-djpeg','-dpng','-dtiff'};

%% Colour maps
options.colormaps.internal={'turbo'
    'jet'
    'gray'
    'bone'
    'hot'
    'cool'
    'winter'
    'spring'
    'summer'
    'autumn'
    'parula'};

[aa,~,~] = fileparts(which('tbx_cfg_spmvis'));
options.colormaps.brewer = fullfile(aa,'spmvis_colmap','spmvis_brewer_lookup.mat');

options.colormaps.brewerlist = {'seq_Blues'
    'seq_BuGn'
    'seq_BuPu'
    'seq_GnBu'
    'seq_Greens'
    'seq_Greys'
    'seq_Oranges'
    'seq_OrRd'
    'seq_PuBu'
    'seq_PuBuGn'
    'seq_PuRd'
    'seq_Purples'
    'seq_RdPu'
    'seq_Reds'
    'seq_YlGn'
    'seq_YlGnBu'
    'seq_YlOrBr'
    'seq_YlOrRd'
    'qual_Accent'
    'qual_Dark2'
    'qual_Paired'
    'qual_Pastel1'
    'qual_Pastel2'
    'qual_Set1'
    'qual_Set2'
    'qual_Set3'
    'div_BrBG'
    'div_PiYG'
    'div_PRGn'
    'div_PuOr'
    'div_RdBu'
    'div_RdGy'
    'div_RdYlBu'
    'div_RdYlGn'
    'div_Spectral'};

options.figopts = {'figtitle'
    'figx'
    'figy'
    'figunits'
    'figres'
    'figcol'
    'figoutput'
    'figoutputftype'};

%% Plot subtype settings
if strcmp(type,'subrain')
    options.figtitle = 'Density-scatter Plot';
elseif strcmp(type,'pair')
    options.figtitle = 'Paired Density-scatter Plot';
    options.figdims=[10 10 round(dz(3)/1.5) round(dz(4)/1.15)]; %Greater width for 1xN plot
end
end


