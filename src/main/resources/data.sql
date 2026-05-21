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
('農家','/images/farmer.png');

INSERT INTO jobs(name, image_path) VALUES
('漁師','/images/farmer.png');

INSERT INTO jobs(name, image_path) VALUES
('牧場主','/images/farmer.png');

/*都道府県*/
INSERT INTO prefectures(name) VALUES
('北海道');
INSERT INTO prefectures(name) VALUES
('東京');

/*ユーザー情報*/

INSERT INTO users(name, password  , email , job_id,level, prefecture_id,  role) VALUES
('尊さん','$2a$10$QDgCelnzlrxcONKfVuh9meHNMs9PSxOqIV47Q89ZTd889wFZmyuWO','takeru@example.com' , 1 , 0, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆきちゃん', '$2a$10$ThvVpqvzDNeKC32KnA3Ga.hPND2R7mJI8pYPqKb1DVN1wx1LUiLK2','yuki@example.com ', 2 , 0, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆりか',' $2a$10$kohxjV.rIzLhQSL/qusX2uzTM0cPAQMgEb5c.yXD0k2DPIa/Hj.8y','yurika@example.com' , 3 , 0, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('磯野倫希', '$2a$10$ZIntxJjnSDWhKkg82IaBz.k3zPPa/JmkQJnc6py7K3rcTFt9mgsgi','tomoki@example.com' , 2 , 0, 1 , 'Admin');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('しゅん', '$2a$10$IGbdSmPeQXiI5Sey3u.vAeYgkQBZJseo6L.pLT3torx6m4dtLUTtW','shun@example.com' , 1, 0, 2 , 'User');

INSERT INTO hokkaido_areas(name,image_path)
VALUES
('札幌','/images/stamp_image/Sapporo_01.svg.png'),('室蘭・登別','/images/stamp_image/Muroran_02.svg.png'),('帯広','/images/stamp_image/Obihiro_03.svg.png'),('岩見沢','/images/stamp_image/Iwamizawa_04.svg.png'),('函館','/images/stamp_image/Hakodate_05.svg.png'),
('小樽','/images/stamp_image/Otaru_06.svg.png'),('旭川','/images/stamp_image/Asahikawa_07.svg.png'),('夕張','/images/stamp_image/Yubari_08.svg.png'),('富良野','/images/stamp_image/Furano_09.svg.png');



INSERT INTO product_categories(name)
VALUES('農作物'),('海産物'),('肉・畜産品'),('乳製品'),('スイーツ・お菓子'),('酒・飲料'),('消耗品');

INSERT INTO products
(name,price,stock,review_sum,review_star,product_category_id,hokkaido_area_id,user_id,shipping_interval) 
VALUES
('じゃがいも5kg',3000,50,2,3.5,1,1,1,2),
('冷凍鮭2kg',3000,30,2,4.0,2,2,2,5),
('ジンギスカンセット',5000,25,1,5.0,3,3,3,4),
('ナチュラルチーズ3種詰め合わせ',4500,12,1,4.0,4,4,4,3),
('贈答用ロイズチョコレート',4000,20,2,3.5,5,5,5,1),
('男山飲み比べセット',3500,10,3,3.0,6,7,1,1),
('木彫りの熊（ぽんこ）',5000,15,5,4.6,7,6,2,5),
('夕張メロン秀品',8000,8,10,4.9,1,8,3,2),
('いくら醤油漬け500g',6500,18,7,4.8,2,5,4,1),
('北海道産ホタテ1kg',5500,22,6,4.7,2,9,5,3),
('スープカレーセット',3200,35,4,4.2,3,1,1,2),
('白い恋人36枚入り',4200,40,15,4.9,5,1,2,1),
('六花亭詰め合わせ',3800,28,8,4.5,5,3,3,1),
('富良野ラベンダーオイル',2500,14,3,4.1,7,9,4,2),
('北海道バター3個セット',2800,26,5,4.4,4,7,5,2),
('本ししゃも20尾',4600,11,4,4.3,2,2,1,4),
('北海道牛乳プリンセット',3000,19,6,4.6,4,4,2,1),
('毛ガニ姿盛り',9800,9,12,5.0,2,5,3,5),
('札幌味噌ラーメン4食セット',2700,45,9,4.4,3,1,4,2),
('小樽ワイン赤白セット',5200,13,5,4.2,6,6,5,3),
('北海道産アスパラ1kg',3600,24,7,4.5,1,9,1,2),
('燻製ベーコンブロック',4300,16,4,4.3,3,7,2,4),
('知床昆布セット',2400,21,2,4.0,2,3,3,3),
('北海道ミルクジャム3種',2100,31,3,4.1,4,8,4,1),
('宗谷黒牛ステーキセット',12000,6,11,4.9,3,2,5,5),
('北海道とうもろこし10本',3400,27,5,4.3,1,4,1,2),
('鮭とば詰め合わせ',2900,20,4,4.2,2,5,2,3),
('ガラス細工オルゴール',4700,12,6,4.7,7,6,3,2),
('北海道はちみつセット',3900,18,7,4.6,1,8,4,2),
('十勝チーズケーキ',3500,25,8,4.8,5,3,5,1);

INSERT INTO reviews(user_id,product_id,description,star)
VALUES
(1,1,'思ってたのと違った',1.0),(2,2,'発想が遅かった',2.0),(3,3,'普通',3.0),
(4,4,'美味しかった',4.0),(5,5,'最高です',5.0),
(1,6,'よきかな',4.0),(2,7,'サイズ選びが難しい',4.0),
(2,1,'思ってたのと違った！',5.0);

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

/*ユーザーが所持している実績*/
INSERT INTO users_achievements (user_id, achievement_id, unlocked_at) VALUES
    (1, 9, CURRENT_DATE),
    (1, 3, CURRENT_DATE),
    (1, 5, CURRENT_DATE),
    (1, 8, CURRENT_DATE),
    (1, 2, CURRENT_DATE),
    (1, 10, CURRENT_DATE),
    (1, 15, CURRENT_DATE),
    (2, 1, CURRENT_DATE);
    
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
('10%割引クーポン', '2026-05-21', 0.1);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('20%割引クーポン', '2026-05-21', 0.2);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('30%割引クーポン', '2026-05-21', 0.3);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('100%割引クーポン', '2026-05-15', 1.0);
 
INSERT INTO coupons_users( user_id,  coupon_id)VALUES
(1, 1);
 
INSERT INTO coupons_users( user_id,  coupon_id)VALUES
(1, 2);
 
INSERT INTO coupons_users( user_id,  coupon_id)VALUES
(1, 3);
 
INSERT INTO coupons_users( user_id,  coupon_id)VALUES
(1, 4);


/*スタンプ*/
--INSERT INTO users_stamps( user_id, hokkaido_area_id, unlocked_at)VALUES
--(1, 1, CURRENT_DATE );
--
--INSERT INTO users_stamps( user_id, hokkaido_area_id, unlocked_at)VALUES
--(1, 5, CURRENT_DATE );







 