#!/bin/bash

if [ $# -ne 2 ]; then
 echo "Please enter correct number of arguments"
 echo "1st arg: Client NAME withoutspaces"
 echo "2nd arg: Client EMAIL withoutspaces"
 exit 1
fi

ownername="${1}"
owneremail="${2}" 
book="samples/teachers_trigonometria_template.pdf"

watermark_file="watermark"
watermarked_book="${ownername}.pdf"
ownerfile="ownerinfo.tex"

# Create ownerfile.tex
echo "\newcommand{\name}{${ownername}}" > ${ownerfile}
echo "\newcommand{\email}{${owneremail}}" >> ${ownerfile}

# Compile PDF watermark template with latex
pdflatex ${watermark_file} && \
pdftk ${book} stamp ${watermark_file}.pdf output ${watermarked_book}

# Deleting auxiliary files
rm *.aux *.log