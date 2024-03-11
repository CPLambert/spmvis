function axisopts= tbx_scfg_spmvis_addaxisopts(type)
%% dataopts= tbx_scfg_spmvis_addaxisopts
% Add Axis options
%__________________________________________________________________________
% Version History:
% Version 1.0, May 2023
%--------------------------------------------------------------------------
% C.Lambert - Wellcome Centre for Human Neuroimaging
%--------------------------------------------------------------------------

if nargin<1
    type=[];
end

% ---------------------------------------------------------------------
% Add xlim
% ---------------------------------------------------------------------
addxlim           = cfg_entry;
addxlim.tag       = 'addxlim';
addxlim.name      = 'Add x axis limits';
addxlim.help    = {'Add x axis limits - Note by default this will adopt the min and max'};
addxlim.strtype = 'e';
addxlim.num     = [1 2];

% ---------------------------------------------------------------------
% Add ylim
% ---------------------------------------------------------------------
if strcmp(type,'horizontal')
addylim           = cfg_entry;
addylim.tag       = 'addylim';
addylim.name      = 'Add y axis limits';
addylim.help    = {'Add y axis limits'};
addylim.strtype = 'e';
addylim.val     = {[0 1.1]};
addylim.num     = [1 2];
else
addylim           = cfg_entry;
addylim.tag       = 'addylim';
addylim.name      = 'Add y axis limits';
addylim.help    = {'Add y axis limits'};
addylim.strtype = 'e';
addylim.val     = {[-2 1.1]};
addylim.num     = [1 2];
end
 


% ---------------------------------------------------------------------
% data options
% ---------------------------------------------------------------------
axisopts              = cfg_repeat;
axisopts.tag          = 'axisopts';
axisopts.name         = 'Add axis options';
axisopts.values       = {addylim addxlim};
axisopts.val          = {addylim};
axisopts.help         = {'Add axis options'};
end