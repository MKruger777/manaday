#! /bin/bash

SCRIPT_ROOT_DIR=${PWD}
echo "Script executed from: ${SCRIPT_ROOT_DIR}"
echo -e "\n1. Retrieve the manuals and save to file."
while read p; do
  echo $p
  man $p > ${SCRIPT_ROOT_DIR}/$p.man
  if [[ -s ${SCRIPT_ROOT_DIR}/$p.man ]]; then
      echo "file has something"; 
  else 
      echo "file is empty and will be deleted!"
      rm ${SCRIPT_ROOT_DIR}/$p.man
  fi

done < ${SCRIPT_ROOT_DIR}/mansrc
echo "1. done"

#Clearout the manlib - we want this clean during the running of the initial setup
if [ -e ${SCRIPT_ROOT_DIR}/manlib ];then rm -rf ${SCRIPT_ROOT_DIR}/manlib ; fi  
mkdir -p ${SCRIPT_ROOT_DIR}/manlib

echo -e "\n2. Move retrieved manuals into folder structure."
allmanuals=$(ls ${SCRIPT_ROOT_DIR}/*.man)
foldername=0
for manual in $allmanuals; do
    echo "  > Creating manfolder with id: $foldername"
    mkdir "${SCRIPT_ROOT_DIR}/manlib/$foldername"
    mv $manual "${SCRIPT_ROOT_DIR}/manlib/$foldername"
    ((foldername++))
done
echo "2. done"
