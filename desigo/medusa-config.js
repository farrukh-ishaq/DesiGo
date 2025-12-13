const { loadEnv, defineConfig } = require('@medusajs/framework/utils');

loadEnv(process.env.NODE_ENV || 'development', process.cwd());

module.exports = defineConfig({
  projectConfig: {
    databaseDriverOptions: process.env.NODE_ENV !== 'development'
      ? {
        connection: { ssl: { rejectUnauthorized: false } },
      }
      : {},
    databaseUrl: process.env.DATABASE_URL,
    http: {
      storeCors: process.env.STORE_CORS,
      adminCors: process.env.ADMIN_CORS,
      authCors: process.env.AUTH_CORS,
      jwtSecret: process.env.JWT_SECRET || 'supersecret',
      cookieSecret: process.env.COOKIE_SECRET || 'supersecret',
    },
    admin: {
      path: "/app",
      backendUrl: "http://localhost:9000",
      sources: {
        admin: {
          path: "./src/admin",
        },
      },
    }
  },
});
