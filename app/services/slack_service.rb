# app/services/slack_service.rb
class SlackService
    def initialize
        @client = Slack::Web::Client.new
        @client.auth_test
    end
  
    def fetch_quotes(channel_id)
        messages = @client.conversations_history(channel: channel_id).messages

        # Filter out non-regular messages
        messages.reject! { |message| !message.subtype.nil? }
        
        messages.map { |msg| msg.text if msg.text }.compact
    end
end