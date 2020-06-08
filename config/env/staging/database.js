module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DATABASE_HOST_STAG', '127.0.0.1'),
        port: env.int('DATABASE_PORT_STAG', 3306),
        database: env('DATABASE_NAME_STAG', 'capiv2_base'),
        username: env('DATABASE_USERNAME_STAG', 'capiv2system'),
        password: env('DATABASE_PASSWORD_STAG', 'capiv2password'),
      },
      options: {
        debug: env.bool('DATABASE_DEBUG_STAG', false),
        acquireConnectionTimeout: env.int('DATABASE_TIMEOUT_STAG', 100000),
        pool: env.json('DATABASE_POOL_STAG', {
          min: 0,
          max: 50,
          createTimeoutMillis: 30000,
          acquireTimeoutMillis: 600000,
          idleTimeoutMillis: 30000
        })
      }
    }
  }
});
