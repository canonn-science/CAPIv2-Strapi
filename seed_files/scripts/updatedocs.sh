#!/bin/bash
cat $1 | while read LINE
do
	mv api/$LINE/documentation/$2 api/$LINE/documentation/$3
done

mv plugins/email/documentation/$2 plugins/email/documentation/$3
mv plugins/upload/documentation/$2 plugins/upload/documentation/$3
mv plugins/users-permissions/documentation/$2 plugins/users-permissions/documentation/$3
