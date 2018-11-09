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

## Example file downloads

All example files come in CSV format as modified data from our google sheets, these CSVs are formatted for direct import in the CAPIv2 Database. These are also used by our automated seed file script to dynamically generate an updated SQL Seed File with a single bash script.

### CMDRs
* [CMDR](https://docs.google.com/spreadsheets/d/e/2PACX-1vTTytmcMSOtVWIczIwHDXRt-zxICYt9rVmZl5hZe3ChEwuyNVIIiMIcWQbs3PcRc-hMOOF7MAZ8lujH/pub?gid=0&single=true&output=csv)

### Celestial
* [System](https://docs.google.com/spreadsheets/d/e/2PACX-1vSfQCur4X4NebTeT8LMn4tFlwVDuJLRoF5apWg0pzHAJUbjQjdBlIcNe6y2HsShrUpPnSjY4v6fWxVf/pub?gid=0&single=true&output=csv)
* [Body](https://docs.google.com/spreadsheets/d/e/2PACX-1vQeALF5cIrs55UU_WSSamuzTW140oGRXANjk3A0g5PN84iK_qrrMa6To1bvSGrR5oSjC4vtUGbfazge/pub?gid=0&single=true&output=csv)
* [RingType](https://docs.google.com/spreadsheets/d/e/2PACX-1vQdHQIFCPWgmj20B5JQQkTqpvRZuHHfpQq--Pn5aHsJDecbb4s7fVx6bM0dMFI09Fkrh3D1CTpXPwFt/pub?gid=0&single=true&output=csv)

### Bark Mounds
* [BM](https://docs.google.com/spreadsheets/d/e/2PACX-1vRg0MK3POtXYWmb7WP04g83W8mY6eI5SBDbCuj3T3shi5-D9KyTenBbUSZAB4L1AJ-xqmfqiT2c51cm/pub?gid=0&single=true&output=csv)

### Brain Trees
* [BT](https://docs.google.com/spreadsheets/d/e/2PACX-1vTwBVREDc6KaznttjmAcDS9gjrqpYtwkw2iFqXQIB-lHD5EovKFbLx5S0SEd6QPZ08vpjWWAo5kSfvq/pub?gid=0&single=true&output=csv)

### Fungal Gourds
* [FG](https://docs.google.com/spreadsheets/d/e/2PACX-1vQZkBIEgxKj8pEqKVUPDV4Yu-JyjkAheM7ZewZTIngiIRFrAcBuk2j566PsCdi8ECmISBuNsOYW8nRk/pub?gid=0&single=true&output=csv)

### Fumaroles
* [FM](https://docs.google.com/spreadsheets/d/e/2PACX-1vS07uQ_8k8Fj9RTClYF0HFjMIGrbFex-9msjQ84ORxxjAUw8U-OlUjhv3rlO0lM7ZIUKtT9eiZFscAP/pub?gid=0&single=true&output=csv)
* [FMType](https://docs.google.com/spreadsheets/d/e/2PACX-1vSTjQtbaHLiVqYg2nAPtQS6Hf8f56jZmBqoukbhTVAB3i_qO1hN7HxylMVIPR7wPGWmCyuegYuj4khU/pub?gid=0&single=true&output=csv)

### Guardian Beacons
* [GB](https://docs.google.com/spreadsheets/d/e/2PACX-1vTSTDGizsR3KhGcDA00T92P89ckkc0HMULYvcSr09Xegq2HUzoAOaV7GglXDbOgzem7lv5gmRHV5SlK/pub?gid=0&single=true&output=csv)
* [GBMessage](https://docs.google.com/spreadsheets/d/e/2PACX-1vQYOVeocUtvKp-J_cGpRoD5BmZ--HI6ALOR1lxgCwl8IwCKUCbuhizAqXuHNivYry5wEAMi09KxhFAM/pub?gid=0&single=true&output=csv)

### Guardian Ruins
* [GR](https://docs.google.com/spreadsheets/d/e/2PACX-1vSvO_TwJ0xmAU8yB1CdYG4ZKM6m4sbiDDqqPAE6alokakvRsB0q4udPXZz2Kb0of6PUdrQGugDvrZcR/pub?gid=0&single=true&output=csv)
* [GRActiveGroup](https://docs.google.com/spreadsheets/d/e/2PACX-1vRfZMSnrVzPwQH_uDhHXggpBEWfO_sqZIJnhgruIpmG_NWLAV5xfKlp5uEHCctCio0g7sErJJDpmdDR/pub?gid=0&single=true&output=csv)
* [GRActiveObelisk](https://docs.google.com/spreadsheets/d/e/2PACX-1vTA_e6lY8J-KNmjzp8SmXWo_bSQjJA0tnlvHBoBo3RCAsa6Kz6X9EAiCfPViqivTTAq48uHaZ92fFSB/pub?gid=0&single=true&output=csv)
* [GRArtifact](https://docs.google.com/spreadsheets/d/e/2PACX-1vS6qxUh2QIL8IpxpVqWNgDgQfShA2o0-L1Sd180r9VthbCHfHiWQigwrOYte2eve5mfQCfcGa6BOOkQ/pub?gid=0&single=true&output=csv)
* [GRCodexCategory](https://docs.google.com/spreadsheets/d/e/2PACX-1vRoWahlCQX-v11grlQYlKOO-uWE9nKfCDTkAu0qEs8Rh4rwGR0uVXTO9vK8H2Uv2rsWgKkYfxf36or3/pub?gid=0&single=true&output=csv)
* [GRCodexData](https://docs.google.com/spreadsheets/d/e/2PACX-1vSgRx6ckAOpdWjHHiY9NitAfjucYZn3hxo8qe6_nifWqlxI7Kqt_R_JjhTZINwUvbA415dxHkGgieGL/pub?gid=0&single=true&output=csv)
* [GRGroup](https://docs.google.com/spreadsheets/d/e/2PACX-1vTs-sVLK3E3sKE2hdFfRAr3hfWdLZ5gdYz498S9kCs8gsE2zKg0qPyi6-JZnV2ZRxDcTcA4hujled_V/pub?gid=0&single=true&output=csv)
* [GRObelisk](https://docs.google.com/spreadsheets/d/e/2PACX-1vTDVC_4cI6e_Dx1baM1iGUTLoIHXI9Wd6qeOtpa9v21h23sYXdnOG_F7FUK6_gLmg_jxx3MLoBcHOah/pub?gid=0&single=true&output=csv)
* [GRType](https://docs.google.com/spreadsheets/d/e/2PACX-1vTO9SEo9R85o6bD8D_ix0hpPN7hARiWHZDbgJi0KihqzXAkTRnh79bRTOa6RUCPJ-CX2WRhMuyF-bDi/pub?gid=0&single=true&output=csv)

### Guardian Structures
* [GS](https://docs.google.com/spreadsheets/d/e/2PACX-1vR_o5nAEbbTbtFPv4XE_r_V4LEWPTJWLHYjAAri_jzSrfLz9JnzHKEKj8Hu8FQOMoA-gLLmmIxkD42d/pub?gid=0&single=true&output=csv)
* [GSActiveGroup](https://docs.google.com/spreadsheets/d/e/2PACX-1vQquPoDfXYsqmON5MeiIxrf3j7RU7WUzzEyjUBJcsp_NG6Y7o8Ql7wkR8IkSZN_3F0u_gUeXfGcEqf-/pub?gid=0&single=true&output=csv)
* [GSActiveObelisk](https://docs.google.com/spreadsheets/d/e/2PACX-1vTq8Ya_dLPFqJaSbnrpgnnZW6LvBDUUmCWsuZZWzbSPw9YxXZfz4F1Y2jwFjg6CkfFo8r-SwdmObNU4/pub?gid=0&single=true&output=csv)
* [GSArtifact](https://docs.google.com/spreadsheets/d/e/2PACX-1vQN7Hhufqq-ulkQvHNn59AMkrNLQFogJ0q4hN7s-v-fWkp0Rxee8nj5khfkCgCQQiHN0vg2270ZtgnW/pub?gid=0&single=true&output=csv)
* [GSCodexCategory](https://docs.google.com/spreadsheets/d/e/2PACX-1vTuuKnyMLnW4iqBviAXIyI-xge4yOHzwLTLLFe1yZhNOhEECNOA73vNMEBYVQ3l167fXmLgq9FGn_RZ/pub?gid=0&single=true&output=csv)
* [GSCodexData](https://docs.google.com/spreadsheets/d/e/2PACX-1vSdq5Lh16U7fU1mA1VVgfdvSyaFc99-GMgUK-rJmbNjGmgmAorQOcvcjVX-PXuC_xfBzet_I1sgmYym/pub?gid=0&single=true&output=csv)
* [GSGroup](https://docs.google.com/spreadsheets/d/e/2PACX-1vSg7-PW-XVv_nEfVMg3JzVy-wvK9htFe-SfQB4tuHQRNK12ieGFWfgN-19L6fqVEh-KAILQfzJyODqH/pub?gid=0&single=true&output=csv)
* [GSObelisk](https://docs.google.com/spreadsheets/d/e/2PACX-1vSqJ-3tA13lJ6ZAYFalJWjO4rTZiG5AEcTBvq6sD5ziLxlFjuYxtxFhkfEkgUC1v7-W8k-fdN8EC4oE/pub?gid=0&single=true&output=csv)
* [GSType](https://docs.google.com/spreadsheets/d/e/2PACX-1vQ0B6R9Avt4lId7YxM-6fKsZtHxp78hlnaGD__9yYcXQrKPRyUxyp82_9Yx2V5pCEjExlPDpzH6BC4J/pub?gid=0&single=true&output=csv)

### Geysers
* [GY](https://docs.google.com/spreadsheets/d/e/2PACX-1vTtOmCgl3SB1ueNviOKMW5gnDuArjjfBJap-W-lC25_TqlqtXbMf5GLlDYY_mpjIAAacAoz_fUZv06k/pub?gid=0&single=true&output=csv)
* [GYType](https://docs.google.com/spreadsheets/d/e/2PACX-1vQ6wgzFhM6A3dte0LLyb99SFUWK0IzMT8Uqx8BlGAM3_InuNIeitQEsvoIs1lqjRVz4kDPUkxNkDMQs/pub?gid=0&single=true&output=csv)

### Lava Spouts
* [LS](https://docs.google.com/spreadsheets/d/e/2PACX-1vTcivnSa87wDN1v1nI3NoTXczo8a0uC_V9o8QwQ3WExp2DPv5xNnIjp7CcqaCUWDe8eVy4uJps9MFNb/pub?gid=0&single=true&output=csv)

### Megaships
* [MSType](https://docs.google.com/spreadsheets/d/e/2PACX-1vTxvwdxQwWsh7aum0XwB1tjOfSB80TFpiaGbUh2yVHZ9JXJl9XjL5coqkQ6mknFhnjSo8qSzYVvXRIY/pub?gid=0&single=true&output=csv)

### Thargoid Barnacles
* [TB](https://docs.google.com/spreadsheets/d/e/2PACX-1vTUQsBr9nCTNl_PxHOi8O9VAEvgFtlCFH7reGMbam0FIP7SLJtDIz2_wEI8w4yTxevilrctlrk4Mnoz/pub?gid=0&single=true&output=csv)
* [TBCycle](https://docs.google.com/spreadsheets/d/e/2PACX-1vTwm3_zkk1fzuFO4Rdh-VmC6Fbupdxryggp4LHbtX8QX9FjrSBjBK4MLE-Ping0gq5jHarr5rUoXXuK/pub?gid=0&single=true&output=csv)
* [TBType](https://docs.google.com/spreadsheets/d/e/2PACX-1vQ8nr6m-Qt70RhzXOQ_AjRd6q8jk4D8IEF0LPLWsUMoBvbkRh7XzTb3V-xR8EXakpB_tUR8k4Dvm6TB/pub?gid=0&single=true&output=csv)

### Thargoid Structures
* [TS](https://docs.google.com/spreadsheets/d/e/2PACX-1vS7-JB6SchZ76dMbq08lFxH7ijZuZ-b02gY210o2Ge1cpMV1HSXYwo-DFRlYB1gea93bOwaKU8oemS6/pub?gid=0&single=true&output=csv)
* [TSStatus](https://docs.google.com/spreadsheets/d/e/2PACX-1vRHH7eDa-q5U1jBAMzW-I_N15wOhWe4sg_IfOpywyKGfBQ4T_k-RKw1PGV9KjXbkGOwODreNtG5xVKn/pub?gid=0&single=true&output=csv)

### Unknown Signal Sources
* [USSType](https://docs.google.com/spreadsheets/d/e/2PACX-1vQvCyaOUjscvIyuVAusN7IY78xcn-4IPAFfBOFQ9j5jTMclIm3S-yTf2WkmMPUv1HgKlu46LYzPQQdY/pub?gid=0&single=true&output=csv)
