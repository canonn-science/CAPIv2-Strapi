#!/bin/bash
csv_file="$PWD/exampleFilesURL.csv"
cd $PWD && cd ../seed_files/CSV/exampleData/
while IFS=, read -r newName url; do
  wget –no-check-certificate -b -N -q -O "${PWD}/${newName}.csv" ''"${url}"''
done <"$csv_file"
