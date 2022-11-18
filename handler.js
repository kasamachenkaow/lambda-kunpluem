const hello = (event, context, callback) => {
  console.log('hello world')

  console.log({ event, context })

  callback(null, {
    status: 200,
    body: "hello world"
  })
}

module.exports = { hello }
