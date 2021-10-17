const express = require('express')
const app = express()

const cors = require('cors')
const router = require('./network/routes')

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({
    extended: false
}))

router(app)

app.listen(4000, function () {
    console.log('El servidor funciona en el http://localhost:4000')
})
