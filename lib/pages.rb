require 'pages/generic_base_page'
Dir["#{File.dirname(__FILE__)}/pages/*/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }
