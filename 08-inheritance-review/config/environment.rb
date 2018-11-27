# Dir[File.join(File.dirname(__FILE__), '../lib', '*.rb')].sort.each { |f| require f }

require 'pry'
require 'require_all'
require_all 'lib' # bug where it pulls it in alphabetically
