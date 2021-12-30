#!/bin/bash

mkdir -p .build

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

# Create ownerfile.tex
echo "\newcommand{\name}{${ownername}}" > ${ownerfile}
echo "\newcommand{\email}{${owneremail}}" >> ${ownerfile}

# Compile PDF watermark template with latex
pdflatex watermarks/${watermark_file} && \
mv *.aux *.log .build && \
mv ${watermark_file}.pdf watermarks/
# pdftk ${book} stamp watermarks/${watermark_file} output ${watermarked_book}
