Wordnik.configure do |config|
  config.api_key = 'b7d846064e0493714100606814f0ce2398ec81c4da9bee26a'               # required
  config.username = 'awanderingorill'                    # optional, but needed for user-related functions
  config.password = 'a5aca5a'               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end