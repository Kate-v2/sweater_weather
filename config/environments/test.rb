Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes              = true # The test environment is used exclusively to run your application's   # test suite. You never need to work with it otherwise. Remember that   # your test database is "scratch space" for the test suite and is wiped  # and recreated between test runs. Don't rely on the data there!
  config.eager_load                 = false # Do not eager load code on boot. This avoids loading your whole application # just for the purpose of running a single test. If you are using a tool that # preloads Rails for running tests, you may have to set it to true.
  config.public_file_server.enabled = true # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  config.consider_all_requests_local                = true # Show full error reports and disable caching.
  config.action_controller.perform_caching          = false
  config.action_dispatch.show_exceptions            = false # Raise exceptions instead of rendering exception templates.
  config.action_controller.allow_forgery_protection = false # Disable request forgery protection in test environment.
  config.active_storage.service                     = :test # Store uploaded files on the local file system in a temporary directory
  config.action_mailer.perform_caching              = false
  config.action_mailer.delivery_method              = :test # Tell Action Mailer not to deliver emails to the real world.   # The :test delivery method accumulates sent emails in the # ActionMailer::Base.deliveries array.
  config.active_support.deprecation                 = :stderr # Print deprecation notices to the stderr.

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end

# https://stackoverflow.com/questions/18823532/fake-ip-for-geocoder-in-development-environment
# class ActionController::Request
#   def remote_ip
#     "68.64.216.134"
#   end
# end
