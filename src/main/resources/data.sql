/*実績*/
INSERT INTO achievements(name, image_path, description, method_name) VALUES 
    ('初めてのお客様', '/images/image_achievements/01_first_visiter.PNG', '初めて買い物をした', 'isFirstPurchase'),
    ('常連さん', '/images/image_achievements/02_regular_customer.PNG', '5回買い物をした', 'isRepeatCustomer5Times'),
    ('北海道マスター', '/images/image_achievements/03_hokkaido_master.PNG', '20回買い物をした', 'isHokkaidoMaster20Times'),
    ('爆買い王', '/images/image_achievements/04_bulk_buyer_king.PNG', '1回の買い物で10商品以上購入した', 'isBulkBuyer10Items'),
    ('スイーツハンター', '/images/image_achievements/05_sweets_hunter.PNG', 'スイーツを3種類購入した', 'isSweetsHunter'),
    ('海鮮マスター', '/images/image_achievements/06_seafood_master.PNG', '海産物を3回購入した', 'isSeafoodMaster'),
    ('農家さんのお友達', '/images/image_achievements/07_farmers_friend.PNG', '農作物を3回購入した', 'isFarmFriend'),
    ('北海道グルメ制覇', '/images/image_achievements/08_all_around_gourmet.PNG', '全カテゴリから1つずつ購入', 'isHokkaidoGourmetComplete'),
    ('札幌制覇', '/images/image_achievements/09_sapporo_master.PNG', '札幌の商品を3つ購入', 'isSapporoStampCompleted'),
    ('函館グルメ旅', '/images/image_achievements/10_hakodate_master.PNG', '函館の商品を3つ購入', 'isHakodateStampCompleted'),
    ('富良野マスター', '/images/image_achievements/11_furano_master.PNG', '富良野マスター', 'isFuranoStampCompleted'),
    ('北海道一周', '/images/image_achievements/12_hokkaido_tour.PNG', '3つ以上のエリアの商品を購入', 'isHokkaidoRoundTrip'),
    ('最強コンボ', '/images/image_achievements/13_ultimate_combo.png', 'ジンギスカンとビールを同時に購入', 'isBestComboJingisukanBeer'),
    ('海の幸セット', '/images/image_achievements/14_seafood_set.PNG', 'カニといくらとホタテを同時に購入', 'isSeafoodComboSet'),
    ('北海道に貢献', '/images/image_achievements/15_hokkaido_contributer.PNG', '累計1万円購入', 'isTotalSpent10000'),
    ('大富豪', '/images/image_achievements/16_millionaire.PNG', '累計5万円購入', 'isTotalSpent50000'),
    ('伝説の支援者', '/images/image_achievements/17_legendary_supporter.PNG', '累計10万円購入', 'isTotalSpent100000'),
    ('ランダム達成', '/images/image_achievements/18_random_achievement.PNG', '非公開条件で達成', 'isRandomAchievement'),
    ('シークレット実績', '/images/image_achievements/19_secret_achievement.PNG', '非公開条件で達成', 'isSecretAchievement');


/*職業*/
INSERT INTO jobs(name, image_path) VALUES
('農家','/images/job_image/farmar.png');

INSERT INTO jobs(name, image_path) VALUES
('釣り人','/images/job_image/fish.png');

INSERT INTO jobs(name, image_path) VALUES
('お肉ソムリエ','/images/job_image/meat.png');

INSERT INTO jobs(name, image_path) VALUES
('牛飼い','/images/job_image/caw.png');

INSERT INTO jobs(name, image_path) VALUES
('クッキーくん','/images/job_image/cokki.png');

INSERT INTO jobs(name, image_path) VALUES
('ビール君','/images/job_image/beer.png');

INSERT INTO jobs(name, image_path) VALUES
('浮浪人','/images/job_image/soldier.png');

/*都道府県*/
INSERT INTO prefectures(name) VALUES
('北海道');
INSERT INTO prefectures(name) VALUES
('東京');

/*ユーザー情報*/

INSERT INTO users(name, password  , email , job_id,level, prefecture_id,  role) VALUES
('尊さん','$2a$10$QDgCelnzlrxcONKfVuh9meHNMs9PSxOqIV47Q89ZTd889wFZmyuWO','takeru@example.com' , 1 , 1, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆきちゃん', '$2a$10$ThvVpqvzDNeKC32KnA3Ga.hPND2R7mJI8pYPqKb1DVN1wx1LUiLK2','yuki@example.com ', 2 , 5, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆりか',' $2a$10$kohxjV.rIzLhQSL/qusX2uzTM0cPAQMgEb5c.yXD0k2DPIa/Hj.8y','yurika@example.com' , 3 , 10, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('磯野倫希', '$2a$10$ZIntxJjnSDWhKkg82IaBz.k3zPPa/JmkQJnc6py7K3rcTFt9mgsgi','tomoki@example.com' , 2 , 15, 1 , 'Admin');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('しゅん', '$2a$10$IGbdSmPeQXiI5Sey3u.vAeYgkQBZJseo6L.pLT3torx6m4dtLUTtW','shun@example.com' , 1, 20, 2 , 'User');

INSERT INTO hokkaido_areas(name,image_path)
VALUES
('札幌','/images/stamp_image/Sapporo_01.svg.png'),('室蘭・登別','/images/stamp_image/Muroran_02.svg.png'),('帯広','/images/stamp_image/Obihiro_03.svg.png'),('岩見沢','/images/stamp_image/Iwamizawa_04.svg.png'),('函館','/images/stamp_image/Hakodate_05.svg.png'),
('小樽','/images/stamp_image/Otaru_06.svg.png'),('旭川','/images/stamp_image/Asahikawa_07.svg.png'),('夕張','/images/stamp_image/Yubari_08.svg.png'),('富良野','/images/stamp_image/Furano_09.svg.png');

INSERT INTO orders(user_id, buy_at, total_amount, status, coupon_id)VALUES
(1, CURRENT_DATE , 12000, true, null);

INSERT INTO orders(user_id, buy_at, total_amount, status, coupon_id)VALUES
(2, CURRENT_DATE , 54000, true, null);

INSERT INTO orders(user_id, buy_at, total_amount, status, coupon_id)VALUES
(3, CURRENT_DATE , 120000, true, null);

INSERT INTO orders(user_id, buy_at, total_amount, status, coupon_id)VALUES
(4, CURRENT_DATE , 150000, true, null);

INSERT INTO orders(user_id, buy_at, total_amount, status, coupon_id)VALUES
(5, CURRENT_DATE , 250000, true, null);


INSERT INTO product_categories(name)
VALUES('農作物'),('海産物'),('肉・畜産品'),('乳製品'),('スイーツ・お菓子'),('酒・飲料'),('消耗品');

INSERT INTO products
(name,price,stock,review_sum,review_star,product_category_id,hokkaido_area_id,user_id,shipping_interval) 
VALUES
('じゃがいも5kg',200000,50,128,3.2,1,1,1,2),
('冷凍鮭2kg',3000,30,95,4.1,2,2,2,5),
('ジンギスカンセット',5000,25,203,4.8,3,3,3,4),
('ナチュラルチーズ3種詰め合わせ',4500,12,74,2.9,4,4,4,3),
('贈答用ロイズチョコレート',4000,20,312,4.9,5,5,5,1),
('男山飲み比べセット',3500,10,56,1.8,6,7,1,1),
('木彫りの熊（ぽんこ）',5000,15,41,3.7,7,6,2,5),
('夕張メロン秀品',8000,8,187,5.0,1,8,3,2),
('いくら醤油漬け500g',6500,18,166,4.6,2,5,4,1),
('北海道産ホタテ1kg',5500,22,143,4.4,2,9,5,3),
('スープカレーセット',3200,35,119,2.5,3,1,1,2),
('白い恋人36枚入り',4200,40,421,4.8,5,1,2,1),
('六花亭詰め合わせ',3800,28,238,4.2,5,3,3,1),
('富良野ラベンダーオイル',2500,14,52,1.2,7,9,4,2),
('北海道バター3個セット',2800,26,88,3.5,4,7,5,2),
('本ししゃも20尾',4600,11,67,2.1,2,2,1,4),
('北海道牛乳プリンセット',3000,19,105,4.7,4,4,2,1),
('毛ガニ姿盛り',9800,9,274,5.0,2,5,3,5),
('札幌味噌ラーメン4食セット',2700,45,198,3.9,3,1,4,2),
('小樽ワイン赤白セット',5200,13,73,2.8,6,6,5,3),
('北海道産アスパラ1kg',3600,24,92,4.3,1,9,1,2),
('燻製ベーコンブロック',4300,16,64,3.1,3,7,2,4),
('知床昆布セット',2400,21,38,0.9,2,3,3,3),
('北海道ミルクジャム3種',2100,31,57,2.4,4,8,4,1),
('宗谷黒牛ステーキセット',12000,6,156,4.9,3,2,5,5),
('北海道とうもろこし10本',3400,27,101,3.6,1,4,1,2),
('鮭とば詰め合わせ',2900,20,79,1.7,2,5,2,3),
('ガラス細工オルゴール',4700,12,48,4.5,7,6,3,2),
('北海道はちみつセット',3900,18,83,4.0,1,8,4,2),
('十勝チーズケーキ',3500,25,214,4.8,5,3,5,1);

INSERT INTO order_items(order_id, product_id, quantity)VALUES
(1, 1, 4);

INSERT INTO order_items(order_id, product_id, quantity)VALUES
(2, 2, 18);

INSERT INTO order_items(order_id, product_id, quantity)VALUES
(3, 17, 40);

INSERT INTO order_items(order_id, product_id, quantity)VALUES
(4, 7, 30);

INSERT INTO order_items(order_id, product_id, quantity)VALUES
(5, 3, 50);

INSERT INTO reviews(user_id,product_id,description,star)
VALUES
-- product_id = 1
(3,1,'ホクホクで美味しかった',4.2),
(1,1,'少し小ぶりだった',2.8),
(5,1,'また買いたい',4.7),

-- product_id = 2
(2,2,'鮭の脂がのっていた',4.5),
(4,2,'思ったより普通',3.1),
(1,2,'ご飯に合う',4.0),

-- product_id = 3
(5,3,'家族みんなで楽しめた',4.8),
(2,3,'肉が柔らかい',4.6),
(3,3,'少し高いかも',3.4),

-- product_id = 4
(1,4,'チーズ好きには最高',4.9),
(4,4,'香りが強かった',2.7),
(5,4,'ワインと合う',4.3),

-- product_id = 5
(2,5,'安定の美味しさ',5.0),
(3,5,'甘すぎず食べやすい',4.5),
(1,5,'量がちょうど良い',4.2),

-- product_id = 6
(4,6,'飲み比べが楽しい',4.1),
(5,6,'日本酒好きにおすすめ',4.6),
(2,6,'好みが分かれそう',2.5),

-- product_id = 7
(3,7,'存在感がすごい',3.9),
(1,7,'ネタとして買った',4.4),
(4,7,'思ったよりかわいい',4.1),

-- product_id = 8
(5,8,'めちゃくちゃ甘い',5.0),
(2,8,'贈り物に最適',4.8),
(3,8,'値段は高め',3.7),

-- product_id = 9
(1,9,'粒が大きい',4.7),
(4,9,'醤油加減が良い',4.5),
(5,9,'少し生臭かった',2.2),

-- product_id = 10
(2,10,'ホタテが肉厚',4.9),
(3,10,'バター焼きが最高',4.6),
(1,10,'量が少なく感じた',3.0),

-- product_id = 11
(5,11,'スパイス感が良い',4.2),
(2,11,'辛さがちょうどいい',4.0),
(4,11,'期待しすぎた',2.4),

-- product_id = 12
(3,12,'北海道土産の定番',4.8),
(1,12,'サクサクしてる',4.5),
(5,12,'ちょっと甘い',3.2),

-- product_id = 13
(2,13,'種類が多くて楽しい',4.4),
(4,13,'包装が綺麗',4.1),
(1,13,'普通だった',2.9),

-- product_id = 14
(5,14,'香りに癒される',4.7),
(3,14,'思ったより小さい',2.0),
(2,14,'部屋が北海道っぽくなる',4.3),

-- product_id = 15
(4,15,'料理に使いやすい',4.2),
(1,15,'コクがある',4.5),
(5,15,'少し高い',3.1),

-- product_id = 16
(3,16,'酒のつまみに最高',4.6),
(2,16,'塩味が強い',2.6),
(4,16,'焼くと美味しい',4.1),

-- product_id = 17
(5,17,'子供が喜んでた',4.8),
(1,17,'甘さ控えめ',4.0),
(2,17,'量が少ない',2.7),

-- product_id = 18
(4,18,'カニ味噌が濃厚',5.0),
(3,18,'特別感がある',4.9),
(1,18,'殻を剥くのが大変',2.5),

-- product_id = 19
(2,19,'味噌スープが美味しい',4.4),
(5,19,'麺がもちもち',4.2),
(3,19,'普通かな',3.0),

-- product_id = 20
(1,20,'ワイン好き向け',4.5),
(4,20,'飲みやすい',4.0),
(2,20,'少し渋かった',2.8),

-- product_id = 21
(5,21,'新鮮で甘い',4.7),
(3,21,'太くて立派',4.4),
(1,21,'筋っぽかった',2.3),

-- product_id = 22
(2,22,'燻製の香りが良い',4.3),
(4,22,'パンによく合う',4.1),
(5,22,'脂っこい',2.7),

-- product_id = 23
(1,23,'出汁がよく出る',4.2),
(3,23,'健康に良さそう',3.8),
(2,23,'地味だった',1.9),

-- product_id = 24
(4,24,'パンに合う',4.1),
(5,24,'牛乳感が強い',4.3),
(1,24,'少し甘すぎる',2.5),

-- product_id = 25
(2,25,'肉質が最高',5.0),
(3,25,'柔らかくてジューシー',4.8),
(4,25,'価格が高い',3.1),

-- product_id = 26
(1,26,'粒が大きい',4.0),
(5,26,'甘くて美味しい',4.5),
(2,26,'鮮度が普通',2.6),

-- product_id = 27
(3,27,'噛むほど美味しい',4.1),
(4,27,'お酒に合う',4.4),
(1,27,'少し硬い',2.2),

-- product_id = 28
(5,28,'綺麗な音色',4.7),
(2,28,'プレゼント用に購入',4.3),
(3,28,'思ったより小さい',2.8),

-- product_id = 29
(1,29,'香りが良い',4.6),
(4,29,'ヨーグルトに合う',4.2),
(5,29,'少しクセがある',2.9),

-- product_id = 30
(2,30,'濃厚で美味しい',4.8),
(3,30,'チーズ感が強い',4.5),
(1,30,'甘すぎた',2.4);

/* 商品画像の追加 */
INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/poteto1.jpg', 'いも1', 1),
('/images/products_image/poteto2.jpg', 'いも2', 1),
('/images/products_image/poteto3.jpg', 'いも3', 1);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/salmon1.jpg', '鮭1', 2),
('/images/products_image/salmon2.jpg', '鮭2', 2),
('/images/products_image/salmon3.jpg', '鮭3', 2);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/jin1.jpg', 'ジンギスカンセット1', 3),
('/images/products_image/jin2.jpg', 'ジンギスカンセット2', 3),
('/images/products_image/jin3.jpg', 'ジンギスカンセット3', 3);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/cheese1.jpg', 'チーズ1', 4),
('/images/products_image/cheese2.jpg', 'チーズ2', 4),
('/images/products_image/cheese3.jpg', 'チーズ3', 4);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/cho1.jpg', 'チョコ1', 5),
('/images/products_image/cho2.jpg', 'チョコ2', 5),
('/images/products_image/cho3.jpg', 'チョコ3', 5);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/sake1.jpg', '酒1', 6),
('/images/products_image/sake2.jpg', '酒2', 6),
('/images/products_image/sake3.jpg', '酒3', 6);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/kuma1.jpg', '熊1', 7),
('/images/products_image/kuma2.jpg', '熊2', 7),
('/images/products_image/kuma3.jpg', '熊3', 7);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/meron1.jpg', '夕張メロン秀品', 8),
('/images/products_image/meron2.jpg', '夕張メロン秀品', 8),
('/images/products_image/meron3.jpg', '夕張メロン秀品', 8);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/ikura1.jpg', 'いくら醤油漬け500g', 9),
('/images/products_image/ikura2.webp', 'いくら醤油漬け500g', 9),
('/images/products_image/ikura3.webp', 'いくら醤油漬け500g', 9);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/hotate1.webp', '北海道産ホタテ1kg', 10),
('/images/products_image/hotate2.jpg', '北海道産ホタテ1kg', 10),
('/images/products_image/hotate3.jpg', '北海道産ホタテ1kg', 10);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/soupkare1.webp', 'スープカレーセット', 11),
('/images/products_image/soupkare2.jpg', 'スープカレーセット', 11),
('/images/products_image/soupkare3.webp', 'スープカレーセット', 11);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/siroikoibito1.webp', '白い恋人36枚入り', 12),
('/images/products_image/siroikoibito2.jpg', '白い恋人36枚入り', 12),
('/images/products_image/siroikoibito3.jpg', '白い恋人36枚入り', 12);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/rokkatei1.webp', '六花亭詰め合わせ', 13),
('/images/products_image/rokkatei2.jpg', '六花亭詰め合わせ', 13),
('/images/products_image/rokkatei3.webp', '六花亭詰め合わせ', 13);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/hurano1.jpg', '富良野ラベンダーオイル', 14),
('/images/products_image/hurano2.jpg', '富良野ラベンダーオイル', 14),
('/images/products_image/hurano3.jpg', '富良野ラベンダーオイル', 14);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/bata-1.png', '北海道バター3個セット', 15),
('/images/products_image/bata-2.jpg', '北海道バター3個セット', 15),
('/images/products_image/bata-3.jpg', '北海道バター3個セット', 15);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/sisyamo1.jpg', '本ししゃも20尾', 16),
('/images/products_image/sisyamo2.jpg', '本ししゃも20尾', 16),
('/images/products_image/sisyamo3.jpg', '本ししゃも20尾', 16);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/purin1.jpg', '北海道牛乳プリンセット', 17),
('/images/products_image/purin2.jpg', '北海道牛乳プリンセット', 17),
('/images/products_image/purin3.jpg', '北海道牛乳プリンセット', 17);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/kegani1.jpg', '毛ガニ姿盛り', 18),
('/images/products_image/kegani2.jpg', '毛ガニ姿盛り', 18),
('/images/products_image/kegani3.jpg', '毛ガニ姿盛り', 18);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/ra-men1.webp', '札幌味噌ラーメン4食セット', 19),
('/images/products_image/ra-men2.jpg', '札幌味噌ラーメン4食セット', 19),
('/images/products_image/ra-men3.jpg', '札幌味噌ラーメン4食セット', 19);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/wain1.jpg', '小樽ワイン赤白セット', 20),
('/images/products_image/wain2.jpg', '小樽ワイン赤白セット', 20),
('/images/products_image/wain3.jpg', '小樽ワイン赤白セット', 20);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/asupara.webp', '北海道産アスパラ1kg', 21),
('/images/products_image/asupara2.jpg', '北海道産アスパラ1kg', 21),
('/images/products_image/asupara3.jpg', '北海道産アスパラ1kg', 21);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/be-kon1.jpg', '燻製ベーコンブロック', 22),
('/images/products_image/be-kon2.jpg', '燻製ベーコンブロック', 22),
('/images/products_image/be-kon3.jpg', '燻製ベーコンブロック', 22);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/konbu1.jpg', '知床昆布セット', 23),
('/images/products_image/konbu2.jpg', '知床昆布セット', 23),
('/images/products_image/konbu3.jpg', '知床昆布セット', 23);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/jam1.webp', '北海道ミルクジャム3種', 24),
('/images/products_image/jam2.jpg', '北海道ミルクジャム3種', 24),
('/images/products_image/jam3.jpg', '北海道ミルクジャム3種', 24);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/sute-ki1.jpg', '宗谷黒牛ステーキセット', 25),
('/images/products_image/sute-ki2.jpg', '宗谷黒牛ステーキセット', 25),
('/images/products_image/sute-ki3.jpg', '宗谷黒牛ステーキセット', 25);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/toumorokosi1.avif', '北海道とうもろこし10本', 26),
('/images/products_image/toumorokosi2.jpg', '北海道とうもろこし10本', 26),
('/images/products_image/toumorokosi3.jpg', '北海道とうもろこし10本', 26);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/saketoba1.webp', '鮭とば詰め合わせ', 27),
('/images/products_image/saketoba2.jpg', '鮭とば詰め合わせ', 27),
('/images/products_image/saketoba3.jpg', '鮭とば詰め合わせ', 27);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/orugo-ru1.jpg', 'ガラス細工オルゴール', 28),
('/images/products_image/orugo-ru2.jpg', 'ガラス細工オルゴール', 28),
('/images/products_image/orugo-ru3.jpg', 'ガラス細工オルゴール', 28);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/hatimitu1.jpg', '北海道はちみつセット', 29),
('/images/products_image/hatimitu2.webp', '北海道はちみつセット', 29),
('/images/products_image/hatimitu3.jpg', '北海道はちみつセット', 29);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/products_image/cheesecake1.webp', '十勝チーズケーキ', 30),
('/images/products_image/cheesecake2.webp', '十勝チーズケーキ', 30),
('/images/products_image/cheesecake3.jpg', '十勝チーズケーキ', 30);


    
/* ユーザのお気に入り商品の追加 */
INSERT INTO favorites(user_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 1), 
(3, 1),
(4, 1),
(5, 1);

/*クーポン*/
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<レベル20達成特典>10%割引クーポン', '2026-05-21', 0.1);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<レベル40達成特典>20%割引クーポン', '2026-05-21', 0.2);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<レベル60達成特典>30%割引クーポン', '2026-05-21', 0.3);

INSERT INTO coupons(name, expiration_date, rate)VALUES
('<スタンプ3個取得特典>5%割引クーポン', '2026-05-21', 0.05);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<スタンプ6個取得特典>10%割引クーポン', '2026-05-21', 0.1);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<スタンプ9個取得特典>15%割引クーポン', '2026-05-21', 0.15);

INSERT INTO coupons(name, expiration_date, rate)VALUES
('<実績5個達成特典>5%割引クーポン', '2026-05-21', 0.05);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<実績10個達成特典>15%割引クーポン', '2026-05-21', 0.15);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('<実績15個達成特典>20%割引クーポン', '2026-05-21', 0.2);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('100%割引クーポン', '2026-05-15', 1.0);
 
INSERT INTO users_achievements(user_id, achievement_id, unlocked_at) VALUES
(1, 1, CURRENT_DATE);
INSERT INTO users_achievements(user_id, achievement_id, unlocked_at) VALUES
(2, 1, CURRENT_DATE);
INSERT INTO users_achievements(user_id, achievement_id, unlocked_at) VALUES
(3, 1, CURRENT_DATE);
INSERT INTO users_achievements(user_id, achievement_id, unlocked_at) VALUES
(4, 1, CURRENT_DATE);
INSERT INTO users_achievements(user_id, achievement_id, unlocked_at) VALUES
(5, 1, CURRENT_DATE);


/*スタンプ*/
--INSERT INTO users_stamps( user_id, hokkaido_area_id, unlocked_at)VALUES
--(1, 1, CURRENT_DATE );
--
--INSERT INTO users_stamps( user_id, hokkaido_area_id, unlocked_at)VALUES
--(1, 5, CURRENT_DATE );







 