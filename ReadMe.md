## Getting and Cleaning Data project
### Project Walkthrough

Introduction:
=============

The project contains only R script that runs the whole task of reading in, cleaning, combining the data and extracting the required data from the
input data.

Contents:
=========

1. ReadMe.md :      This file.
2. run_analysis.R : Heart of the project.
3. CodeBook.md :    Desribes all about the data, the process of cleaning and transformation and the variables of the datasets.

run_analysis.R
==============

The run_analysis.R R script assumes the input data has been downloaded on the local system and placed inside UCI HAR Dataset directory inside the
current working directory of the R system. The script automatically changes the current working directory and starts reading in the data.

The prerequisite for this script is that 'reshape2' package must be installed on the local R environment.
