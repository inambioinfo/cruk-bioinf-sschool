###Get repository of the course.
git clone https://github.com/bioinformatics-core-shared-training/cruk-bioinf-sschool.git
sudo apt-get install git samtools tophat sra-toolkit pkg-config

cd cruk-bioinf-sscchool

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/HG00096/exome_alignment/HG00096.mapped.illumina.mosaik.GBR.exome.20111114.bam 22 | samtools view -bS - > Day2/HG00096.chr22.bam
samtools index Day2/HG00096.chr22.bam
rm HG00096.mapped.illumina.mosaik.GBR.exome.20111114.bam.bai

##Download required R packages. Assumes R 3.2.0
R -f installBiocPkgs.R
##Remove some files that came from git 
rm -r images javascripts stylesheets params.json index.html 



##Get example breast cancer data for the first practical and put in Practicals folder
mkdir Day1/nki
wget https://www.dropbox.com/s/82p2dcwwo3qnf21/nki.zip -P Day1/nki
cd Day1/nki
unzip nki.zip
rm nki.zip

cd ../../
cd Software

wget http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.5/bowtie2-2.2.5-linux-x86_64.zip
unzip bowtie2-2.2.5-linux-x86_64.zip

wget http://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.0.Linux_x86_64.tar.gz
gunzip tophat-2.1.0.Linux_x86_64.tar.gz
tar xvf tophat-2.1.0.Linux_x86_64.tar



#### Get and compile fastx toolkit
cd /tmp
wget https://github.com/agordon/libgtextutils/releases/download/0.7/libgtextutils-0.7.tar.gz
gunzip libgtextutils-0.7.tar.gz
tar -xvf libgtextutils-0.7.tar
cd libgtextutils-0.7
./configure
make
sudo make install
cd ../

wget http://cancan.cshl.edu/labmembers/gordon/files/fastx_toolkit-0.0.14.tar.bz2 
tar -xjf fastx_toolkit-0.0.14.tar.bz2 
cd fastx_toolkit-0.0.14
./configure
make
sudo make install

##Get latest version of bowtie and tophat


