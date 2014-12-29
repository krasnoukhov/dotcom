require "bundler"
Bundler.require

run Rack::Jekyll.new(destination: "_site", auto: true)
