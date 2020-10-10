FactoryBot.define do
  factory :product do
    title               {"テスト"}
    text                {"テスト"}
    condition_id        {1}
    shipping_charge_id  {1}
    deliver_leadtime_id {1}
    price               {99999}
    prefecture_id       {13}
  end

end
