#!/bin/bash

status=${1-development} ;  shift


#./get-factionkills.sh
#./get-tgencounterstat.sh

python3 loadseed.pl --development -seedfile ../CSV/grtypes-seed.csv


#../CSV/core_store-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/fmtypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grartifacts-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grcodexcategories-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grcodexdata-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grobeliskgroups-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grobelisks-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/grtypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gsartifacts-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gscodexcategories-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gscodexdata-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gsobeliskgroups-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gsobelisks-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gstypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/gytypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/mstypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/ringtypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/tbcycles-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/tbtypes-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/tsstatuses-seed.csv
#python3 loadseed.pl --development -seedfile ../CSV/upload_file_morph-seed.csv
#python3 loadseed.pl --development -seedfile ../CSV/upload_file-seed.csv
#python3 loadseed.pl --development -seedfile ../CSV/users_permissions_permission-seed.csv
#python3 loadseed.pl --development -seedfile ../CSV/users_permissions_role-seed.csv
#python3 loadseed.pl --development -seedfile ../CSV/users_permissions_user-seed.csv
python3 loadseed.pl --development -seedfile ../CSV/usstypes-seed.csv
