FactoryBot.define do
  factory :address do
    post_family_name        {"てすと"}
    post_family_name_kana   {"テスト"}
    post_first_name         {"太郎"}
    post_first_name_kana    {"タロウ"}
    postal_code             {"150-0044"}
    prefecture_id           {13}
    city                    {"渋谷区"}
    address                 {"円山町19番1号渋谷プライムプラザ12階"}

    user
  end
end
