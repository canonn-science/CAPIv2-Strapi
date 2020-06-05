module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DATABASE_HOST_PROD', '127.0.0.1'),
        port: env.int('DATABASE_PORT_PROD', 3306),
        database: env('DATABASE_NAME_PROD', 'capiv2_base'),
        username: env('DATABASE_USERNAME_PROD', 'capiv2system'),
        password: env('DATABASE_PASSWORD_PROD', 'capiv2password'),
      },
      options: {
        debug: env.bool('DATABASE_DEBUG_PROD', false),
        acquireConnectionTimeout: env.int('DATABASE_TIMEOUT_PROD', 100000),
        pool: env.json('DATABASE_POOL_PROD', {
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
