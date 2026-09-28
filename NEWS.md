# oct4 1.29.1

* Removed the Gibbs inferential replicates (`aux_info/bootstrap/`)
  from all 12 samples to reduce the package size to under 100 MB.
  `num_bootstraps` in each `aux_info/meta_info.json` was set to 0 so
  that tximport/tximeta do not look for the missing files.
