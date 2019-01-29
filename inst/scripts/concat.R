tab <- read.delim("SraRunTable.txt", strings=FALSE)
y <- split(tab$Run, tab$Experiment) # split into list
for (i in seq_along(y)) { system(paste0("cat ",paste0(paste0(y[[i]],"_1.fastq"), collapse=" ")," > ",names(y)[i],"_1.fastq")) } # read 1
for (i in seq_along(y)) { system(paste0("cat ",paste0(paste0(y[[i]],"_2.fastq"), collapse=" ")," > ",names(y)[i],"_2.fastq")) } # read 2
