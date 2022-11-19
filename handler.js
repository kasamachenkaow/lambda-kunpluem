const { queryTable } = require('./ddb-query')

const hello = async (event, context, callback) => {
  console.log('hello world')
  console.log({ event: JSON.stringify(event, null, 2) })

  const { tableName } = process.env
  const { body } = event.Records[0]
  const payload = JSON.parse(body)
  const { id } = payload

  const data = await queryTable(tableName, id)

  console.log({ data: JSON.stringify(data, null, 2) })

  if (data.Items.length === 0) {
    throw new Error('no data')
  }

  callback(null, {
    status: 200,
    body: "hello world",
    event,
    context,
    env: process.env.tableName,
    data
  })
}

module.exports = { hello }
