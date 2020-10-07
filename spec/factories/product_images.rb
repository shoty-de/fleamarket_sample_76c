FactoryBot.define do
  factory :product_image do
    image  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end

end