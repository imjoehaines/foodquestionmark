const db = require('sqlite')
const morgan = require('morgan')
const express = require('express')
const bodyParser = require('body-parser')

const app = express()

app.use(bodyParser.json())
app.use(morgan('combined'))
app.use(express.static(`${__dirname}/../public`))

app.get('/api/restaurants', async (request, response, next) => {
  const restaurants = await db.all('SELECT id, name FROM restaurant')

  response.json(restaurants)
})

db.open(`${__dirname}/../db.sqlite`)
.then(_ => db.migrate({
  force: process.env.NODE_ENV === 'production' ? false : 'last'
}))
.then(_ => app.listen(8000))
.catch(err => console.error(err))
