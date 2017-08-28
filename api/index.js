const Hapi = require('hapi')
const db = require('sqlite')

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
  handler: async (request, reply) => {
    const restaurants = await db.all('SELECT id, name FROM restaurant')

    reply(restaurants)
  }
})

server.on('request-error', (request, err) => console.error(err))

db.open(`${__dirname}/../db.sqlite`)
  .then(_ => db.migrate({
    force: process.env.NODE_ENV === 'production' ? false : 'last'
  }))
  .then(_ =>
    server.start(err => {
      if (err) throw err

      console.log('Server running at:', server.info.uri)
    })
  )
  .catch(err => console.error(err))
