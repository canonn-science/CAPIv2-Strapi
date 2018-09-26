# Running System Coords update manually

Example command to run at the root of the project:

```
python3 config/functions/system_update_edsm.py --development --update-missing -delay-seconds 3 -batch-size 25 -batch-limit 10
```

This will query EDSM for the first 250 systems spread out over 25 systesm at a time, with 3 seconds between each group, and stops after 10 groups have been processed. This is to help decrease load against EDSM and the local MySQL database.
