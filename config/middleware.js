module.exports = ({ env }) => ({
  load: {
    before: ['responseTime', 'logger', 'cors', 'responses', 'gzip'],
    order: [],
    after: ['parser', 'router', 'sentry', 'range', 'cache'],
  },
  settings: {
    range: {
      enabled: true
    },
    sentry: {
      enabled: env.bool('SENTRY_ENABLED', false),
      url: env('SENTRY_URL', ''),
      sentryEnv: env('SENTRY_ENV', 'development')
    },
    parser: {
      enabled: true,
      multipart: true,
      formLimit: '128mb',
      jsonLimit: '256mb',
    },
    gzip: {
      enabled: true,
      options: {
        br: false
      }
    },
    responseTime: {
      enabled: true,
    },
    poweredBy: {
      enabled: true,
      value: 'Canonn APIv2 <docs.canonn.tech>',
    },
    cors: {
      enabled: true,
      origin: '*',
      expose: ['WWW-Authenticate', 'Server-Authorization', 'Content-Range'],
      credentials: true,
      methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS', 'HEAD'],
      headers: ['Content-Type', 'Authorization', 'X-Frame-Options', 'X-Powered-By', 'Origin', 'Accept'],
    },
    cache: {
      enabled: env.bool('CACHE_ENABLED', false),
      logs: false,
      type: 'redis',
      redisConfig: env.json('CACHE_RCONFIG', {}),
      maxAge: 3600000,
      models: [
        { model: 'bodies', maxAge: 300000 },
        { model: 'systems', maxAge: 300000 },
        { model: 'rings', maxAge: 300000 },
        { model: 'excludeclients', maxAge: 300000 },
        { model: 'excludecmdrs', maxAge: 300000 },
        { model: 'excludecodices', maxAge: 300000 },
        { model: 'excludeevents', maxAge: 300000 },
        { model: 'excludefsses', maxAge: 300000 },
        { model: 'apsites', maxAge: 900000 },
        { model: 'bmsites', maxAge: 900000 },
        { model: 'btsites', maxAge: 900000 },
        { model: 'cssites', maxAge: 900000 },
        { model: 'fgsites', maxAge: 900000 },
        { model: 'fmsites', maxAge: 900000 },
        { model: 'gbsites', maxAge: 900000 },
        { model: 'gensites', maxAge: 900000 },
        { model: 'grsites', maxAge: 900000 },
        { model: 'gssites', maxAge: 900000 },
        { model: 'gvsites', maxAge: 900000 },
        { model: 'gysites', maxAge: 900000 },
        { model: 'lssites', maxAge: 900000 },
        { model: 'tbsites', maxAge: 900000 },
        { model: 'tssites', maxAge: 900000 },
        { model: 'twsites', maxAge: 900000 },
        { model: 'permitlocks' },
        { model: 'aptypes' },
        { model: 'bmtypes' },
        { model: 'bttypes' },
        { model: 'cstypes' },
        { model: 'fgtypes' },
        { model: 'fmtypes' },
        { model: 'grtypes' },
        { model: 'gstypes' },
        { model: 'gvtypes' },
        { model: 'gytypes' },
        { model: 'lstypes' },
        { model: 'tbtypes' },
        { model: 'tbsubtypes' },
        { model: 'tbcycles' },
        { model: 'tsstatuses' },
        { model: 'twtypes' },
      ],
    },
  },
});
