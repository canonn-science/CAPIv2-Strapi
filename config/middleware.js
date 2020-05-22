module.exports = {
  settings: {
    sentry: {
      enabled: true,
    },
    cache: {
      enabled: false
    },
    parser: {
      enabled: true,
      multipart: true,
      formLimit: '128mb',
      jsonLimit: '256mb',
    },
    gzip: {
      enabled: true,
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
      headers: [
        'Content-Type',
        'Authorization',
        'X-Frame-Options',
        'Origin',
        'Accept',
      ],
    },
  },
};
