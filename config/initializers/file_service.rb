require 'file_service/api'
require 'file_service/api/test_client'

FileService::API.configure do |config|
  config.host = "http://localhost:3001/api/v3/"
  config.notifier = Proc.new { | error| Services.for(:error_notification).notify(error)}
end
