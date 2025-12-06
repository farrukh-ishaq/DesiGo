#!/usr/bin/env node

import { execa } from 'execa';
import ora from 'ora';

const spinner = ora();

async function deployLocal() {
  console.log('🚀 Setting up DesiGo local development...\n');
  
  try {
    // Start Docker Compose for DB
    spinner.start('Starting DesiGo services...');
    await execa('docker-compose', ['up', '-d']);
    spinner.succeed('DesiGo services started');
    
    // Install dependencies if needed
    spinner.start('Checking dependencies...');
    await execa('npm', ['install']);
    spinner.succeed('Dependencies installed');
    
    console.log('\n✅ DesiGo setup complete!');
    console.log('\n📱 Start development servers:');
    console.log('  Backend: npm run dev:backend');
    console.log('  Frontend: npm run dev:frontend');
    console.log('\n🌐 Access URLs:');
    console.log('  Storefront: http://localhost:3000');
    console.log('  Backend API: http://localhost:9000');
    console.log('  Admin Panel: http://localhost:9000/admin');
    console.log('\n🐳 Docker Services:');
    console.log('  PostgreSQL: localhost:5432 (user: desigo, pass: desigo123)');
    console.log('  Redis: localhost:6379');
    console.log('\n🔧 Commands:');
    console.log('  make docker-down    - Stop all services');
    console.log('  make logs          - View service logs');
    console.log('  make db:migrate    - Run database migrations');
    console.log('  make db:seed       - Seed database with sample data');
    
  } catch (error) {
    spinner.fail('DesiGo setup failed');
    console.error(error.message);
    process.exit(1);
  }
}

deployLocal();
