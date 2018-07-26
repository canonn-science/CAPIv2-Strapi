# Canonn API v2 - (CAPIv2)

[![Build Status](https://travis-ci.org/canonn-science/CAPIv2-Strapi.svg?branch=development)](https://travis-ci.org/canonn-science/CAPIv2-Strapi) 

# Table of Contents

<!-- TOC -->

- [Canonn API v2 - (CAPIv2)](#canonn-api-v2---capiv2)
- [Table of Contents](#table-of-contents)
- [Intro](#intro)
    - [Current Version](#current-version)
- [API Documentation](#api-documentation)
- [Prerequisites](#prerequisites)
    - [Installing Git, Node v10, and NPM v6](#installing-git-node-v10-and-npm-v6)
    - [Install PM2 to run as a service](#install-pm2-to-run-as-a-service)
    - [Install Strapi Alpha Latest](#install-strapi-alpha-latest)
    - [Setup MariaDB](#setup-mariadb)
- [Create Database & User for Strapi](#create-database--user-for-strapi)
- [Clone the CAPIv2-Strapi project and Setup](#clone-the-capiv2-strapi-project-and-setup)
    - [Clone the API](#clone-the-api)
    - [Enter the directory and install](#enter-the-directory-and-install)
    - [Create the Dev database.json](#create-the-dev-databasejson)
    - [Start CAPIv2 for the first time](#start-capiv2-for-the-first-time)
    - [Create the Admin User](#create-the-admin-user)
    - [Running CAPIv2 as a service](#running-capiv2-as-a-service)
- [Seed files for testing](#seed-files-for-testing)

<!-- /TOC -->

# Intro

The Canonn APIv2 is designed to handle all our current science projects. Currently the following sites are planned to be implemented in the inital version:

* Bark Mounds (BM)
* Brain Trees (BT)
* Fungal Gourds (FG)
* Fumaroles (FM)
* Generation Ships (GEN)
* Guardian Ruins (GR)
  * Guardian Ruins Active Obelisks
* Guardian Structures (GS)
  * Guardian Structures Active Obelisks
* Geysers (GY)
* Hyperdictions (HD)
* Lava Spouts (LS)
* Megaships (MS)
* Thargoid Barnacles (TB)
* Thargoid Structures (TS)
* Tubeworms (TW)
* Unknown Signal Sources (USS)

Also we are tracking the following:

* Systems
  * X/Y/Z and Locked status pulled from EDSM - **WIP**
* Bodies
  * Atmosphere composition (From EDSM) - **Planned v2.1.0**
  * Material composition (From EDSM) - **Planned v2.1.0**
  * All other body metrics (From EDSM) - **Planned v2.1.0**
* Rings (Currently don't have any use, but in case future data is needed)
* Non-Human Signal Source Kills

## Current Version

The current version of the CAPIv2 is `v2.0.8` and is still in active development and testing. If you would like to contribute please PM DMehaffy on discord `DMehaffy#1337`

# API Documentation

A static copy of our docs is located in the `/public` folder, you can view the progress of this documentation on our Docs repo here: https://github.com/canonn-science/CAPIv2-Swagger

# Prerequisites

You will need the following:
- Ubuntu 16.04 or 18.04
- Git
- Node v10 or above
- NPM v6 or above
- Node Pm2 (For running API as a service)
- Strapi Alpha v13
- MariaDB 10.2 or above

## Installing Git, Node v10, and NPM v6

First add the NodeJS Apt repos:

`
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
`

Then install Git, Node, and NPM:

`
sudo apt-get install -y nodejs git build-essential
`

## Install PM2 to run as a service

Run the following to install PM2 globally on your system:

`
sudo npm install pm2 -g
`

## Install Strapi Alpha Latest

Run the following to install Strapi Alpha (Current version is Alpha.13):

`
sudo npm i strapi@alpha -g
`

This will install strapi globally and allow you to generate new projects or models/api/ect from the cli

See the following for a more detailed guide: https://strapi.io/documentation/cli/CLI.html

## Setup MariaDB

Install Software Properties Common if its not already installed:

`
sudo apt-get install -y software-properties-common
`

Then add the MariaDB Apt repos:

```
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
```

Update your apt cache and install the server and client:

```
sudo apt update
sudo apt install -y mariadb-server mariadb-client
```

**Note that as of MariaDB 10.2 it no longer asks for the root password**

To change the MariaDB root password you will need to su to the local root account, enter a mysql shell, and change it:

```
sudo -i
*asks for password*

mysql -u root -p
```

```
USE mysql;
UPDATE user SET password=PASSWORD('YourPasswordHere') WHERE User='root' AND Host = 'localhost';
FLUSH PRIVILEGES;
exit;
exit
```

# Create Database & User for Strapi

Now we need to create the database that will hold the Strapi data, first enter a mysql shell as root:

`
mysql -u root -p
`

Then create the database and user:

```
create database capiv2;
create user 'capiv2system'@'localhost' identified by 'YourPasswordHere';
grant all priviledges on capiv2.* to 'capiv2system'@'localhost';
```

After this you should have the following database `capiv2` with the user `capiv2system` and a password for use with Strapi.

# Clone the CAPIv2-Strapi project and Setup

Now that we have the database we can clone the API and install it, we will use `/srv/CAPI/CAPIv2` but you can install it anywhere.

## Clone the API

Lets create our project directory and clone the CAPIv2 Build

`
sudo mkdir /srv/CAPI && sudo chown YourUserName:YourUserGroup /srv/CAPI
`

`
cd /srv/CAPI && git clone https://github.com/canonn-science/CAPIv2-Strapi.git CAPIv2
`

## Enter the directory and install

`
cd /srv/CAPI/CAPIv2 && npm install
`

**Note this may take a while**

If you have missing modules you may need to install the following manually:
- sendmail
- graphql
- graphql-tools
- graphql-type-json
- stream-to-array
- jsonwebtoken
- request
- purest
- bcryptjs
- apollo-server-koa
- graphql-playground-middleware-koa

You can use the following command inside the API directory:

```
npm install sendmail graphql graphql-tools graphql-type-json stream-to-array jsonwebtoken request purest bcryptjs apollo-server-koa graphql-playground-middleware-koa
```

## Create the Dev database.json

In order for strapi to talk to the MariaDB database we setup you will need to copy and modify the following file:

`cp /srv/CAPI/CAPIv2/config/environments/development/database.json.example /srv/CAPI/CAPIv2/config/environments/development/database.json
`

The example config is also down below, you will just need to modify the Database, User, and password you setup:

```json
{
  "defaultConnection": "default",
  "connections": {
    "default": {
      "connector": "strapi-hook-bookshelf",
      "settings": {
        "client": "mysql",
        "host": "127.0.0.1",
        "port": 3306,
        "database": "exampledatabase",
        "username": "exampleuser",
        "password": "examplepassword"
      },
      "options": {
        "ssl": false,
        "acquireConnectionTimeout": 100000
      }
    }
  }
}
```

Optionally you can add database debug to make sure everything starts up smooth:

```json
      },
      "options": {
        "ssl": false,
        "debug": true,
        "acquireConnectionTimeout": 100000
      }
```

## Start CAPIv2 for the first time

Once it has finished setting up, you can start it once in order to create your admin user:

```
cd /srv/CAPI/CAPIv2 && strapi start
```

**Note this may take a while, if you hit any issues with bookshelf taking to long, increase the hook time in the file below:**

`nano /srv/CAPI/CAPIv2/config/hook.json`

```
{
  "timeout": 60000, #Increase this Number and do not include this comment
  "load": {
    "before": [],
    "order": [
      "Define the hooks' load order by putting their names in this array in the right order"
    ],
    "after": []
  }
}
```

## Create the Admin User

After strapi has started you can visit `http://localhost:1337` if you are on the machine, else you can change `localhost` to your servers IP. **Note that doing this on the current version will take you to our docs page located in the /public folder**

Currently there is no public frontend, we will however replace this in the future before public release. To create your user go to `http://localhost:1337/admin`

## Running CAPIv2 as a service

To run strapi as a service, a change was made in the package.json, and you have installed Pm2 in a previous step. You will need to navigate to the directory the API is cloned into and run the following:

`
NODE_ENV=development pm2 start strapi --no-pmx --name="capiv2" -- start
`

Alternatively you can modify the `NODE_ENV` for staging or production use

Note you will need to also create the `database.json` located in `config/enviroments/staging` or `config/enviroments/production`

# Seed files for testing

Seed files will be stored in CSV format in the directory `seed_files`

We will also include a .sql export of the development database which will include all of the .csv exports including a single admin user called `canonntest` using the password `canonntest`. Permissions have been modified to allow count, find, and findone on all endpoints. As well as adding create and update on the report endpoints.
