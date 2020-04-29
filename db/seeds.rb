# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# -------------------------------------------
# Fakerを日本語化する
Faker::Config.locale = :ja

# 指定した文字数の文字列を生成する
def create_caption(number)
  Faker::Lorem.characters(number: number)
end
# -------------------------------------------

# users
profiles = [
  { email: "guest@example.com",   name: "guest",   password: "password" },
  { email: "kensei@example.com",  name: "kensei",  password: "password" },
  { email: "tomy@example.com",    name: "tomy",    password: "password" }
]

profiles.each do |profile|
  User.find_or_create_by!(email: profile[:email]) do |user|
    user.email = profile[:email]
    user.name = profile[:name]
    user.password = profile[:password]
  end
end
# users/

# sureads
suread_datas = [
  { title: "【新型コロナ】〇〇県△△市で感染が拡大。知事より早急な対策が必要",  user_id: 1},
  { title: "ロシアで雪道を歩行中滑って転倒する事故が発生",  user_id: 1},
  { title: "中国人観光客による爆買が話題に",  user_id: 2}
]

suread_datas.each do |suread_data|
  Suread.find_or_create_by!(title: suread_data[:title]) do |suread|
    suread.title = suread_data[:title]
    suread.user_id = suread_data[:user_id]
  end
end
# sureads/

# responses
response_datas = [
  { suread_id: 1,  name: "guest", comment: create_caption(100) },
  { suread_id: 1,  name: "kensei", comment: create_caption(30) },
  { suread_id: 1,  name: "名無しさん", comment: create_caption(5) },
  { suread_id: 1,  name: "オクラ成人", comment: create_caption(82) }
]

response_datas.each do |response_data|
  Response.create!(
    suread_id: response_data[:suread_id],
    name: response_data[:name],
    comment: response_data[:comment]
  )
end
# responses/

# categories
category_datas = [
  { name: "ニュース速報" },
  { name: "芸能" },
  { name: "政治" }
]

category_datas.each do |category_data|
  Category.create!(
    name: category_data[:name]
  )
end
# categories/

# sureads category
Suread.find(1).categories << Category.find(1)
Suread.find(1).categories << Category.find(2)
Suread.find(2).categories << Category.find(2)
Suread.find(3).categories << Category.find(3)
# sureads category/