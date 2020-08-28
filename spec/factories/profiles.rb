FactoryBot.define do
  factory :profile do
    user
    family_name      {"てすと"}
    family_name_kana {"テスト"}
    first_name       {"太郎"}
    first_name_kana  {"タロウ"}
    birthday         {2000/1/1}
  end
end
