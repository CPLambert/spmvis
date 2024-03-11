function spmvis_make_rainplot(data,rcdensity,options,k,weights,mm,ms)
%% function spmvis_make_rainplot(data,rcdensity,options,k,weights,mm,ms)
% This creates raincloud plots - It is a more elaborate form of Allan et
% al., 2021 "Raincloud plots: a multi-platform tool for robust data
% visualization", wrapped up into a SPM toolbox.
%__________________________________________________________________________
% Version History:
% Version 1.0, February 2024 (GitHub release version)
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

data(isnan(data)) = [];

if k==1
    figure('NumberTitle', 'off', 'Name', options.title);set(gcf,'color','w');
    set(gcf,'Position',options.figdims);
end

if ~strcmp(options.type,'overlap')
    if options.subplot
        h1=subplot(options.subplotset(1),options.subplotset(2),options.subplotorder(k));
    end
end

if ~isempty(options.label)
    if numel(options.label)==1
        label=options.label;
    else
        label=options.label{k};
    end
else
    label='';
end

if iscell(label),label=cell2mat(label);end

if contains(label,'_')
    dash=strfind(label,'_');
    label(dash)=32;
end

if strcmp(options.type,'horizontal')
    h1=subplot(options.subplotset(1),options.subplotset(2),options.subplotorder((k*2)-1));
    options.ylimits = [0 1.1];
end

area(rcdensity.b{k},rcdensity.a{k},'FaceColor', options.col(k,:), 'EdgeColor', [0.1 0.1 0.1], 'LineWidth', 2);hold on;
ylim([options.ylimits]);xlim([options.xlimits]);

if strcmp(options.type,'horizontal')
    xlabel(label);
end

if ~isempty(options.xticks)
    xticks([options.xticks]);
end

if ~isempty(options.xticklabels)
    xticklabels(options.xticklabels);
end

if strcmp(options.type,'horizontal')
    h1=subplot(options.subplotset(1),options.subplotset(2),options.subplotorder((k*2)));
    options.ylimits = [0 1];
    options.position = 0.5;
end

if strcmp(options.type,'overlap')
    options.position = options.position - k;
    options.ylimits = [(options.position-1) 1];
    hold on
end

% jitter for scatter plot
jit         = (rand(size(data)) - 0.5) * options.width;

% Add scatter plot
if isempty(weights)
    scatter(data,jit + options.position,'MarkerFaceColor',options.col(k,:),'MarkerEdgeColor','k','SizeData',20);hold on;
else
    sf=(ceil(weights))+5;
    for iii=1:numel(jit)
        scatter(data(iii),jit(iii) + options.position,'MarkerFaceColor',options.col(k,:),'MarkerEdgeColor','k','SizeData',sf(iii));hold on;
    end
end

% info for making boxplot in paper: Quartiles, mean, 2*sd
if isempty(mm)
    Y           = [quantile(data,[0.25 0.75]) mean(data) mean(data)-2*(std(data)) mean(data)+2*(std((data)))];
    rectangle('Position',[Y(1) options.position-(options.width*0.5) Y(2)-Y(1) options.width],'EdgeColor','k','LineWidth',2);hold on
    % Add std:
    line([Y(2) Y(5)],[options.position options.position],'col','k','LineWidth',2);hold on
    line([Y(1) Y(4)],[options.position options.position],'col','k','LineWidth',2);hold on

else %Manually define - For weighted means and pooled variancesa
    Y           = [prctile(data,[25 75]) mm mm-2*(ms) mm+2*(ms)];
    rectangle('Position',[Y(4) options.position-(options.width*0.5) Y(5)-Y(4) options.width],'EdgeColor','k','LineWidth',2);hold on

end

% Add mean:
line([Y(3) Y(3)],[options.position-0.4 options.position+0.4],'col','k','LineWidth',2);hold on

% Tidy up axis
if options.subplot && ~strcmp(options.type,'overlap')
    set(gca,'ytick',[]);set(gca,'yticklabel',[]);
    if ~strcmp(options.type,'horizontal') %Aesthetics
        xlabel(h1,label);
    end
else
    set(gca,'ytick',[]);set(gca,'yticklabel',[]);xlabel({label});
end

if ~isempty(options.fontsize)
    set(gca,'fontsize',options.fontsize);
end

ylim([options.ylimits]);xlim([options.xlimits]);
end