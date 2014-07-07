require 'env_config'
require 'quoth'

module Wishpond

  extend PageHelper
  extend RSpec::Expectations
  extend RSpec::Matchers

  class << self; attr_accessor :browser end

  SITE = :wishpond
  TITLE = 'Wishpond Central'
  BASE_URL = EnvConfig.get SITE, :url
  USERNAME = EnvConfig.get :username
  PASSWORD = EnvConfig.get :password

  def self.random_string
    Quoth.get
  end

  def self.ensure_logged_in
    visit Wishpond::LoginPage do |page|
      return if page.logged_in?
      page.login_with USERNAME, PASSWORD
      page.should be_logged_in
    end
  end


end
