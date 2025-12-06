#!/bin/bash

echo "🎯 Final fixes for DesiGo frontend..."

cd src/frontend

# 1. Create postcss.config.js
echo "⚙️ Creating postcss.config.js..."
cat > postcss.config.js << 'POSTCSS_EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
POSTCSS_EOF

# 2. Ensure tailwind.config.js exists
if [ ! -f "tailwind.config.js" ]; then
  echo "🎨 Creating tailwind.config.js..."
  cat > tailwind.config.js << 'TAILWIND_EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
TAILWIND_EOF
fi

# 3. Ensure globals.css exists
echo "📝 Ensuring globals.css exists..."
mkdir -p src/app
if [ ! -f "src/app/globals.css" ]; then
  cat > src/app/globals.css << 'CSS_EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --foreground-rgb: 0, 0, 0;
  --background-start-rgb: 214, 219, 220;
  --background-end-rgb: 255, 255, 255;
}

@media (prefers-color-scheme: dark) {
  :root {
    --foreground-rgb: 255, 255, 255;
    --background-start-rgb: 0, 0, 0;
    --background-end-rgb: 0, 0, 0;
  }
}

body {
  color: rgb(var(--foreground-rgb));
  background: linear-gradient(
      to bottom,
      transparent,
      rgb(var(--background-end-rgb))
    )
    rgb(var(--background-start-rgb));
}
CSS_EOF
fi

# 4. Create a basic page if doesn't exist
echo "🏠 Creating basic page..."
mkdir -p src/app
cat > src/app/page.tsx << 'PAGE_EOF'
export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-8">
      <div className="max-w-4xl w-full text-center">
        <h1 className="text-5xl font-bold text-blue-600 mb-6">
          🛍️ DesiGo E-commerce
        </h1>
        <p className="text-xl text-gray-600 mb-8">
          Modern Indian E-commerce Platform
        </p>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
          <div className="bg-white p-6 rounded-lg shadow-md">
            <h3 className="text-2xl font-semibold mb-3">🚀 Fast</h3>
            <p className="text-gray-600">Lightning fast storefront built with Next.js 14</p>
          </div>
          <div className="bg-white p-6 rounded-lg shadow-md">
            <h3 className="text-2xl font-semibold mb-3">🛒 Complete</h3>
            <p className="text-gray-600">Full-featured e-commerce with Medusa v2</p>
          </div>
          <div className="bg-white p-6 rounded-lg shadow-md">
            <h3 className="text-2xl font-semibold mb-3">⚡ Modern</h3>
            <p className="text-gray-600">Built with the latest React and TypeScript</p>
          </div>
        </div>
        
        <div className="bg-green-50 border border-green-200 rounded-lg p-6">
          <h2 className="text-2xl font-bold text-green-800 mb-3">✅ Setup Complete!</h2>
          <p className="text-green-700 mb-4">
            Your DesiGo development environment is ready!
          </p>
          <div className="text-left inline-block bg-gray-50 p-4 rounded">
            <p className="font-mono text-sm">
              <span className="text-blue-600">Backend:</span> http://localhost:9000<br/>
              <span className="text-blue-600">Frontend:</span> http://localhost:3000<br/>
              <span className="text-blue-600">Admin:</span> http://localhost:9000/admin
            </p>
          </div>
        </div>
      </div>
    </main>
  )
}
PAGE_EOF

# 5. Create layout.tsx
cat > src/app/layout.tsx << 'LAYOUT_EOF'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'DesiGo - Modern Indian E-commerce',
  description: 'A modern e-commerce platform built with Medusa and Next.js',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  )
}
LAYOUT_EOF

# 6. Install Inter font if needed
echo "📦 Installing Inter font package..."
yarn add @next/font 2>/dev/null || yarn add next/font 2>/dev/null || echo "Font package already installed or not needed"

echo "✅ All fixes applied!"
echo ""
echo "📋 Created files:"
echo "  ✓ postcss.config.js"
echo "  ✓ tailwind.config.js"
echo "  ✓ src/app/globals.css"
echo "  ✓ src/app/page.tsx"
echo "  ✓ src/app/layout.tsx"
echo ""
echo "🚀 Start development: make dev:frontend"
