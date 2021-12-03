require 'rollbar'

Rollbar.configure do |config|
  config.access_token = 'bd6a06d6487945d3a9fb562fe1c41e49'
end

Rollbar.info("Hello world!")

begin


  # Overwrites any existing person data
  notifier = Rollbar.scope({
    :person => {:id => "user.id", :username => "user.username", :email => "user.email"},
    :random => "context_data"
  })


  notifier.critical('this is a critical error')
  
  notifier = Rollbar.scope({
    :person => {:id => "", :username => "", :email => ""},
  })
  #notifier.critical(e)
  p notifier.scope

  # No associated person data
  notifier.info('This should not contain person data')

end
