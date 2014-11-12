require 'date'
require 'active_support/all'

# Project specific .irbrc support. Thanks go out to:
# http://www.samuelmullen.com/2010/04/irb-global-local-irbrc/
def load_irbrc(path)
  return if (path == ENV['HOME']) || (path == '/')

  load_irbrc(File.dirname path)
  irbrc = File.join(path, '.irbrc')
  load irbrc if File.exists?(irbrc)
end

load_irbrc Dir.pwd

puts 'Have a nice day!'

