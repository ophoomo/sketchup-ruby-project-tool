
require 'sketchup.rb'
require 'extensions.rb'

module Thanaphoom
  module Test
    PLUGIN_NAME     = 'Test'.freeze
    PLUGIN_VERSION  = '1.0.0'.freeze
    unless file_loaded?( __FILE__ )
      extension = SketchupExtension.new( PLUGIN_NAME, 'Test/loader' )
      extension.version     = PLUGIN_VERSION
      extension.copyright   = 'Copyright 2020 Thanaphoom All Rights Reserved'
      extension.creator     = 'Thanaphoom'
	  extension.description     = "Test Plugin Sketchup"
      Sketchup.register_extension( extension, true )
    end
  end
end
file_loaded( __FILE__ )