# CAPIv2 Seed files

## CSV Files

CSV files are provided on tables that contain static data that doesn't change often such as site types. You can import these CSV files into your database with tools like:

* PHPMySQL (Web Based)
* HeidiSQL (Windows)
* DBeaver (Linux)
* MySQL Workbench (Multiple OS Versions)

## SQL Files

The SQL files provided are a one to one dump of our development database when we deploy a new version, this includes all data provided in the CSV files and creates a test admin user with the following credentials:

```
username: canonntest
password: canonntest
```

It is not recommended to use this profile in production.
