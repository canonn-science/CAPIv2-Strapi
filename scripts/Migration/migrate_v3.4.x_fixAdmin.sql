/* Restrict Admins */
UPDATE strapi_administrator SET blocked = 0 where blocked IS NULL;
UPDATE strapi_administrator SET isActive = 1 where id = 1;
UPDATE strapi_administrator SET isActive = 0 where isActive IS NULL;
