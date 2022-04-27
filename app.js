const process = require('process');

let isNative = false
if (process.env.NATIVE === "true") {
    isNative = true
}
console.log('isNative', isNative)

let { Client } = isNative ? require('pg').native : require('pg');
const client = new Client()

console.log(client)

client.connect()

// Get date
client.query('SELECT NOW()', (err, res) => {
    console.log(err ? err.stack : res.rows[0].now)
    client.end()
})






