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
