// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');

// Create DynamoDB service object
var ddb = new AWS.DynamoDB({apiVersion: '2012-08-10'});

const queryTable = (tableName, id) => {
  var params = {
    ExpressionAttributeValues: {
      ':id': {S: id}
    },
    KeyConditionExpression: 'id = :id',
    TableName: tableName
  };

  return ddb.query(params).promise();
}

module.exports = { queryTable }

