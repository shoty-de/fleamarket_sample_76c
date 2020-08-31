require 'rails_helper'

describe Address do
  describe "#create" do
    it "post_family_name, post_family_name_kana, post_first_name, post_first_name_kana, postal_code, prefecture_id, city, addressが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "post_family_nameがない場合は登録できないこと" do
      address = build(:address, post_family_name: nil)
      address.valid?
      expect(address.errors[:post_family_name]).to include("can't be blank")
    end

    it "post_family_name_kanaがない場合は登録できないこと" do
      address = build(:address, post_family_name_kana: nil)
      address.valid?
      expect(address.errors[:post_family_name_kana]).to include("can't be blank")
    end

    it "post_first_nameがない場合は登録できないこと" do
      address = build(:address, post_first_name: nil)
      address.valid?
      expect(address.errors[:post_first_name]).to include("can't be blank")
    end

    it "post_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, post_first_name_kana: nil)
      address.valid?
      expect(address.errors[:post_first_name_kana]).to include("can't be blank")
    end

    it "post_family_nameが全角文字でない場合は登録できないこと" do
      address = build(:address, post_family_name: "Test")
      address.valid?
      expect(address.errors[:post_family_name]).to include("is invalid")
    end

    it "post_family_name_kanaが全角文字でない場合は登録できないこと" do
      address = build(:address, post_family_name_kana: "Test")
      address.valid?
      expect(address.errors[:post_family_name_kana]).to include("is invalid")
    end

    it "post_first_nameが全角文字でない場合は登録できないこと" do
      address = build(:address, post_first_name: "Taro")
      address.valid?
      expect(address.errors[:post_first_name]).to include("is invalid")
    end

    it "post_first_name_kanaが全角文字でない場合は登録できないこと" do
      address = build(:address, post_first_name_kana: "Taro")
      address.valid?
      expect(address.errors[:post_first_name_kana]).to include("is invalid")
    end

    it "postal_codeが半角数字で[3桁]-[4桁]でない場合は登録できないこと" do
      address = build(:address, postal_code: "1500044")
      address.valid?
      expect(address.errors[:postal_code]).to include("is invalid")
    end

    it "postal_codeに全角文字が使われている場合は登録できないこと" do
      address = build(:address, postal_code: "１５０-００４４")
      address.valid?
      expect(address.errors[:postal_code]).to include("is invalid")
    end
  end
end
