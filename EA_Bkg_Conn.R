
glob2rx("_01*")
glob2rx("_01_glm_vid_1stlevel_residuals.nii.gz+warp+tlrc.BRIK.csv")


# start here
library(psych)
library(reshape)
library(multcomp)
library(ggplot2)
library(Hmisc)
library(plyr)


# set working dir
setwd("/archive/data-2.0/SPINS/pipelines/fmri/ea")

# find filtered ea files for conn
file_list_ea_filter <- list.files(path= ".", recursive=TRUE, full.names=TRUE, pattern="^SPN01.*_filtered\\.nii\\.gz$")

# get rid of phantom data, ZHH_0060, and ZHP_9999 (2 resting state scans on ZHH and one also on ZHP, so just keeping latter)
file_list_ea_filter <- Filter(function(x) !any(grepl("^.*_P", x)), file_list_ea_filter)
file_list_ea_filter <- Filter(function(x) !any(grepl("^.*_ZHH_0060", x)), file_list_ea_filter)
file_list_ea_filter <- Filter(function(x) !any(grepl("^.*_ZHP_9999", x)), file_list_ea_filter)

write.table(file_list_ea_filter,file="/scratch/loliver/Connectivity/ea_bkg/file_list_ea_filter.csv",row.names = F,col.names = F)

