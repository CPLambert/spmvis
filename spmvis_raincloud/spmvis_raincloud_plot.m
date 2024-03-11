function spmvis_raincloud_plot(data,options,weights,manualmean,manualstd)
%% function spmvis_raincloud_plot(data,options)
% A more elaborate version, based on:
%
% Allen M, Poggiali D, Whitaker K et al. Raincloud plots: a multi-platform
% tool for robust data visualization [version 2; peer review: 2 approved].
% Wellcome Open Res 2021, 4:63 (https://doi.org/10.12688/wellcomeopenres.15191.2)
%
% Options that can be specified:
% label: {X-axis data label cell}
%        subplot: false (0) or true (1) to do subplots
%           type: 'rain' or 'horizontal' or 'paired' or 'overlap'
%          title: 'Density-scatter Plot'
%          width: 0.75
%       position: -0.50
%        xlimits: [-0.46 1.46] (min max of data by default)
%        ylimits: [-2.00 1.10]
%            col: [0 1.00 1.00] (input color)
%         output: '/Users/clambert/Dropbox/02_LAMBERT_MATLAB_FUNCTIONS/05_MY_GITHUB/01_QMAPLAB_MATLAB_SNIPPITS/00_TRAINING/01_BASICS'
%          fname: 'Raincloud_plot-20213005T19:19' (Filename)
%     resolution: '-r300' (resolution)
%          ftype: '-djpeg' (filetype)
%           save: true (1) or false(0) % Save the data to jpg
%
% Basically this high level function calls:
%
% spmvis_raincloud_densitycalc - Caculate a density array based on input
% spmvis_raincloud_plot_default - Call defaults (from spmvis_raincloud_options and populate with user and densitycalc data)
% spmvis_make_rainplot - Make the raincloud plot
%__________________________________________________________________________
% Version History:
% Version 1.0, May 2021
% Version 1.1, March 2023: Moved to spmvis toolbox. Added following plot options:
% - rain (default, normal raincloud plot)
% - paired (violin-plot)
% - horizontal (?"railway")
% - overlap (%multiple density plots on the same axis)
% Version 1.2, March 2024: GitHub release
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if nargin<5
    manualstd=[];
    if nargin<4
        manualmean = [];
        if nargin<3
            weights=[];
            if nargin<2
                options=[];
            end
        end
    end
end

%Note wdata removed ?duplication?? (probably replaced with weights?)

if strcmp(options.type,'pair')
    spmvis_make_paired_rainplot(data,options);
else

if ~strcmp(options.type,'pair') %Paired plots is a special case to be handled differently
rcdensity=spmvis_raincloud_densitycalc(data,weights);
[options]=spmvis_raincloud_plot_default(options,rcdensity);
end

if ~isempty(manualmean),options.manualmean = true;end
if ~isempty(manualstd),options.manualstd = true;end

%Start
if ~isstruct(data)
    spmvis_make_rainplot(data,rcdensity,options,1,weights);

elseif isstruct(data)
    fx=fields(data);
    if ~isempty(weights)
        for k=1:numel(fx)
            if options.manualmean
                mm=manualmean(k);
            else
                mm=[];
            end
            if options.manualstd
                ms = (manualstd(k));
            else
                ms=[];
            end
            spmvis_make_rainplot(data.(fx{k}),rcdensity,options,k,weights.(fx{k}),mm,ms);
        end
    else
        for k=1:numel(fx)
            if options.manualmean
                mm=manualmean(k);
            else
                mm=[];
            end
            if options.manualstd
                ms = (manualstd(k));
            else
                ms=[];
            end
            spmvis_make_rainplot(data.(fx{k}),rcdensity,options,k,[],mm,ms); %I used to have wd - weight data, but can't remember where it entered. I think it got replaced by weights.
        end
    end
end
if options.save
    filename            = fullfile(options.output,[options.fname]);
    print(options.handle,filename,options.ftype,options.resolution);
end
end
end



