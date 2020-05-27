module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: 'https://api.canonn.tech:2083',
  cron: {
    enabled: false
  },
  admin: {
    autoOpen: false
  }
});
