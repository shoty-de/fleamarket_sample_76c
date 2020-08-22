FactoryBot.define do
  factory :profile do
    user
    family_name      {"てすと"}
    family_name_kana {"テスト"}
    first_name       {"太郎"}
    first_name_kana  {"タロウ"}
    birthday         {1}
    birthmonth       {1}
    birthyear        {1999}
  end
end
