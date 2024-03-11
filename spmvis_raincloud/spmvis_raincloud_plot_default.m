function [options]=spmvis_raincloud_plot_default(opt,rcdensity)
%% function [options]=spmvis_raincloud_plot_default(opt)
% Populate the options array with pre-specified user options (opt) and data
% from precalculated data densities rcdensity (output from
% spmvis_raincloud_densitycalc)
%__________________________________________________________________________
% Version History:
% Version 1.0, March 2023: Added for spmvis toolbox.
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%--------------------------------------------------------------------------
%% Fill out any manual options into array
if isempty(opt)
    options=spmvis_raincloud_options;
else
    options=spmvis_raincloud_options;
    fx = fields(opt);
    for i = 1:numel(fx)
        options.(fx{i}) = opt.(fx{i});
    end
end

%% Setting the rest of the defaults:
if isempty(options.title)
    options.title='Raincloud Plot';
end

if isempty(options.type)
    options.type='rain';
end

if isempty(options.width)
    options.width=0.75;
end

if isempty(options.position)
    options.position=-0.5;
end

if isempty(options.xlimits)
    options.xlimits=[min(rcdensity.mn) max(rcdensity.mx)];
end

if isempty(options.ylimits)
    options.ylimits=[-2 1.1];
end

if isempty(options.col)
    options.col=jet(numel(rcdensity.a));
end

if isempty(options.xticks)
    options.xticks=[];
end

if isempty(options.manualmean)
    options.manualmean=false;
end

if isempty(options.manualstd)
    options.manualstd=false;
end

if isempty(options.xticklabels)
    options.xticklabels=[];
end

if isempty(options.fontsize)
    options.fontsize=14;
end

if isempty(options.subplot)

if numel(numel(rcdensity.a)>1)
    options.subplot = true;
else 
    options.subplot = false;
end
end

if options.subplot
    if isempty(options.subplotset)
        options.subplotset=[numel(rcdensity.a),1];
    end

    if isempty(options.subplotorder)
        options.subplotorder=[1:1:numel(rcdensity.a)];
    end
end

if isempty(options.output)
    TIW=what;
    options.output=TIW.path;
end

if isempty(options.fname)
    options.fname=fullfile(['Raincloud_plot-',datestr(now,'yyyyddmmTHH:MM')]);
end

if isempty(options.resolution)
    options.resolution='-r300';
end

if isempty(options.ftype)
    options.ftype='-djpeg';
end

if isempty(options.save)
    options.save=true;
end

if isempty(options.figdims)
    dz=get(0, 'ScreenSize');
    options.figdims=[10 10 round(dz(3)/3) round(dz(4)/1.15)];
end

if strcmp(options.type,'horizontal')
    options.subplotset=[numel(rcdensity.a),2];
    options.subplotorder=[1:1:numel(rcdensity.a)*2];
end

end