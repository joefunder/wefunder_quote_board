# app/controllers/quotes_controller.rb
class QuotesController < ApplicationController
    def index
        @slack_service = SlackService.new
        @quotes = @slack_service.fetch_quotes('C06PJ0LG7RD')
    end
  end
  