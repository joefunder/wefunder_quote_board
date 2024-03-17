# config/initializers/slack.rb

require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

# Optionally, you can also specify other configuration options here if needed
