# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
# Constants config
ENV['MAX_LOGIN_ATTEMPTS'] = '3'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
