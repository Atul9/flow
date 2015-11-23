require 'sinatra'
require 'json'

helpers do
  def payload_request
    body = request.body.read
    [
      200,
      {
        "Content-Type" => "application/json",
        "X-Request-Method" => request.env['REQUEST_METHOD']
      },
      {
        "args" => params,
        "data" => body,
        "json" => JSON.load(body)
      }.to_json
    ]
  end
end

get('/') do
  [
    200,
    {
      "Content-Type": "application/json",
      "X-Request-Method" => request.env['REQUEST_METHOD']
    },
    {
      "args" => params
    }.to_json
  ]
end

post('/') do
  payload_request
end

patch('/') do
  payload_request
end

delete('/') do
  payload_request
end

put('/') do
  payload_request
end

options('/') do
  [
    200,
    {
      "X-Request-Method" => request.env['REQUEST_METHOD']
    },
    nil
  ]
end

head('/') do
  [
    200,
    {
      "X-Request-Method" => request.env['REQUEST_METHOD']
    },
    nil
  ]
end

get('/txt') do
  [
    200,
    {"Content-Type" => "text/plain"},
    "User: #{params['user']}"
  ]
end

post('/form') do
  [
    200,
    {"Content-Type" => "application/json"},

    {
      "args" => params,
      "data" => request.body.read,
      "json" => params
    }.to_json
  ]
end