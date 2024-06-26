# frozen_string_literal: true

require 'sentry-ruby'
require 'stackprof'

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', nil)
  config.traces_sample_rate = 1.0
  config.traces_sampler = ->(_context) { true }
  config.profiles_sample_rate = 1.0
  config.environment = 'production'
  config.release = File.read('VERSION').gsub('v', '')
end
