require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SanbikaEdit
  class Application < Rails::Application
    config.assets.paths << "#{Rails}/vendor/assets/fonts"


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # config.time_zone = 'Central Time (US & Canada)'
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.active_record.raise_in_transactional_callbacks = true
  end
end
