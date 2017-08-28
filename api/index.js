const Hapi = require('hapi')

const server = new Hapi.Server()
server.connection({ port: 8000 })

server.register(require('inert'), err => {
  if (err) throw err

  server.route({
    method: 'GET',
    path: '/index.js',
    handler: (request, reply) => reply.file(`${__dirname}/../public/index.js`)
  })

  server.route({
    method: 'GET',
    path: '/',
    handler: (request, reply) => reply.file(`${__dirname}/../public/index.html`)
  })
})

server.route({
  method: 'GET',
  path: '/api/restaurants',
  handler: (request, reply) => reply([
    {
      id: 1,
      name: 'Food Place'
    },
    {
      id: 2,
      name: 'Other Food Place'
    }
  ])
})

server.start(err => {
  if (err) throw err

  console.log('Server running at:', server.info.uri)
})
