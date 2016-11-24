# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: true, name: 'XD', is_verified: true])
puts "Admin account created."

create_account = User.create([email: 'user1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '梁超', is_verified: true])
puts "User account created."

create_account = User.create([email: 'user2@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '曾洲', is_verified: true])
puts "User account created."

create_account = User.create([email: 'user3@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '刘嘉泰', is_verified: true])
puts "User account created."

create_account = User.create([email: 'user4@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '孙雁飞', is_verified: true])
puts "User account created."

create_account = User.create([email: 'user5@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '王秒', is_verified: true])
puts "User account created."

create_account = User.create([email: 'user6@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '陈坤明'])
puts "User account created."

create_account = User.create([email: 'user7@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '费贲'])
puts "User account created."

create_account = User.create([email: 'user8@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '刘幼臻'])
puts "User account created."

create_account = User.create([email: 'user9@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '王伟'])
puts "User account created."

create_account = User.create([email: 'user10@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false', name: '王凡'])
puts "User account created."


# environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")
#
# def seed_image(file_name)
#   File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
# end
#
# products = [
#   {:name => 'foo', :description => 'lorem ipsum',   :product_type => ProductType.find_by_name('Sandwiches')},
#   {:name => 'bar', :description => 'dolerem ipsum', :product_type => ProductType.find_by_name('Soups')}
# ]
#
# products.each do |attributes|
#   attributes[:image] = seed_image('product_family_or_system')
#   Product.find_or_create_by_name(attributes[:name], attributes)
# end

create_product = Product.create([title: "李笑来的法拉利",
                                 description: "在通往财富自由之路上飞驰",
                                 price: 5000000,
                                 quantity:1,
                                 buyout:8000000,
                                 image: "http://m4.auto.itc.cn/c_zoom,w_800/800379.jpg",
                                 is_hidden:"false",
                                 tag:"网红",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-16 09:09:00" ])
puts "Product created"

create_product = Product.create([title: "罗永浩的锤子",
                                 description: "打假维权不再烦恼",
                                 price: 666,
                                 quantity: 6,
                                 buyout: 6666,
                                 image: "http://image.nbd.com.cn/uploads/articles/thumbnails/1074/4.x_large.jpg",
                                 is_hidden:"false",
                                 tag:"",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-17 18:09:00",
                                 endtime: "2016-11-18 09:09:00"])
puts "Product created"

create_product = Product.create([title: "韩寒的摄像机",
                                 description: "用作家的镜头讲你的故事",
                                 price: 9999,
                                 quantity: 5,
                                 buyout: 99999,
                                 image: "http://s.qdcdn.com/cl/12441845,800,450.jpg",
                                 is_hidden:"false",
                                 tag:"",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-20 18:09:00",
                                 endtime: "2016-11-22 09:09:00"])
puts "Product created"

create_product = Product.create([title: "小S的牛仔裤",
                                 description: "好身材的黄金尺",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "明星A的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"明星",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "明星B的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"明星",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "明星C的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"明星",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "明星D的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"明星",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "健将A的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"健将",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "健将B的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"健将",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "健将C的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"健将",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "健将D的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"健将",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "网红A的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"网红",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "网红B的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"网红",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "网红C的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"网红",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"

create_product = Product.create([title: "网红D的宝贝",
                                 description: "QQQ",
                                 price: 888,
                                 quantity: 100,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"网红",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:09:00",
                                 endtime: "2016-11-25 09:09:00"])
puts "Product created"
