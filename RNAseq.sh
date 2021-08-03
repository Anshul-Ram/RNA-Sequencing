# Moving into the directory where the data is.

cd /home/nigeldyer/MarkChristian/X204SC21050140-Z02-F003_1/raw_data

# increasing the number of threads, check this command again.
-p 8

for i in $(ls)
do
	
	
	# Avoiding the 'readme' file within the data.

	if [[  “$i” = “Rawdata_Readme.pdf” ]]
	then
		echo “nope.”
	else
		# Running hisat2, to compare the RNA sequences with the Mouse genomes.

		hisat2 -x /home/anshulram/RNAseq/reference/grcm38_tran/genome_tran -1 /home/nigeldyer/MarkChristian/X204SC21050140-Z02-F003_1/raw_data/"$i"/"$i"_1.fq.gz -2 /home/nigeldyer/MarkChristian/X204SC21050140-Z02-F003_1/raw_data/"$I"/"$i"_2.fq.gz -S /home/anshulram/RNAseq/workplace/2_aligned/"$i".sam
	fi

	# Converting the sam files to bam files.
	# The bam files can be viewed and processed further.

	samtools view -S -b "$i".sam > "$i".bam
done