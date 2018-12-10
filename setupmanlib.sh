#! /bin/bash

echo -e "\n1. Retrieve the manuals and save to file."
while read p; do
  echo $p
  man $p > /home/_mkruge19/dev/bash/manaday/manlib/$p.man
done < /home/_mkruge19/dev/bash/manaday/mansrc
echo "1. done"

echo -e "\n2. Move retrieved manuals into folder structure."
allmanuals=$(ls /home/_mkruge19/dev/bash/manaday/manlib/*.man)
foldername=0
for manual in $allmanuals; do
    echo "  > Creating manfolder with id: $foldername"
    mkdir "/home/_mkruge19/dev/bash/manaday/manlib/$foldername"
    mv $manual "/home/_mkruge19/dev/bash/manaday/manlib/$foldername"
    ((foldername++))
done
echo "2. done"
