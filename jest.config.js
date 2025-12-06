module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  roots: ['<rootDir>/src', '<rootDir>/packages'],
  testMatch: ['**/__tests__/**/*.ts', '**/?(*.)+(spec|test).ts'],
  transform: {
    '^.+\\.ts$': 'ts-jest'
  },
  moduleNameMapper: {
    '^@desigo/shared$': '<rootDir>/packages/shared/src',
    '^@desigo/shared/(.*)$': '<rootDir>/packages/shared/src/$1',
    '^@desigo/config-eslint$': '<rootDir>/packages/config-eslint',
    '^@desigo/config-tsconfig$': '<rootDir>/packages/config-tsconfig',
    '^@desigo/config-jest$': '<rootDir>/packages/config-jest'
  },
  collectCoverageFrom: [
    'src/**/*.{ts,js}',
    'packages/**/*.{ts,js}',
    '!**/node_modules/**',
    '!**/dist/**',
    '!**/*.d.ts'
  ]
};
