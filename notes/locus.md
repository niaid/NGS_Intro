# Locus

- [Login via ssh](#login-via-ssh)
- [Interactive session](#interactive-session)
- [Access folders](#access-folders)
- [Basic unix commands](#basic-unix-commands)
- [Batch job](#batch-job)
- [More information for the curious](#more-information-for-the-curious)

<img src="assets/img/locus_cluster_fixed.svg" width="75%">

## Login via ssh

```bash
ssh -X username@ai-submit2.niaid.nih.gov
## enter password
```

## Interactive session

```bash
qrsh -l h_vmem=16G
```

- `h_vmem` is the maximum amount of memory you will be allowed to use.  You should set this parameter based on how big the files are that you will be working with.  16 gigabytes should be sufficient for the datasets in this seminar.

## Access folders

### Mount folders to laptop

- **Mac**: in Finder, Cmd+K smb://locusfileserver.niaid.nih.gov/username
- **Windows**: \\\locusfileserver.niaid.nih.gov\username

### Access folders via sftp

- alternate way to access folders if mounting doesn't work

- [Cyberduck](https://cyberduck.io/) -> Open Connection (icon top left of the window) 
<img src="assets/img/cyberduck.png" width="75%">


## Basic unix commands

- [Cheat sheet](https://web.stanford.edu/class/physics91SI/handouts/04_UNIX_Commands.pdf); [Longer cheat sheet](http://www.mathcs.emory.edu/~valerie/courses/fall10/155/resources/unix_cheatsheet.html)

```bash
## list files in directory
ls

## get the path to your current directory
pwd

## change to another directory (replace directoryname with name of directory)
cd directoryname

## change to the directory above
cd ..

## change to your home directory
cd

## copy a file
cp file path/to/new/location
# copy a directory
cp -r directory newdirectory

## move a file
mv file path/to/new/location

## look at a file (replace filename)
less filename
## to quit less - type `q`

## get help - replace command with the command/program you need help with
man command
command -h | less

## delete files - CAUTION!  There is no recycling bin.  Files removed are gone forever. (well, technically, Locus makes backups, but only once a day)
rm file
rm -r directory
```

### Locus-specific commands

- also see batch job section below

```bash
## load module - replace modulename with the program (e.g. fastqc)
module load modulename
## unload one module
module unload modulename
## unload all modules (in case you get an error when you load one)
module purge
# default module to load - allows qsub and qrsh to run
module load uge 

## list all loaded modules
module list
## search for module versions
module avail modulename
## get info on module
module info modulename

## close your interactive session or log out of locus
exit
```


## Batch Job

- [Locus documentation](https://locus.niaid.nih.gov/userportal/documentation.php#Getting-Started/Submitting-your-First-Job)
- [job_submit.sh](../job_submit.sh)
- Submit job

```bash
qsub job_submit.sh
```

- Check on job while running

```bash
qstat -u username
qstat -j jobid
```

- Get info about job after it's done running

```
qacct -j jobid
```

## More information for the curious

[Locus website](https://locus.niaid.nih.gov) - if you don't have a Locus server account, the first time you log into the website (using your regular NIH creds), you will get an email telling you how to request an account.

[BCBB unix class materials](https://github.com/niaid/ACE/tree/master/unix) - look at pptx slides for info about the commands in the scripts

### Copy folders from Locus to Laptop via command line

```bash
## example command: replace username with your username!
scp -r username@ai-submit2.niaid.nih.gov:/classhome/username ~/Desktop

 ## basic command structure
 ## `-r` means "recursive" so we copy the folder and everything in it.
 scp -r fromfoldername tofoldername

 ## general command
 scp -r username@servername:serverfolderpath laptopfolderpath
```

