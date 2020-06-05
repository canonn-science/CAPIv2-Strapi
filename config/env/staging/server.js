module.exports = ({ env }) => ({
  port: env.int('PORT', 1338),
  url: env('URL_STAG'),
});
