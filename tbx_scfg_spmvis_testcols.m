function testcol = tbx_scfg_spmvis_testcols
%% testcol = tbx_scfg_spmvis_testcols
% Test out a colour map - Will generate a jpeg to help select
% colour-variable mapping
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Department of Imaging Neuroscience, UCL.
%--------------------------------------------------------------------------
options = spmvis_defaults('testcol');
figureopts= tbx_scfg_spmvis_figureopts(options);
colouropts= tbx_scfg_spmvis_colourmapopts(options);
outputopts= tbx_scfg_spmvis_outputopts;

% % ---------------------------------------------------------------------
% % Main Group
% % ---------------------------------------------------------------------

testcol     = cfg_exbranch;
testcol.tag = 'testcol';
testcol.name= 'Test colour palatte';
testcol.val = {outputopts colouropts figureopts};
testcol.help= {'Print out colourmap palatte jpeg'};
testcol.prog= @spmvis_show_colourmap;
end
