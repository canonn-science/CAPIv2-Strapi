module.exports = ({ env }) => ({
  port: env.int('PORT', 1339),
  url: env('URL_PROD'),
});
