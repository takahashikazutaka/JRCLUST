%--------------------------------------------------------------------------
function csHelp = help_(vcCommand)
    if nargin<1, vcCommand = ''; end
    if ~isempty(vcCommand), wiki_(vcCommand); return; end

    csHelp = {...
    '';
    'Usage: jrc command arg1 arg2 ...';
    '  jrc calls the latest jrclust version (currently jrc.m)';
    '  You can also run "jrc command ..." to explicitly specify the version number.';
    '';
    '[Documentation and help]';
    '  jrc help';
    '    Display a help menu';
    '  jrc doc';
    '    Open a help document (pdf)';
    '  jrc version';
    '    Display the version number and the updated date';
    '  jrc about';
    '    Display about information';
    '  jrc which';
    '    Display the file path for the jrclust code called';
    '  jrc wiki';
    '    Open a JRCLUST Wiki on GitHub';
    '  jrc wiki-download';
    '    Download the JRCLUST Wiki on GitHub to ./wiki/';
    '  jrc issue';
    '    Post an issue at GitHub (log-in with your GitHub account)';
    '';
    '[Main commands]';
    '  jrc edit (myparam.prm)';
    '    Edit .prm file currently working on';
    '  jrc setprm myparam.prm';
    '    Select a .prm file to use';
    '  jrc clear';
    '    Clear cache';
    '  jrc clear myparam.prm';
    '    Delete previous results (files: _jrc.mat, _spkwav.jrc, _spkraw.jrc, _spkfet.jrc)';
    '  jrc spikesort myparams.prm';
    '    Run the whole suite (spike detection and clustering) ';
    '  jrc detect myparams.prm';
    '    Run spike detection and extract spike waveforms';
    '    Output files: _jrc.mat, _spkwav.jrc (filtered spike waveforms), _spkraw.jrc (raw spike waveforms), _spkfet.jrc (features)';
    '  jrc sort myparams.prm';
    '    Cluster spikes (after spike detection)';
    '    Output files: _jrc.mat';
    '  jrc auto myparams.prm';
    '    Recluster spikes after updating post-clustering paramters';
    '  jrc download sample';
    '    Download sample data from Neuropix phase 2 probe';
    '  jrc probe {myprobe.prb, myparams.prm}';
    '    Plot probe layout';
    '  jrc makeprm myrecording.bin myprobe.prb';
    '    create a new parameter file based on the default template file (default.prm) and probe file';
    '  jrc makeprm myrecording.bin myprobe.prb mytemplate.prm';
    '    create a new parameter file based on the specified template file and probe file';
    '  jrc traces myparams.prm';
    '    Displays raw trace';
    '  jrc describe myparams.prm';
    '    Display information about a clu dataset ';
    '  jrc manual myparams.prm';
    '    Run the manual clustering GUI ';
    '  jrc auto-manual myparams.prm';
    '    Run the auto clustering and do the manual clustering next';
    '  jrc plot-activity myparams.prm';
    '    Show firing rate as a function of time and depth';
    '  jrc verify myparams.prm';
    '    Compares against ground truth file (_gt.mat)';
    '  jrc drift myparams.prm';
    '    Visualize drift.';
    '  jrc plot-rd myparams.prm';
    '    Rho vs. Delta plot used in DPCLUS clustering (Rodriguez-Laio).';
    '  jrc batch myparam.batch (command)';
    '    Batch process list of prm files';
    '  jrc batch myparam.batch template.prm';
    '    Batch process list of .bin files using a template prm file';
    '';
    '[Import and export]';
    '  jrc export myparams.prm';
    '    Export the global struct (S0) to the workspace. This is also contained in _jrc.mat output file.';
    '  jrc export-csv myparams.prm';
    '    Export clustered information to a csv file (spike time, cluster #, max site#)';
    '  jrc export-quality myparams.prm';
    '    Export unit quality information to a csv file (ends with "_quality.csv")';
    '  jrc export-imec-sync myparams.prm';
    '    Export Sync channel (uint16) to the workspace (vnSync)';
    '  jrc export-wav myparams.prm';
    '    Export the entire raw traces (mnWav) to the Workpace';
    '  jrc export-spkwav myparams.prm (clu#)';
    '    Export spike waveforms organized by clusters to the Workspace';
    '  jrc export-spk myparams.prm';
    '    Export spike waveforms to the Workspace, sorted by the time of spike';
    '  jrc export-spkamp myparams.prm (clu#)';
    '    Export spike amplitudes to the Workspace';
    '  jrc export-fet myparams.prm';
    '    Export feature matrix (trFet) and sites (miFet_sites) to the Workspace';
    '  jrc export-prm myparams.prm (myparam_full.prm)';
    '    Export complete list of parameters to a new file.';
    '    If the second argument is omitted, the current parameter file is updated.';
    '    If some parameter values are missing, they will be copied from the default template file (default.prm).';
    '  jrc import-intan intanrec*.dat myprobe.prb';
    '    Import from intan recordings, which saved each channel as -A###.dat file in int16 format.';
    '    Combine .dat files to a single .bin file and saves to the directory above.';
    '    Generate .prm file by combining the .bin and .prb file names (e.g. binfile_prbfile.prm).';
    '  jrc import-nsx myrec.ns5 myprobe.prb';
    '    Imports Neuroshare format and export the analog channels to .bin file.';
    '    Generates .prm file by combining the .bin and .prb file names (e.g. binfile_prbfile.prm).';
    '';
    '[Sorting multiple recordings together]';
    '  jrc dir myparam.prm';
    '    List all recording files to be clustered together (csFile_merge)';
    '  jrc traces myparam.prm';
    '    List all recording files and select which one to display';
    '  jrc traces myparam.prm File#';
    '    Direcly specify the file number to display';
    '';
    '[Deployment]';
    '  jrc update';
    '    Update code by copying from the dropbox location (specified in user.cfg or default.cfg)';
    ' jrc git-pull';
    '    Update to the latest version from GitHub (valid only if installed by "git checkout" command)';
    ' jrc git-pull version_tag';
    '    Revert to a specific release version ("version_tag") from GitHub (valid only if installed by "git checkout" command)';
    '  jrc unit-test';
    '    Run a suite of unit teste.';
    '  jrc install';
    '    Install jrc by compiling codes';
    '  jrc compile';
    '    Recompile CUDA code (GPU codes, *.cu)';
    '';
    };
    if nargout==0, disp_cs_(csHelp); end
end %func