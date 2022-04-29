#!/bin/bash
#This is a bash script to download the data used in Selz, Riemer, Craig, 2022: The transition from practical to intrinsic predictability of midlatitude weather. JAS.
#Run this script without changes to download all the data. If you want to download a subset, modify the variables exps and cases below accordingly.

#Select the experiments to download (factor:resolution, Ti=Tiedtke scheme, SV=singular vectors, R2B6=40km resolution, R2B7=20km resolution)
exps="1.0000:R2B6 1.0000_SV:R2B6 1.0000_Ti:R2B6 0.5000:R2B6 0.2000:R2B6 0.1000:R2B6 0.1000_Ti:R2B6 0.0010:R2B6 0.0010_Ti:R2B6 1.0000:R2B7 0.0010:R2B7"

#Select the cases to download (list of init-dates, yyyymmdd)
cases="20161001 20161101 20161201 20170101 20170201 20170301 20170401 20170501 20170601 20170701 20170801 20170901"

for e in $exps
do
    f=(${e//:/ })
    for c in $cases
    do
        wget https://irods-web.zdv.uni-mainz.de/irods-rest/rest/fileContents/zdv/project/m2_jgu-w2w/w2w-a1/selz_etal_2022/output_${f[0]}_${c}_${f[1]}.tar?ticket=Fys39e1sryugOrF -c -nd -v -O output_${f[0]}_${c}_${f[1]}.tar       
    done
done

