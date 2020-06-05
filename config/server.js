module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: env('URL_DEV'),
  cron: {
    enabled: false
  },
  admin: {
    autoOpen: false
  }
});
