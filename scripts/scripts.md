# Running Scripts using pm2

In order to effecively manage cron tasks with the CAPIv2, we are not using the built in cron system in order to not introduce extra load by our use of PM2 Clusters.

You should create scripts that use the `node-cron` package and set them up to run on a regular cron schedule using the `.env` file located the the root of the project.

An example of the Material Report delete script can be found [here](./deleteMR_oneMonth.js) this is used in combination with the following `.env` settings:

```env
# ----------------- #
## Script Settings ##
# ----------------- #

# Script URLs
SCRIPT_PROD = "http://localhost:1339"
SCRIPT_STAG = "http://localhost:1338"
SCRIPT_DEV = "http://localhost:1337"

# Script User information
SCRIPT_USER = "canonntest"
SCRIPT_PASS =  "canonnpass"

# Scripts Enabled
SCRIPT_MR_DELETE = true

# Script Options
SCRIPT_OFFSET = 10
SCRIPT_MR_LIMIT = 1000
SCRIPT_MR_MONTH = 1

# Cron Schedules
# [MINUTE] [HOUR] [DAY OF THE MONTH] [MONTH OF THE YEAR] [DAY OF THE WEEK] [YEAR (Optional)]
# Example "*/5 * * * *" means every 5 minutes
SCRIPT_MR_CRON = "* * * * *"
```

- The Script URLs are used to define which server the script is running on.
- Script User information is used to login if required
- Scripts enabled, you should add your script here and make sure to read this so it can be disabled if needed.
- Script options are used to allow easy setting of certain options such as the months to keep for Material Reports
- Cron schedules are what is used by `node-cron` to define the cron.

## Create the pm2 process

Simply navigate into the scripts directory and use the following command to create the pm2 process:

`pm2 start --name="capi-script-$NAME" $NAME.js`

An example of which is the Material Report Script:

`pm2 start --name="capi-script-mrdelete" deleteMR_oneMonth.js`

## Script Offset

The Script offset is for use when you are running the script on multiple servers and you need to set staggered offsets between the servers, these should be at minimum 5 times the amount of time your script takes. The offset is in seconds.

So as an example with the Material Report Delete script, we use the following values on each server:

- Server 1 - 10 seconds
- Server 2 - 20 seconds
- Server 3 - 30 seconds

As this script takes only a few seconds to complete, this gives more time to allow for the changes to be relicated against all of our DB servers.

