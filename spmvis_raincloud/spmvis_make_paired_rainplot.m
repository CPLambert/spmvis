function spmvis_make_paired_rainplot(data,options)
%% spmvis_make_paired_rainplot(data,options)
% Function to make paired raincloud plots
% data is structured array in the form:
%
% data.data_01.var1 =[]; - Dataset 1, Paired measurement 1
% data.data_01.var2 =[]; - Dataset 1, Paired measurement 2
% data.data_02.var1 =[]; - Dataset 2, Paired measurement 1
% data.data_02.var2 =[]; - Dataset 2, Paired measurement 2
% data.data_03.var1 =[]; - Dataset 3, Paired measurement 1
% data.data_03.var2 =[]; - Dataset 3, Paired measurement 2
% etc.,
%
% Options that can should be specified in the form of an array if calling 
% direct from this function:
%
%           type: 'pair'
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
%          label: {'Cats','Dogs','Chickens} Note, if no label specified, will use array field name ('data_01' etc.,)
%
%__________________________________________________________________________
% Version History:
% Version 1.0, February 2024
%--------------------------------------------------------------------------
% C.Lambert - FIL @ Department of Imaging Neuroscience, UCL
%--------------------------------------------------------------------------

if ~isfield(options.handle)
    opt = spmvis_defaults('pair');
    options.handle = figure('NumberTitle', 'off');
    set(gcf,'color','w');
    set(gcf,'Position',opt.figdims);
end

thr=0.4;wdt=0.65;sc=0.5;

fx=fields(data);

for k=1:numel(fx)
    post=k*2;
    [f1,x1] = ksdensity(data.(fx{k}).var1(:));
    f1=post+(((f1./(max(f1))).*sc)+thr);
    fill(f1,x1,options.col(k,:)),hold on
    jit1 = post+(ones(size(data.(fx{k}).var1(:))).*thr.*wdt);
    scatter(jit1,data.(fx{k}).var1(:),'MarkerFaceColor',options.col(k,:),'MarkerEdgeColor','k','SizeData',25);hold on;

    [f2,x2] = ksdensity(data.(fx{k}).var2(:));
    f2=post+(((f2./(max(f2))).*-sc)-thr);
    fill(f2,x2,options.col(k,:)),hold on
    jit2 = post+(ones(size(data.(fx{k}).var2(:))).*thr.*-wdt);
    scatter(jit2,data.(fx{k}).var2(:),'MarkerFaceColor',options.col(k,:),'MarkerEdgeColor','k','SizeData',25);hold on;

    if data.(fx{k}).linkvec
        if ~isfield(data.(fx{k}),'linkwidth')
            data.(fx{k}).linkwidth=1;
        end

        if ~isfield(data.(fx{k}),'linkalpha')
            data.(fx{k}).linkalpha=0.1;
        end
        h=plot([jit1(:) jit2(:)]',[data.(fx{k}).var1(:) data.(fx{k}).var2(:)]','Color',options.col(k,:),'MarkerFaceColor',options.col(k,:),'MarkerEdgeColor','k','LineWidth',data.(fx{k}).linkwidth);
        alpha(h,data.(fx{k}).linkalpha);
    end
end
xticks([2 :2:numel(fx)*2]);
xticklabels(options.label);
ylim(options.ylimits);
if ~isempty(options.fontsize)
    set(gca,'fontsize',options.fontsize);
end
if options.save
    filename = fullfile(options.output,[options.fname]);
    print(options.handle,filename,options.ftype,options.resolution);
end
end
