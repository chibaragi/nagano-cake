# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

# ここからclient
Client.create!(:email => 'chibaragi@yahoo.co.jp', :password => 'aaaaaa', :first_name => "千葉", :last_name => "らぎ", :first_name_kana => "チバ", :last_name_kana => "ラギ", :phone_number => "12345678910", :postal_code => "1234567", :street_address => "千葉県銚子市長野町123-456")
Client.create!(:email => 'hokkaido@yahoo.co.jp', :password => 'bbbbbb', :first_name => "北海", :last_name => "道", :first_name_kana => "ホッカイ", :last_name_kana => "ドウ", :phone_number => "09876543211", :postal_code => "0987654", :street_address => "千葉県銚子市長野町098-7654")
Client.create!(:email => '111@yahoo.co.jp', :password => 'bbbbbb', :first_name => "山田", :last_name => "花子", :first_name_kana => "ヤマダ", :last_name_kana => "ハナコ", :phone_number => "11111111111", :postal_code => "1111111", :street_address => "東京都渋谷区道玄坂3-3-3")
Client.create!(:email => '222@yahoo.co.jp', :password => 'bbbbbb', :first_name => "千葉", :last_name => "らぎお", :first_name_kana => "チバ", :last_name_kana => "ラギオ", :phone_number => "22222222222", :postal_code => "2222222", :street_address => "千葉県銚子市長野町123-456")
Client.create!(:email => '333@yahoo.co.jp', :password => 'bbbbbb', :first_name => "佐々木", :last_name => "希", :first_name_kana => "ササキ", :last_name_kana => "ノゾミ", :phone_number => "33333333333", :postal_code => "3333333", :street_address => "愛知県名古屋市北区金田町4-721-1")
Client.create!(:email => '444@yahoo.co.jp', :password => 'bbbbbb', :first_name => "阿部", :last_name => "寛", :first_name_kana => "アベ", :last_name_kana => "ヒロシ", :phone_number => "44444444444", :postal_code => "4444444", :street_address => "福岡県宮若市犬鳴560-5")
Client.create!(:email => '555@yahoo.co.jp', :password => 'bbbbbb', :first_name => "田中", :last_name => "圭", :first_name_kana => "タナカ", :last_name_kana => "ケイ", :phone_number => "55555555555", :postal_code => "5555555", :street_address => "青森県三戸郡田子町遠瀬660-8")
Client.create!(:email => '666@yahoo.co.jp', :password => 'bbbbbb', :first_name => "田中", :last_name => "麗奈", :first_name_kana => "タナカ", :last_name_kana => "レイナ", :phone_number => "66666666666", :postal_code => "6666666", :street_address => "京都府京都市伏見区淀水垂町509-16")
Client.create!(:email => '777@yahoo.co.jp', :password => 'bbbbbb', :first_name => "田中", :last_name => "角栄", :first_name_kana => "タナカ", :last_name_kana => "カクエイ", :phone_number => "77777777777", :postal_code => "7777777", :street_address => "東京都千代田区丸の内7-7-7")
Client.create!(:email => '888@yahoo.co.jp', :password => 'bbbbbb', :first_name => "山本", :last_name => "希", :first_name_kana => "ヤマモト", :last_name_kana => "ノゾミ", :phone_number => "88888888888", :postal_code => "8888888", :street_address => "東京都豊島区西池袋8-8-8")
Client.create!(:email => '999@yahoo.co.jp', :password => 'bbbbbb', :first_name => "加藤", :last_name => "希", :first_name_kana => "カトウ", :last_name_kana => "ノゾミ", :phone_number => "99999999999", :postal_code => "9999999", :street_address => "北海道野付郡別海町別海西本町223-10")
Client.create!(:email => '000@yahoo.co.jp', :password => 'bbbbbb', :first_name => "千葉", :last_name => "らぎこ", :first_name_kana => "チバ", :last_name_kana => "ラギコ", :phone_number => "00000000000", :postal_code => "0000000", :street_address => "千葉県銚子市長野町098-7654")

# ここからclient1.shipping_addresses
ShippingAddress.create!(:client_id => 1, :receive_name => "田中太郎", :postal_code => "1111111", :street_address => "東京都豊島区西池袋1-1-1")
ShippingAddress.create!(:client_id => 1, :receive_name => "鈴木次郎", :postal_code => "2222222", :street_address => "東京都千代田区丸の内2-2-2")
ShippingAddress.create!(:client_id => 1, :receive_name => "佐々木希", :postal_code => "3333333", :street_address => "東京都渋谷区道玄坂4-4-4")
ShippingAddress.create!(:client_id => 1, :receive_name => "山田洋子", :postal_code => "4444444", :street_address => "東京都新宿区大久保3-3-3")
ShippingAddress.create!(:client_id => 2, :receive_name => "山田太郎", :postal_code => "5555555", :street_address => "愛媛県松山市猪木765-8")
ShippingAddress.create!(:client_id => 2, :receive_name => "山本太郎", :postal_code => "6666666", :street_address => "岐阜県養老郡養老町明徳12-17")
ShippingAddress.create!(:client_id => 2, :receive_name => "岡本太郎", :postal_code => "7777777", :street_address => "大阪府豊能郡豊能町寺田403-12")
ShippingAddress.create!(:client_id => 2, :receive_name => "山本洋子", :postal_code => "8888888", :street_address => "新潟県十日町市小黒沢811-18")

# ここからgenre
Genre.create!(:name => "ケーキ", :is_enabled => true)
Genre.create!(:name => "プリン", :is_enabled => true)
Genre.create!(:name => "焼き菓子", :is_enabled => true)
Genre.create!(:name => "キャンディ", :is_enabled => true)

# ここからProduct
Product.create!(:genre_id => 1, :name => "イチゴのケーキ", :price => 1000, :explanation => "当店一番人気の商品です！", image_id: "d9d1fcea5dd60e057f4aa9a67179d01d5a9152627cb0b9345ea323766714", :is_enabled => true)
Product.create!(:genre_id => 2, :name => "カスタードのプリン", :price => 500, :explanation => "ベーシックで安心する甘さをあなたに。", image_id: "f63106da9367972e18262eaba334b2bfc774479ce4530cf8e02d1d0c0ca8", :is_enabled => false)
Product.create!(:genre_id => 3, :name => "チョコのマドレーヌ", :price => 300, :explanation => "3時のおやつにマドレーヌをどうぞ。", image_id: "7c2da03f81a1dd688e43b7fc56456688e2a1dd8e43c0a8d36693772f5f1d", :is_enabled => true)
Product.create!(:genre_id => 4, :name => "ハートのキャンディ", :price => 250, :explanation => "可愛い見た目で贈り物にもぴったり。", image_id: "08976f17a57f5f14ddcc644313b9c446213023c5d851c310c5e290e9c92d", :is_enabled => true)
Product.create!(:genre_id => 1, :name => "シュークリーム", :price => 250, :explanation => "固めの生地とふうわりクリームで食べ応えがあります。", image_id: "96ca309334fd4550ee21b0f339c5a1572df8ae2c86a3b9c55d958f7ab2d1", :is_enabled => true)
Product.create!(:genre_id => 1, :name => "レモンのケーキ", :price => 600, :explanation => "爽やかなレモンの香りのケーキです。", image_id: "eebfcc6cc5349c32447a91c0a249b5082e295c77af76de68beeeb65af0ca", :is_enabled => true)
Product.create!(:genre_id => 4, :name => "イチゴのキャンディ", :price => 150, :explanation => "甘さを長く楽しむならこれが一番です。", image_id: "f7ed56e2d86950c9506563794b231e2212f865b4eaa7ef61d70cb2b3f544", :is_enabled => true)
Product.create!(:genre_id => 2, :name => "ナッツのプリン", :price => 300, :explanation => "控えめな甘さと芳醇な風味を味わってください。", image_id: "bcdb652030bd94f4ad61438e5276e8e30d9eb929e7f187d8b3b88b4db14e", :is_enabled => true)
Product.create!(:genre_id => 1, :name => "オレンジのケーキ", :price => 1000, :explanation => "甘さと酸味のコラボレーションは大人の味です。", image_id: "4aadd54e43b699872abc8418a523e9becca79f1c3d6f7989dd8021f07c12", :is_enabled => true)
Product.create!(:genre_id => 2, :name => "イチゴのプリン", :price => 300, :explanation => "炭酸のジェルにしたイチゴが楽しませてくれます。", image_id: "d7c1898aa3ad6c0611a65d10c68924afed5ad45712928ddaa30e8b6e1b21", :is_enabled => true)
Product.create!(:genre_id => 3, :name => "スコーン", :price => 250, :explanation => "軽食、朝食にオススメな商品です。", image_id: "e0938897a050dadcbc614f0e4a18c5b212a0a1e41c95935cebefc65f7482", :is_enabled => false)
Product.create!(:genre_id => 1, :name => "チョコレートのケーキ", :price => 500, :explanation => "甘味の王道を突き詰めました。", image_id: "136e40c85c245ad4d9556915a4a11448e91cb04dc835233c5f7e79a2d26e", :is_enabled => true)
Product.create!(:genre_id => 1, :name => "イチゴのタルト", :price => 800, :explanation => "フレッシュなイチゴと香ばしいタルトのハーモニー！", image_id: "3f8486fca8c71a7bf7cea9549438443b91c75663053569e11e3abee10bd7", :is_enabled => true)
Product.create!(:genre_id => 3, :name => "クッキー詰め合わせ", :price => 1200, :explanation => "ギフトにぴったりの香り豊かなクッキーの詰め合わせです。", image_id: "ceb09abafed5b235dd601643a6638d2d19edfc1a354f34992f1f208e616e", :is_enabled => true)

# ここからclient1.orders
Order.create!(:client_id => 1, :receive_name => "千葉ラギ", :postal_code => "1234567", :street_address => "千葉県銚子市長野町123-456", :postage => 800, :payment => 0, :total_price => 3550, :order_status => 0)
Order.create!(:client_id => 1, :receive_name => "田中太郎", :postal_code => "1111111", :street_address => "東京都豊島区西池袋1-1-1", :postage => 800, :payment => 1, :total_price => 4155, :order_status => 2)
Order.create!(:client_id => 2, :receive_name => "山田太郎", :postal_code => "5555555", :street_address => "愛媛県松山市猪木765-8", :postage => 800, :payment => 0, :total_price => 1900, :order_status => 0)
Order.create!(:client_id => 3, :receive_name => "山田花子", :postal_code => "3333333", :street_address => "東京都渋谷区道玄坂3-3-3", :postage => 800, :payment => 1, :total_price => 1680, :order_status => 4)

# ここからInsideCart(4つ)
#  InsideCart.create!(:client_id => 1, :product_id => 1, :quantity => 1)
#  InsideCart.create!(:client_id => 1, :product_id => 2, :quantity => 2)
#  InsideCart.create!(:client_id => 1, :product_id => 3, :quantity => 1)
#  InsideCart.create!(:client_id => 1, :product_id => 4, :quantity => 3)

# ここからProductOrder(６つ、order２回分)
ProductOrder.create!(:order_id => 1, :product_id => 1, :quantity => 2, :once_price => 1100, :product_order_status => 0)
ProductOrder.create!(:order_id => 1, :product_id => 2, :quantity => 1, :once_price => 550, :product_order_status => 0)
ProductOrder.create!(:order_id => 2, :product_id => 1, :quantity => 1, :once_price => 1100, :product_order_status => 3)
ProductOrder.create!(:order_id => 2, :product_id => 2, :quantity => 2, :once_price => 550, :product_order_status => 2)
ProductOrder.create!(:order_id => 2, :product_id => 3, :quantity => 1, :once_price => 330, :product_order_status => 3)
ProductOrder.create!(:order_id => 2, :product_id => 4, :quantity => 3, :once_price => 275, :product_order_status => 3)
ProductOrder.create!(:order_id => 3, :product_id => 1, :quantity => 1, :once_price => 1100, :product_order_status => 0)
ProductOrder.create!(:order_id => 4, :product_id => 2, :quantity => 1, :once_price => 550, :product_order_status => 3)
ProductOrder.create!(:order_id => 4, :product_id => 3, :quantity => 1, :once_price => 330, :product_order_status => 3)

# admin
Admin.create!(:email => 'chibaragi@yahoo.co.jp', :password => 'aaaaaa')
Admin.create!(:email => 'hokkaido@yahoo.co.jp', :password => 'bbbbbb')
