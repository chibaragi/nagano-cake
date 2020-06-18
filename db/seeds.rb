# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Client.create!(:email => 'chibaragi@yahoo.co.jp', :password => 'aaaaaa', :first_name => "千葉", :last_name => "らぎ", :first_name_kana => "チバ", :last_name_kana => "ラギ", :phone_number => "12345678910", :postal_code => "1234567", :street_address => "千葉県銚子市長野町123-456" )

# Client.create!(:email => 'hokkaido@yahoo.co.jp', :password => 'bbbbbb', :first_name => "北海", :last_name => "道", :first_name_kana => "ホッカイ", :last_name_kana => "ドウ", :phone_number => "09876543211", :postal_code => "0987654", :street_address => "千葉県銚子市長野町098-7654" )

client1=Client.find_by(id: 1)
# client1.shipping_addresses.build(:receive_name => "田中太郎", :postal_code =>"1111111", :street_address => "東京都豊島区西池袋1-1-1")
# client1.save

# client1.shipping_addresses.build(:receive_name => "鈴木次郎", :postal_code =>"2222222", :street_address => "東京都千代田区丸の内2-2-2")
# client1.save


# client1.shipping_addresses.build(:receive_name => "山本洋子", :postal_code =>"3333333", :street_address => "東京都新宿区大久保3-3-3")
# client1.save


# client1.shipping_addresses.build(:receive_name => "佐々木希", :postal_code =>"4444444", :street_address => "東京都渋谷区道玄坂4-4-4")
# client1.save

