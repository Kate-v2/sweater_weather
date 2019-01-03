Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false # In the development environment your application's code is reloaded on   # every request. This slows down response time but is perfect for development   # since you don't have to restart the web server when you make code changes.
  config.eager_load = false   # Do not eager load code on boot.
  config.consider_all_requests_local = true # Show full error reports.

  # Enable/disable caching. By default caching is disabled.  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.active_storage.service = :local # Store uploaded files on the local file system (see config/storage.yml for options)
  config.action_mailer.raise_delivery_errors = false # Don't care if the mailer can't send.
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log # Print deprecation notices to the Rails logger.
  config.active_record.migration_error = :page_load # Raise an error on page load if there are pending migrations.
  config.active_record.verbose_query_logs = true # Highlight code that triggered database queries in logs.
  config.assets.debug = true # Debug mode disables concatenation and preprocessing of assets. # This option may cause significant delays in view rendering with a large # number of complex assets.
  config.assets.quiet = true # Suppress logger output for asset requests.
  # Raises error for missing translations # config.action_view.raise_on_missing_translations = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker # Use an evented file watcher to asynchronously detect changes in source code, # routes, locales, etc. This feature depends on the listen gem.
end

# https://stackoverflow.com/questions/18823532/fake-ip-for-geocoder-in-development-environment
# class ActionController::Request
#   def remote_ip
#     "68.64.216.134"
#   end
# end
