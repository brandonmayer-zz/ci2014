#!/bin/bash

mainFile="ci14book_mayer.tex"
macroFile="../macros.sty"
refFile="../ci_mayer.bib"
texFiles=("abstract" "motivation" "overview" \
    "dataset_abstraction" "cgrid" "ugrid" \
    "distributed_memory_model" "ioos")

styleFiles=("spbasic.bst" "spmpsci.bst" "spphys.bst" \
    "svind.ist" "svmult.cls")


odir="./ci14book_mayer"
figdir="${odir}/figs"
texdir="${odir}/tex"

if [ -d "${odir}" ] ; then
    rm -r "${odir}"
fi

mkdir "${odir}"
mkdir "${figdir}"
mkdir "${texdir}"

for styleFile in "${styleFiles[@]}"
do 
    cp "${styleFile}" "${texdir}"
done

cp "${macroFile}" "${odir}"
cp "${refFile}" "${odir}"
cp "${mainFile}" "${texdir}"


for texFile in "${texFiles[@]}" 
do 
    cp "${texFile}.tex" ${texdir}
    echo "texFile = ${texFile}"
    graphicFiles=($(grep "\\includegraphics" "${texFile}.tex" \
        | grep -v "%.*\\includegraphics" \
        | tr '\r' '\n'))

    for graphicFile in "${graphicFiles[@]}"
    do
        rawGraphicFile=${graphicFile##*"{"}
        rawGraphicFile=${rawGraphicFile%"}"} 

        echo -e "\trawGraphicFile = ${rawGraphicFile}"
        
        graphicFilename=${rawGraphicFile##*/}
        # echo "graphicFilename: ${graphicFilename}"
        fullGraphicFile=$(find ../figs -name "${graphicFilename}.pdf" \
            -o -name "${graphicFilename}.png" \
            -o -name "${graphicFilename}")

        echo -e "\tfullGraphicFile: ${fullGraphicFile}"
        echo""
        
        cp "${fullGraphicFile}" "${figdir}/"
           
    done

done
echo ""
