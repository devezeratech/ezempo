# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(metronic.css metronic.js devise.js devise.css metronic/layouts/layout2/img/* metronic/layouts/layout/img/* metronic/global/img/* metronic/global/plugins/font-awesome/fonts/* metronic/global/plugins/simple-line-icons/fonts/* )
