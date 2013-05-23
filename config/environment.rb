# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Winston::Application.initialize!

unless Rails.env.production?
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")
  ENV['AWS_ACCESS_KEY_ID'] = credentials['AWS_ACCESS_KEY_ID']
  ENV['AWS_SECRET_ACCESS_KEY'] = credentials['AWS_SECRET_ACCESS_KEY']
  ENV['S3_BUCKET_NAME'] = credentials['S3_BUCKET_NAME']
end
