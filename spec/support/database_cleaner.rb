# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
    Rails.application.load_seed
  end

  config.around do |example|
    DatabaseCleaner.cleaning { example.run }
  end
end
