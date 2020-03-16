#!/bin/bash
cat $1 | while read LINE
do
	mv api/$LINE/documentation/$2 api/$LINE/documentation/$3
done

mv extensions/email/documentation/$2 extensions/email/documentation/$3
mv extensions/upload/documentation/$2 extensions/upload/documentation/$3
mv extensions/users-permissions/documentation/$2 extensions/users-permissions/documentation/$3