#! /bin/bash

echo -e "\n1. Retrieve the manuals and save to file."
while read p; do
  echo $p
  man $p > /home/morne/dev/bash/src/man/deploy/manlib/$p.man
done < /home/morne/dev/bash/src/man/deploy/mansrc
echo "1. done"

echo -e "\n2. Move retrieved manuals into folder structure."
allmanuals=$(ls /home/morne/dev/bash/src/man/deploy/manlib/*.man)
foldername=0
for manual in $allmanuals; do
    echo "  > Creating manfolder with id: $foldername"
    mkdir "/home/morne/dev/bash/src/man/deploy/manlib/$foldername"
    mv $manual "/home/morne/dev/bash/src/man/deploy/manlib/$foldername"
    ((foldername++))
done
echo "2. done"