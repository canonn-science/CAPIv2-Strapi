module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'strapi'),
      user: env('DATABASE_USERNAME', 'strapi'),
      password: env('DATABASE_PASSWORD', 'strapi'),
      ssl: env.bool('DATABASE_SSL', false),
    },
    debug: env.bool('DATABASE_DEBUG', true),
    acquireConnectionTimeout: env.int('DATABASE_TIMEOUT', 100000),
    pool: env.json('DATABASE_POOL', {
      min: 0,
      max: 20,
      createTimeoutMillis: 30000,
      acquireTimeoutMillis: 600000,
      idleTimeoutMillis: 30000,
    }),
  },
});
