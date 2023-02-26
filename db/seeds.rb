require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin User Dataを作成
adminUser1 = Admin.create!(
    email: 'test@test.com',
    password: 'chocolate-g',
)
# Customer Dataの作成(以下で商品のデータで使用するため)
customerUser1 = Customer.create!(
    first_name: '令和',
    last_name: '太郎',
    first_name_kana: 'レイワ',
    last_name_kana: 'タロウ',
    address: '日本',
    postal_code: '123-4567',
    telephone_number: '00000000000',
    email: 'customertest@test.com',
    password: 'chocolate',
)

#ジャンルデータを作成
cakeGenre = Genre.create!(name: 'ケーキ')
purinGenre = Genre.create!(name: 'プリン')
okashiGenre = Genre.create!(name: '焼き菓子')
candyGenre = Genre.create!(name: 'キャンディ')


#   create_table "products", force: :cascade do |t|
#       t.integer "genre_id"
#       t.string "name", null: false
#       t.text "description", null: false
#       t.integer "tax_excluded_price", null: false
#       t.boolean "is_active", default: true, null: false
#   end

image_url = Faker::Avatar.image(slug: adminUser1.email, size: '150x150') 
# ActiveStorageを使ってavatarを設定

cake1 = Product.create!(name: 'cake', genre_id: cakeGenre.id, description: 'This is Cake1', tax_excluded_price: 1000, is_active: true)
cake1.image.attach(io: URI.parse(image_url).open, filename: 'avatar.png')
cake2 = Product.create!(name: 'purin', genre_id: purinGenre.id, description: 'This is Cake2', tax_excluded_price: 3000, is_active: true)
cake2.image.attach(io: URI.parse(image_url).open, filename: 'avatar.png')
cake3 = Product.create!(name: 'okashi', genre_id: okashiGenre.id, description: 'This is Cake3', tax_excluded_price: 2000, is_active: true)
cake4 = Product.create!(name: 'ohashi2', genre_id: okashiGenre.id, description: 'This is Cake4', tax_excluded_price: 5000, is_active: true)
cake5 = Product.create!(name: 'ohashi3', genre_id: okashiGenre.id, description: 'This is Cake5', tax_excluded_price: 500, is_active: true)
cake6 = Product.create!(name: 'candy', genre_id: candyGenre.id, description: 'This is Cake6', tax_excluded_price: 9000, is_active: true)