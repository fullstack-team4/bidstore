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
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-16 09:00:00",
                                 product_story: "自从李笑来，老师在得到专栏上开设了通往财富自由之路的专栏以后，争议不断，很多人都吐槽，说这其实是李笑来老师自己又是上了财务自由之路。现在，李笑来老师抛出了他心爱的保时捷赛车，给你也提供了一个机会，驾驶着这位财神的座驾，行驶在你自己的通往财富自由之路上。" ])
puts "Product created"

create_product = Product.create([title: "罗永浩的锤子",
                                 description: "打假维权不再烦恼",
                                 price: 666,
                                 quantity: 1,
                                 buyout: 6666,
                                 image: "http://image.nbd.com.cn/uploads/articles/thumbnails/1074/4.x_large.jpg",
                                 is_hidden:"false",
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-17 18:00:00",
                                 endtime: "2016-12-18 09:00:00",
                                 product_story: "彪悍的人生不要解释！彪悍的大锤更不需要解释：大锤落下，草木皆毁。 据说此锤的头是坚硬的神铁所打造而成，握柄部分则是以世界之树的木材作成。不用的时候还可以缩小放进口袋里。此锤的功能为可以击穿任何东西，要是把它扔出去，它会毫无误差地击中目标，而且飞出去之后还会自动飞回持有者的手中。"])
puts "Product created"

create_product = Product.create([title: "韩寒的摄像机",
                                 description: "用作家的镜头讲你的故事",
                                 price: 9999,
                                 quantity: 1,
                                 buyout: 99999,
                                 image: "http://s.qdcdn.com/cl/12441845,800,450.jpg",
                                 is_hidden:"false",
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-20 18:00:00",
                                 endtime: "2016-12-22 09:00:00",
                                 product_story: "这是一个偶像幻灭的时代，这是一个崇拜坍塌的时代。16年前，韩寒凭《杯中窥人》一朝成名，以叛逆少年的形象出现在世人眼中，被贴上“青年领袖、公共知识分子”等各种标签，成为中国80后一代的形象代言人。16年后，不可否认，韩寒已经从一个符号变成一个凡人，在摄像机下重新定位“每一个自己”。"])
puts "Product created"

create_product = Product.create([title: "小S的牛仔裤",
                                 description: "好身材的黄金尺",
                                 price: 888,
                                 quantity: 1,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "现如今，它依旧是阔腿裤潮流下的人气单品。霸道女总裁爱它、下身不够瘦的姑娘爱它、怕冻的姑娘更爱它！冬日外套的最强内搭，显瘦又御寒！搭配长大衣，气场翻倍！搭配短夹克，秀出大长腿！人造皮早的温暖质感与心机内搭，零下七度能耐我如何？"])
puts "Product created"

create_product = Product.create([title: "周星驰的剧本",
                                 description: "印迹周氏幽默",
                                 price: 18888,
                                 quantity: 1,
                                 buyout: 98888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "《大话西游》、《西游降魔》，每个人最打动人心的作品，正是他自己的命运剧本。它们有共同的模式：最爱的女子，男主角一直在躲避，直到她用生死证明爱，男主角才悲痛成神。星爷真诚地从自己的内心出发，都非常用力，都是在表达自己。人活着，就是要跳出自己的命运剧本，能碰触到、理解到并能表达出自己的命运剧本，实属难得。"])
puts "Product created"

create_product = Product.create([title: "周杰伦钢琴.",
                                 description: "岁月在音乐中流淌",
                                 price: 200888,
                                 quantity: 1,
                                 buyout: 508888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "周董如愿娶回真命天女昆凌，盛大的英国教堂世纪婚礼，如同王子与公主的童话故事。回首周杰伦的感情史，“J女郎”名单一大串，昆凌到底是怎么与周董相识、相恋？比周董小14岁的昆凌，当初是因为在周董投资的潮服店兼职而结识，后来周董介绍她学钢琴，如此诗意的场景下，浪漫情节,周董表白说：“我的字不好看啦!也不会去写什么留下证据，表白可能以弹钢琴比较多，音乐是一种语言！”"])
puts "Product created"

create_product = Product.create([title: "李宗盛吉他",
                                 description: "以为自己懂了他的音乐，其实",
                                 price: 8888,
                                 quantity: 1,
                                 buyout: 18888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "从音乐人向制琴师跨界，李宗盛大哥翻越了一座人生的“山丘”。十多年来，他为了梦想一路坚持，就像一把原木吉他，任凭时光打磨，始终保持演奏最本色的音符。入行三十年，写了三百首歌，45岁这一年，李宗盛正式决定开始做自己的品牌“李吉他”（Lee Guitar）。他说：“我知道手艺人往往意味着固执、缓慢、少量、劳作。但是，这些背后所隐含的是专注、技艺、对完美的追求。”
"])
puts "Product created"

create_product = Product.create([title: "胡歌的相机",
                                 description: "开启新的视角记录不同风景",
                                 price: 18888,
                                 quantity: 1,
                                 buyout: 8888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "胡歌，大家熟知的大明星。十六七岁开始学习摄影，就是纯粹想泡妞，感觉背着相机比抱着篮球更有范儿。在他看来：胶片是信仰，数码是工具。对于胡歌来说，摄影有些不一样的意义。相机陪他走过了小半个地球，也伴他度过了人生中的一次次坎坷，“皮囊坏了，就用思想填满它”。"])
puts "Product created"

create_product = Product.create([title: "李娜的网球拍",
                                 description: "独自上场惊艳人生",
                                 price: 5888,
                                 quantity: 1,
                                 buyout: 18888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"sportceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "真实的活在我们这个世界的，不停战斗的约翰克里斯朵夫。在年轻的时候，她从不妥协，这对曾经除了彼此以外一无所有的夫妻，如何凭借自己的努力，从默默无闻的角落，走到了世界瞩目的中心。说出来会被嘲笑的梦想，才有实现的价值，而她如今做到的，远超过曾经许下的梦想。没有被这个世界，把自己变成曾经讨厌的模样。"])
puts "Product created"

create_product = Product.create([title: "郎平的排球",
                                 description: "半世纪传奇",
                                 price: 999,
                                 quantity: 1,
                                 buyout: 9999,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"sportceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "郎平，从运动员时代开始，就与各项璀璨荣誉并肩而行，执教期间她更是点石成金，让她从完美升华为伟大。所谓王者，必然要超脱时空的局限。从上世纪80年代的“铁榔头”，到今日的“女排教主”，从中国到意大利到美国再回到中国，郎平用30年光阴岁月，证明了自己，是当之无愧的中国三大球第一人。"])
puts "Product created"

create_product = Product.create([title: "姚明的篮球",
                                 description: "MVP的起点",
                                 price: 888,
                                 quantity: 1,
                                 buyout: 9999,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"sportceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "大姚的那些高光时刻，作为一名受人尊重的球员及篮球运动的友好使者，这位２米２６的大个子改变了世界篮球运动的面貌，用中国人特有的坚韧和睿智，赢得了的肯定，让世界记住了他在赛场上的坚毅，在赛场外的亲善。他与篮球的故事，未完待续。"])
puts "Product created"

create_product = Product.create([title: "宁泽涛的耳机",
                                 description: "全民老公听什么",
                                 price: 2988,
                                 quantity: 1,
                                 buyout: 4988,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"sportceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "明明可以靠颜值，却偏要靠实力。游泳池里的宁泽涛帅气迷人，高挑有型的身材，携手汇集极限运动、音乐、街头文化和创新科技的美国潮流耳机品牌Skullcandy ，为所有激励人心的冒险者、创新者、开拓者带来世界级的音频产品和游戏产品，享受运动，享受音乐。"])
puts "Product created"

create_product = Product.create([title: "老徐手作",
                                 description: "才女手艺人",
                                 price: 618,
                                 quantity: 1,
                                 buyout: 1888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"movieceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "女神早已升级手艺人！从各种包包、陶艺到身上戴的各种饰品，甚至衣服，样样都是老徐手作！在过去一年多，她自己一针一线做了170多个包包，几百件小饰品。什么“人生赢家”，都是人生过客，只有心儿里美风雨无阻，年华无欺，谁也拿不走。每个人都把自己管好了，也许就是对社会最大的贡献。—徐裁缝"])
puts "Product created"

create_product = Product.create([title: "卡戴珊的礼服",
                                 description: "傲娇身材面对争议的人生",
                                 price: 18888,
                                 quantity: 1,
                                 buyout: 38888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "时尚圈屹立不倒的超强基因“卡戴珊家族”，卡戴珊绝对是一个成功的女人，她的成功可能来自于名气，不过她的成功却不仅仅只有名气，2012年，卡戴珊作为一位时装设计师，建立了Kardashian Kollection时装品牌，简称KK，产品包括女包、连衣裙、香水、床上用品等等。每年收入数亿美金，堪比任何一个好莱坞巨星。你们看到的是八卦，姐活的是黄金人生。"])
puts "Product created"

create_product = Product.create([title: "TFboys的自行车",
                                 description: "怀旧版的三小只在飞车中成长",
                                 price: 1888,
                                 quantity: 1,
                                 buyout: 4888,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "TFBOYS成员与日韩男子团体比起来更接地气，像邻家小男孩，略显稚气的唱功依然会被定义为“小朋友”角色。最大特点就是新鲜年轻，他们已经不再只歌唱“太阳花”和红领巾，他们唱着00后的感情观，传递着健康向上正能量，还有些情窦初开式的青涩告白。"])
puts "Product created"

create_product = Product.create([title: "鹿晗的配饰",
                                 description: "花样美男的终极武器",
                                 price: 2999,
                                 quantity: 1,
                                 buyout: 4999,
                                 image: "http://ww2.sinaimg.cn/mw690/6592c2e0jw1f85mgtlpqzj20qo0f0tb9.jpg",
                                 is_hidden:"false",
                                 tag:"netceleb",
                                 aasm_state: "before_auction",
                                 begintime: "2016-11-15 18:00:00",
                                 endtime: "2016-12-25 09:00:00",
                                 product_story: "“小鲜肉”鹿晗，他的一举一动牵动着2571万粉丝的心情，不仅颜值有担当，而且对于配饰有极大的品位追求。眼镜、鞋子、配饰各方面搭配起来都是得心应手，总之长了一张帅Cry的脸，真是穿配什么都好看呢。颜值爆表萌萌哒，配饰选择有一套！"])
puts "Product created"
