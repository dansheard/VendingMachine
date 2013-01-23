#### Dan's Vending Machine ####
#
# Launch this Ruby file from the command line
# to get started.
#

APP_ROOT = File.dirname(__FILE__)

require "#{APP_ROOT}/lib/interface.rb"
# Instantiate a new vending machine object and
# call the launch method.
interface = Interface.new
interface.main


