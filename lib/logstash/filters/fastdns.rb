# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This example filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::FastDns < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   fastdns {
  #     reverse => "ip"
  #   }
  # }
  #
  config_name "fastdns"

  # Replace the message with this value.
  config :reverse, :validate => :string, :default => []


  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    event["reverse"] = "my_host"

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Example