const { loadEnv, defineConfig } = require('@medusajs/framework/utils')

loadEnv(process.env.NODE_ENV || 'development', process.cwd())

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL || 'postgresql://desigo:desigo123@localhost:5432/desigo',
    redisUrl: process.env.REDIS_URL || 'redis://localhost:6379',
    http: {
      storeCors: process.env.STORE_CORS || 'http://localhost:3000',
      adminCors: process.env.ADMIN_CORS || 'http://localhost:7001',
      authCors: process.env.AUTH_CORS || 'http://localhost:9000',
      jwtSecret: process.env.JWT_SECRET || 'supersecret',
      cookieSecret: process.env.COOKIE_SECRET || 'supersecret',
      port: parseInt(process.env.PORT || '9000')
    }
  }
})
