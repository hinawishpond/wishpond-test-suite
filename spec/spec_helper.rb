$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'production').to_sym
raise "Configuration file '#{ENVIRONMENT}.yml' under lib/config missing" unless File.exists? "#{File.dirname(__FILE__)}/../lib/config/#{ENVIRONMENT}.yml"

require 'watir-webdriver'
require 'rspec'
require 'page_helper'
require 'env_config'
require 'wishpond'
require 'pages'

browser ||= Watir::Browser.new :firefox

RSpec.configure do |config|

  config.include PageHelper
  config.before(:each) do
    @browser = browser
    Wishpond.browser = @browser
  end
  config.after(:suite) { browser.close }
end
