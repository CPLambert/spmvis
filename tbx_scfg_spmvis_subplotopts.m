function subplotopts= tbx_scfg_spmvis_subplotopts
%% subplotopts= tbx_scfg_spmvis_subplotopts
% Add subplot options
%__________________________________________________________________________
% Version History:
% Version 1.0, April 2023
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%-------------------------------------------------------------------------

% Subplot position
% ---------------------------------------------------------------------
subplotcols           = cfg_entry;
subplotcols.tag       = 'subplotcols';
subplotcols.name      = 'Subplot columns?';
subplotcols.help    = {'Select number of columns in the subplot'};
subplotcols.strtype = 'e';
subplotcols.num     = [1 Inf];

% ---------------------------------------------------------------------
% Subplot position
% ---------------------------------------------------------------------
subplotrows           = cfg_entry;
subplotrows.tag       = 'subplotrows';
subplotrows.name      = 'Subplot rows?';
subplotrows.help    = {'Select number of rows in the subplot'};
subplotrows.strtype = 'e';
subplotrows.num     = [1 Inf];

% ---------------------------------------------------------------------
% data options
% ---------------------------------------------------------------------
subplotopts              = cfg_repeat;
subplotopts.tag          = 'subplotopts';
subplotopts.name         = 'Subplot options';
subplotopts.values       = {subplotrows subplotcols};
subplotopts.val          = {subplotrows subplotcols};
subplotopts.help         = {'Add subplot options'};

end