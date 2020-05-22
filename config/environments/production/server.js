module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1339),
  url: 'https://api.canonn.tech',
  cron: {
    enabled: false
  },
  admin: {
    autoOpen: false
  }
});
