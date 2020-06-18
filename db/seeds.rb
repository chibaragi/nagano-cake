# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.create!(:email => 'chibaragi@yahoo.co.jp', :password => 'aaaaaa', :first_name => "千葉", :last_name => "らぎ", :first_name_kana => "チバ", :last_name_kana => "ラギ", :phone_number => "12345678910", :postal_code => "1234567", :street_address => "千葉県銚子市長野町123-456" )

Client.create!(:email => 'hokkaido@yahoo.co.jp', :password => 'bbbbbb', :first_name => "北海", :last_name => "道", :first_name_kana => "ホッカイ", :last_name_kana => "ドウ", :phone_number => "09876543211", :postal_code => "0987654", :street_address => "千葉県銚子市長野町098-7654" )

