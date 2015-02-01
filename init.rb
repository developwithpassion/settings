require 'bundler'
Bundler.setup

['../lib'].each do |path|
  dir = File.expand_path(path, __FILE__)
  $LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)
end

require 'initializer'
require 'settings'
