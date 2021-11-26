module.exports = [
  'strapi::errors',
  'strapi::security',
  'strapi::cors',
  {
    name: 'strapi::poweredBy',
    config: {
      value: 'Canonn - CANNAPI <docs.canonn.tech>',
    },
  },
  'strapi::logger',
  'strapi::query',
  {
    name: 'strapi::body',
    config: {
      multipart: true,
      patchKoa: true,
      encoding: 'utf-8',
      formLimit: '256mb',
      jsonLimit: '256mb',
      textLimit: '256mb',
      formidable: {
        maxFileSize: 256 * 1024 * 1024, // 256mb
      },
    },
  },
  {
    name: `strapi::compression`,
    config: {
      options: {
        br: false,
      },
    },
  },
  'strapi::favicon',
  'strapi::public',
];
