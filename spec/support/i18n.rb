# Expose `I18n.t` and `I18n.l` methods in specs:
RSpec.configure do |config|
  config.include AbstractController::Translation
end
