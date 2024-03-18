class SlackEventsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token, only: :handle_event
  
    def handle_event
      begin
        payload = JSON.parse(request.body.read) unless request.body.read.blank?

        if payload.nil?
            render json: { status: 'no_payload' }
            return
        end

        event_type = payload['type']

        case event_type
        when 'url_verification'
          render json: { challenge: payload['challenge'] }
        when 'event_callback'
          handle_event_callback(payload['event'])
        else
          render json: { status: 'ok' }
        end
      rescue => e
        Rails.logger.error "Error handling Slack event: #{e.message}"
        Rails.logger.error payload
        render json: { error: 'Internal Server Error' }, status: :internal_server_error
        return
      end
    end
  
    private
  
    def handle_event_callback(event)
      puts '--------'
      puts event['text']
      case event['type']
      when 'message'
        handle_message_event(event)
      when 'user_typing'
        handle_user_typing_event(event)
      # Add more event handlers as needed
      else
        # Handle other event types or ignore unknown events
      end
    end
  
    def handle_message_event(event)
      puts '----- refreshing ----'
      render json: { status: 'ok', refresh: true }
      return
    end
  
    def handle_user_typing_event(event)
      # Logic to handle user typing events
      # Extract user information, channel, etc.
      # Perform any necessary actions based on the user typing event
    end
  end
  