# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.create!(:email => 'chibaragi@yahoo.co.jp', :password => 'aaaaaa', :first_name => "千葉", :last_name => "らぎ", :first_name_kana => "チバ", :last_name_kana => "ラギ", :phone_number => "123-4567-8910", :postal_code => "123-4567", :street_address => "千葉県銚子市長野町123-456" )