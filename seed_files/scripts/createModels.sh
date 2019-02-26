#!/bin/bash
cat $1 | while read LINE
do
	strapi generate:api -t bookshelf $LINE holder:string
done
