# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This filter will parse the authlog lines into structured data
#

class LogStash::Filters::Authlog < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   authlog {
  #
  #   }
  # }
  #
  config_name "authlog"
  
  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello cici!"
  

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)

    if @message
      # Replace the event message with our message as configured in the
      # config file.
      event["message"] = event["message"]
      event['miss'] = @message
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Example
