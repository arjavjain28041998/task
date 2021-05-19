require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Taskproject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.hosts << "8f53e31fcc9e.ngrok.io"
    config.load_defaults 6.1


    # RSpotify::authenticate("20498203a9d14a308a4040c5c2b09c80", "2c741744365b49e39748c6b4a0a616e3")
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
