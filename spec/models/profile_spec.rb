require 'rails_helper'

describe Profile do
  describe "#create" do
    it "family_name, family_name_kana, first_name, first_name_kana, birthdayが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it "family_nameがない場合は登録できないこと" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birthdayがない場合は登録できないこと" do
      profile = build(:profile, birthday: nil)
      profile.valid?
      expect(profile.errors[:birthday]).to include("can't be blank")
    end

    it "family_nameが全角文字でない場合は登録できないこと" do
      profile = build(:profile, family_name: "Test")
      profile.valid?
      expect(profile.errors[:family_name]).to include("is invalid")
    end

    it "family_name_kanaが全角文字でない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: "Test")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("is invalid")
    end

    it "first_nameが全角文字でない場合は登録できないこと" do
      profile = build(:profile, first_name: "Taro")
      profile.valid?
      expect(profile.errors[:first_name]).to include("is invalid")
    end

    it "first_name_kanaが全角文字でない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "Taro")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("is invalid")
    end
  end
end
