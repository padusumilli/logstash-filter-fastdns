require 'spec_helper'
require "logstash/filters/example"

describe LogStash::Filters::FastDns do
  describe "Fast resolve dns with caching" do
    let(:config) do <<-CONFIG
      filter {
        fastdns {
          reverse => "10.10.10.10"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject['message']).to eq('Hello World')
    end
  end
end
