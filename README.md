# 1. Canonn API v2 - (CAPIv2)

[![Strapi Version](https://img.shields.io/badge/strapi-v3.0.0--alpha.26.1-blue.svg)](https://github.com/strapi/strapi) 
[![CAPIv2 Version](https://img.shields.io/badge/capiv2-v2.0.25-orange.svg)](https://api.canonn.tech:2083) 
[![Build Status](https://travis-ci.org/canonn-science/CAPIv2-Strapi.svg?branch=development)](https://travis-ci.org/canonn-science/CAPIv2-Strapi)
[![EDCD Discord](https://img.shields.io/discord/164411426939600896.svg?logo=discord&label=EDCD%20Discord)](https://discord.gg/fhDWZBH)
[![Canonn Discord](https://img.shields.io/discord/146714487695605760.svg?logo=discord&label=Canonn%20Discord)](https://discord.gg/HzzmG2f)


# 2. Table of Contents

<!-- TOC -->

- [1. Canonn API v2 - (CAPIv2)](#1-canonn-api-v2---capiv2)
- [2. Table of Contents](#2-table-of-contents)
- [3. Intro](#3-intro)
    - [3.1. Current Version](#31-current-version)
- [4. API Documentation](#4-api-documentation)
- [5. Prerequisites](#5-prerequisites)
    - [5.1. Installing Git, Node v10, and NPM v6](#51-installing-git-node-v10-and-npm-v6)
    - [5.2. Install PM2 to run as a service](#52-install-pm2-to-run-as-a-service)
    - [5.3. Install Strapi Alpha Latest](#53-install-strapi-alpha-latest)
    - [5.4. Setup MariaDB](#54-setup-mariadb)
- [6. Create Database & User for Strapi](#6-create-database--user-for-strapi)
- [7. Clone the CAPIv2-Strapi project and Setup](#7-clone-the-capiv2-strapi-project-and-setup)
    - [7.1. Clone the API](#71-clone-the-api)
    - [7.2. Enter the directory and install](#72-enter-the-directory-and-install)
    - [7.3. Setup python3 for scripts](#73-setup-python3-for-scripts)
    - [7.4. Create the .env file to setup the database access](#74-create-the-env-file-to-setup-the-database-access)
    - [7.5. Start CAPIv2 for the first time](#75-start-capiv2-for-the-first-time)
    - [7.6. Create the Admin User](#76-create-the-admin-user)
    - [7.7. Running CAPIv2 as a service](#77-running-capiv2-as-a-service)
- [8. Seed files for testing](#8-seed-files-for-testing)

<!-- /TOC -->

# 3. Intro

The Canonn APIv2 is designed to handle all our current science projects. Currently the following sites are planned to be implemented in the initial version:

- Amphora Plants (AP)
  - AP Types
- Bark Mounds (BM)
  - BM Types
- Brain Trees (BT)
  - BT Types
- Crystalline Shards (CS)
  - CS Types
- Fungal Gourds (FG)
  - FG Types
- Fumaroles (FM)
  - FM Types
- Generation Ships (GEN)
  - GEN Logs
- Guardian Beacons (GB)
  - GB Messages
- Guardian Ruins (GR)
  - GR Active Obelisks
  - GR Active Groups
  - GR Artifacts
  - GR Codex Categories
  - GR Codex Data
  - GR Obelisks
  - GR Obelisk Groups
  - GR Types
- Guardian Structures (GS)
  - GS Active Obelisks
  - GS Active Groups
  - GS Artifacts
  - GS Codex Categories
  - GS Codex Data
  - GS Obelisks
  - GS Obelisk Groups
  - GS Types
- Gas Vents (GV)
  - GV Types
- Geysers (GY)
  - GY Types
- Hyperdictions (HD) - **WIP**
- Lava Spouts (LS)
  - LS types
- Non-Human Signal Sources (NHSS)
- Thargoid Barnacles (TB)
  - TB Cycles
  - TB Types
- Thargoid Structures (TS)
  - TS Status
- Tubeworms (TW)
  - TW Types

Also we are tracking the following:

- Regions - **WIP**
- Systems
  - X/Y/Z and Locked status pulled from EDSM
- Bodies
  - Atmosphere composition (From EDSM)
  - Material composition (From EDSM)
  - All other body metrics (From EDSM)
- Rings (Currently don't have any use, but in case future data is needed)
- CMDRs
  - CMDR Kills

## 3.1. Current Version

The current version of the CAPIv2 can be seen at the top of this read me and the CAPIv2 is still in active development and testing. If you would like to contribute please PM DMehaffy on discord `DMehaffy#1337`

# 4. API Documentation

Our Swagger docs are auto-generated by our API, each environment (Production, Staging, Development) have their own docs based on the release version.

[Development](https://api.canonn.tech:2083/documentation)
[Staging](https://api.canonn.tech:2053/documentation)
[Production](https://api.canonn.tech/documentation)

We are also working on our actual documentation to help navigate and describe how our API works, you can [take a look](https://docs.canonn.tech) at our early preview. You may also help keep our docs up to date [in this repo](https://github.com/canonn-science/CAPIv2-Docs).

# 5. Prerequisites

You will need the following:
- Ubuntu 18.04 LTS
  - **Ubuntu 16.04 is no longer supported**
- Git
- Node v10
- NPM v6
- Node PM2 (For running API as a service)
- Strapi Alpha based on the version within the `package.json`
- MariaDB 10.3

## 5.1. Installing Git, Node v10, and NPM v6

First add the NodeJS Apt repos:

`
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
`

Then install Git, Node, and NPM:

`
sudo apt-get install -y nodejs git build-essential
`

## 5.2. Install PM2 to run as a service

Run the following to install PM2 globally on your system:

`
sudo npm install pm2 -g
`

**NOTE:** If you get an EACCESS error while trying to install global packages, please see [this](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) node help guide.

## 5.3. Install Strapi Alpha Latest

Run the following to install Strapi Alpha version from the package.json:

**NOTE:** This is just an example, you should replace the version below with the proper version!

`
sudo npm i 3.0.0-alpha.24.1 -g
`

This will install strapi globally and allow you to generate new projects or models/api/ect from the cli

See the following for a more detailed guide: [https://strapi.io/documentation/cli/CLI.html](https://strapi.io/documentation/3.x.x/getting-started/installation.html#requirements)

## 5.4. Setup MariaDB

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
sudo apt install -y mariadb-server-10.3 mariadb-client-10.3
```

**Note that as of MariaDB 10.3 it no longer asks for the root password**

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

# 6. Create Database & User for Strapi

Now we need to create the databases that will hold the Strapi data, first enter a mysql shell as root:

`
mysql -u root -p
`

You will need two databases, as we split the users data into it's own DB to allow for easy access between production, staging, and development

Create the data and user databases and a user to access them:

```
create database capiv2_data;
create database capiv2_user;
create user 'capiv2system'@'localhost' identified by 'YourPasswordHere';
grant all privileges on capiv2_data.* to 'capiv2system'@'localhost';
grant all privileges on capiv2_user.* to 'capiv2system'@'localhost';
```

After this you should have the following databases `capiv2_data` & `capiv2_user` with the user `capiv2system` and a password for use with Strapi.

# 7. Clone the CAPIv2-Strapi project and Setup

Now that we have the database we can clone the API and install it, we will use `/srv/CAPIv2` but you can install it anywhere.

## 7.1. Clone the API

Lets create our project directory and clone the CAPIv2 Build

`
sudo mkdir /srv/CAPIv2 && sudo chown YourUserName:YourUserGroup /srv/CAPIv2
`

`
cd /srv/CAPIv2 && git clone https://github.com/canonn-science/CAPIv2-Strapi.git
`

**NOTE** Currently you will need to make the uploads directory for screenshots, to do so please run:

`
mkdir /srv/CAPIv2/CAPIv2-Strapi/public/uploads
`

## 7.2. Enter the directory and install

`
cd /srv/CAPIv2/CAPIv2-Strapi && npm install
`

**Note this may take a while**

## 7.3. Setup python3 for scripts

~~CAPIv2 uses a few python scripts to update data from EDSM to our database. The database information is pulled from the database.json file you will configure in the next step.~~

We no longer use python scripts as all of our updates are done via our external program the [CAPIv2-Updater](https://github.com/canonn-science/CAPIv2-Updater)

## 7.4. Create the .env file to setup the database access

In order for strapi to talk to the MariaDB database we setup you will need to copy and modify the following file:

**NOTE:** This may not work on windows, if you are on a windows machine you will need to declare the variables on the commandline!

`cp /srv/CAPIv2/CAPIv2-Strapi/.env.example /srv/CAPIv2/CAPIv2-Strapi/.env
`

The example config is also down below, you will just need to modify the Database, User, and password you setup:

You will need to set the Database settings for User and development at a minimum, you can leave the JWT Secret the same as we provide exports of some sample users.

For the Discord webhook, you will need to create a Discord Server and setup a webhook URL. This webhook is a work in progress but will be used to provide alerts when certain data is added.

## 7.5. Start CAPIv2 for the first time

Once it has finished setting up, you can start it once in order to create your admin user:

```
cd /srv/CAPIv2/CAPIv2-Strapi && strapi start
```

**Note this may take a while, if you hit any issues with bookshelf taking to long, increase the hook time in the file below:**

`nano /srv/CAPIv2/CAPIv2-Strapi/config/hook.json`

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

## 7.6. Create the Admin User

After strapi has started you can visit `http://localhost:1337/admin` if you are on the machine, else you can change `localhost` to your servers IP.

## 7.7. Running CAPIv2 as a service

To run strapi as a service, a change was made in the package.json, and you have installed PM2 in a previous step. You will need to navigate to the directory the API is cloned into and run the following:

`
NODE_ENV=development pm2 start --name="capiv2" server.js -i 1
`

Alternatively you can modify the `NODE_ENV` for staging or production use. Again if you are on a windows machine you may need to define the database and JWT secret environment variables, just like what is being done with `NODE_ENV`.

# 8. Seed files for testing

Seed files will be stored in CSV format in the directory `seed_files`

We will also include a .sql export of the development database which will include all of the .csv exports including a single admin user called `canonntest` using the password `canonntest`. Permissions have been modified to allow count, find, and findone on all endpoints. As well as adding create on the report endpoints.
