#Robot Smile - documentation
==============================

This is set of components for generating documentation for Smile the robot.

Run make for documentation build.
Run make clean to delete all files generated during process.

##List of all neded software for successfull build :
--------------------------------------------------

    - pdflatex
    - inkscape
    
##List of documentation components :
----------------------------------

Components scheme -> all files are in "components_scheme" directory. Scheme is svg vector graphic file created in inkscape.

    - pdf for tex document is created by inkscape as "inkscape $(MAIN_CHEME_FILE) --export-pdf=$(MAIN_CHEME_FILE_PDF)"
    
#TODO:
======

    1. Eagle have large scripting possibilities and accepts comands from unix shell, find out how to export eagle boards and schematics as image/pdf from command line
    2. Add photos of robot and circuits
    3. Write documentation for software
