require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ACom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #タイムゾーンを東京に合わせる
     config.time_zone = "Tokyo"
    # データベースが動作するサーバーのタイムゾーンに設定
     config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")

  config.i18n.default_locale = :ja
  config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]
  end
end
