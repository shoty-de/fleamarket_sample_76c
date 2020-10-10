require 'rails_helper'

describe Product do
  describe '#create' do 
    it "titleがない場合は登録できないこと" do
      product = build(:product, title: nil)
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end

    it "textがない場合は登録できないこと" do
      product = build(:product, text: nil)
      product.valid?
      expect(product.errors[:text]).to include("can't be blank")
    end

    it "conditionがない場合は登録できないこと" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "shipping_chargeがない場合は登録できないこと" do
      product = build(:product, shipping_charge: nil)
      product.valid?
      expect(product.errors[:shipping_charge]).to include("can't be blank")
    end

    it "deliver_leadtimeがない場合は登録できないこと" do
      product = build(:product, deliver_leadtime: nil)
      product.valid?
      expect(product.errors[:deliver_leadtime]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "prefectureがない場合は登録できないこと" do
      product = build(:product, prefecture: nil)
      product.valid?
      expect(product.errors[:prefecture]).to include("can't be blank")
    end

  end
end