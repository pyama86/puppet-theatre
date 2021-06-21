require 'slack/incoming/webhooks'

module PuppetTheatre
  module Notifiers
    class Slack < Base
      def call(msg)
        %w[url channel username].each do |t|
          raise "#{t} is required for slack" unless config[t.to_sym]
        end

        slack = Slack::Incoming::Webhooks.new config[:url], channel: config[:channel],
                                                            username: config[:user_name]
        attachments = {
          color: '#36a64f',
          title: 'Puppet Teatre'
        }
        slack.post msg, attachments: [attachments]
      end
    end
  end
end
