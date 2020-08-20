# レディース
lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']

parent = Category.create(name: 'レディース')
lady_child_array.each do |child|
  child = parent.children.create(name: child)
end

# メンズ
mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他']

parent = Category.create(name: 'メンズ')
mens_child_array.each do |child|
  child = parent.children.create(name: child)
end

# ベビー・キッズ
kids_child_array = ['ベビー服（女の子用）~95cm','ベビー服（男の子用）~95cm','ベビー服（男女兼用）~95cm','ベビー服（女の子用）~100cm','ベビー服（男の子用）~100cm','ベビー服（男女兼用）~100cm','キッズ靴','子供用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/寝室用品','おもちゃ','行事記念品']

parent = Category.create(name: 'ベビー・キッズ')
kids_child_array.each do |child|
  child = parent.children.create(name: child)
end

# インテリア・住まい・子供
interior_child_array = ['キッチン/食器','ベット/マットレス','ソファ/ソファベット','椅子/チェア','机/テーブル','収納家具','ラグ/カーペット/マット','カーテン/ブラインド','ライト/照明','寝具','インテリア小物','季節/年中行事','その他']

parent = Category.create(name: 'インテリア・住まい・子供')
interior_child_array.each do |child|
  child = parent.children.create(name: child)
end

# 本・音楽・ゲーム
amusement_child_array = ['本','漫画','雑誌','CD','DVD/ブルーレイ','レコード','テレビゲーム']

parent = Category.create(name: '本・音楽・ゲーム')
amusement_child_array.each do |child|
  child = parent.children.create(name: child)
end

# おもちゃ・ホビー・グッズ
hobby_child_array = ['おもちゃ','タレントグッズ','コミック/アニメグッズ','トレーディングカード','フィギュア','楽器/機材','コレクション','ミリタリー','美術品','アート用品','その他']

parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
hobby_child_array.each do |child|
  child = parent.children.create(name: child)
end

# コスメ・香水・美容
beauty_child_array = ['ベースメイク','メイクアップ','ネイルケア','香水','スキンケア/基礎化粧品','ヘアケア','ボディケア','オーラルケア','リラクゼーション','ダイエット','その他']

parent = Category.create(name: 'コスメ・香水・美容')
beauty_child_array.each do |child|
  child = parent.children.create(name: child)
end

# 家電・スマホ・カメラ
appliances_child_array = ['スマートフォン/携帯電話','スマホアクセサリー','PC/タブレット','カメラ','テレビ/映像機器','オーディオ機器','美容/健康','冷暖房/空調','生活家電','その他']

parent = Category.create(name: '家電・スマホ・カメラ')
appliances_child_array.each do |child|
  child = parent.children.create(name: child)
end

# スポーツ・レジャー
sports_child_array = ['ゴルフ','フィッシング','自転車','トレーニング/エクササイズ','野球','サッカー/フットボール','テニス','スノーボード','スキー','その他スポーツ','アウトドア','その他']

parent = Category.create(name: 'スポーツ・レジャー')
sports_child_array.each do |child|
  child = parent.children.create(name: child)
end

# ハンドメイド
handmade_child_array = ['アクセサリー（女性用）','ファッション/小物','アクセサリー/時計','日用品/インテリア','趣味/おもちゃ','キッズ/ベビー','素材/材料','二次創作物','その他']

parent = Category.create(name: 'ハンドメイド')
handmade_child_array.each do |child|
  child = parent.children.create(name: child)
end

# チケット
ticet_child_array = ['音楽','スポーツ','園芸/芸能','イベント','映画','施設利用券','優待券/割引券','その他']

parent = Category.create(name: 'チケット')
ticet_child_array.each do |child|
  child = parent.children.create(name: child)
end

# 自動車・オートバイ
cars_child_array = ['自動車本体','自動車タイヤ/ホイール','自動車パーツ','自動車アクセサリー','オートバイ車体','オートバイパーツ','オートバイアクセサリー']

parent = Category.create(name: '自動車・オートバイ')
cars_child_array.each do |child|
  child = parent.children.create(name: child)
end

# その他
other_child_array = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']

parent = Category.create(name: 'その他')
other_child_array.each do |child|
  child = parent.children.create(name: child)
end


