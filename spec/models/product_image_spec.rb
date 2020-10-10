require 'rails_helper'

describe ProductImage do
  describe '#create' do 
    it "product_imageがない場合は登録できないこと" do
      product_image = build(:product_image, image: nil)
      product_image.valid?
      expect(product_image.errors[:image]).to include("can't be blank")
    end

  end
end