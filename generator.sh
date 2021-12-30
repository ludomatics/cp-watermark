#!/bin/bash

#TODO:- force require first and second param
if [ $# -eq 0 ]; then
 echo "Please enter owner name without spaces"
 exit 1
fi

ownername="${1}" #TODO:- Trim spaces
owneremail="${2}" 
book="samples/teachers_trigonometria_template.pdf"
watermark_file="watermark02"
watermarked_book="${ownername}.pdf"
ownerfile="ownerinfo.tex"

# Create ownerfile.tex
echo "\newcommand{\name}{${ownername}}" > ${ownerfile}
echo "\newcommand{\email}{${owneremail}}" >> ${ownerfile}

# Compile PDF watermark template with latex
pdflatex ${watermark_file}
pdftk ${book} stamp ${watermark_file}.pdf output ${watermarked_book}

# Deleting $ownerfile.tex and the auxiliary files related
rm *.aux *.log
#rm ${ownerfile%.*}.*

