# config/initializers/slack.rb

require 'slack-ruby-client'

Slack.configure do |config|
  config.token = 'xoxb-4806305733-6827226971729-IYvchweCXXvkIB1869r6q71s'
end

# Optionally, you can also specify other configuration options here if needed
