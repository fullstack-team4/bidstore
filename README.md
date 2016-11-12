* [工作原則](http://redmine.growthschool.com/projects/class-02/wiki/%E5%B7%A5%E4%BD%9C%E5%8E%9F%E5%89%87)
* [Git branch 命名原則](http://redmine.growthschool.com/projects/class-02/wiki/Git_%E5%8D%94%E4%BD%9C%E6%B5%81%E7%A8%8B) （必看，乱命名者禁止贡献代码一天）
* [HTML CSS 排版規則](http://redmine.growthschool.com/projects/class-02/wiki/HTML_CSS_%E5%8D%94%E4%BD%9C%E8%A6%8F%E5%89%87)
* 开发功能必补齐 seed.rb
* 下午六点，请找主程确认你的功能可被合并
* 随时随地保持公德心，才是好队友

# 开发用帐号

* Admin :
* User :

# 其他

* 小组内成员请登陆 [Tower](http://redmine.growthschool.com/projects/team-2-4/issues)查看组长分配的项目任务

seeds.rb

create_product = Product.create([title: "李笑来的法拉利",
                                 description: "在通往财富自由之路上飞驰",
                                 price: 5000000,
                                 quantity:1,
                                 image: "http://m4.auto.itc.cn/c_zoom,w_800/800379.jpg"])
puts "Product created"

create_product = Product.create([title: "罗永浩的锤子",
                                 description: "打假维权不再烦恼",
                                 price: 666,
                                 quantity: 6,
                                 image: "http://image.nbd.com.cn/uploads/articles/thumbnails/1074/4.x_large.jpg"])
puts "Product created"

create_product = Product.create([title: "韩寒的摄像机",
                                 description: "用作家的镜头讲你的故事",
                                 price: 9999,
                                 quantity: 5,
                                 image: "http://s.qdcdn.com/cl/12441845,800,450.jpg"])
puts "Product created"

create_product = Product.create([title: "小S的牛仔裤",
                                 description: "好身材的黄金尺",
                                 price: 888,
                                 quantity: 100,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg"])
puts "Product created"


create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'user1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user2@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user3@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user4@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user5@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user6@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user7@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user8@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user9@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user10@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."
