module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DATABASE_HOST_DEV', '127.0.0.1'),
        port: env.int('DATABASE_PORT_DEV', 3306),
        database: env('DATABASE_NAME_DEV', 'capiv2_base'),
        username: env('DATABASE_USERNAME_DEV', 'capiv2system'),
        password: env('DATABASE_PASSWORD_DEV', 'capiv2password'),
      },
      options: {
        debug: env.bool('DATABASE_DEBUG_DEV', false),
        acquireConnectionTimeout: env.int('DATABASE_TIMEOUT_DEV', 100000),
        pool: env.json('DATABASE_POOL_DEV', {
          min: 0,
          max: 50,
          createTimeoutMillis: 30000,
          acquireTimeoutMillis: 600000,
          idleTimeoutMillis: 30000
        })
      }
    },
    users: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DATABASE_HOST_USER', '127.0.0.1'),
        port: env.int('DATABASE_PORT_USER', 3306),
        database: env('DATABASE_NAME_USER', 'capiv2_user'),
        username: env('DATABASE_USERNAME_USER', 'capiv2system'),
        password: env('DATABASE_PASSWORD_USER', 'capiv2password'),
      },
      options: {
        debug: env.bool('DATABASE_DEBUG_USER', false),
        acquireConnectionTimeout: env.int('DATABASE_TIMEOUT_USER', 100000),
        pool: env.json('DATABASE_POOL_USER', {
          min: 0,
          max: 20,
          createTimeoutMillis: 30000,
          acquireTimeoutMillis: 600000,
          idleTimeoutMillis: 30000
        })
      }
    }
  }
});
