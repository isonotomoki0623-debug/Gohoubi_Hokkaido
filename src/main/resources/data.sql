/*実績*/
INSERT INTO achievements(name, image_path, description, method_name) VALUES 
    ('初めてのお客様', '/images/image_achievements/01_first_visiter.PNG', '実績1の説明', 'isFirstPurchase'),
    ('常連さん', '/images/image_achievements/02_regular_customer.PNG', '実績2の説明', 'isRepeatCustomer5Times'),
    ('北海道マスター', '/images/image_achievements/03_hokkaido_master.PNG', '実績3の説明', 'isHokkaidoMaster20Times'),
    ('爆買い王', '/images/image_achievements/04_bulk_buyer_king.PNG', '実績4の説明', 'isBulkBuyer10Items'),
    ('スイーツハンター', '/images/image_achievements/05_sweets_hunter.PNG', '実績5の説明', 'isSweetsHunter'),
    ('海鮮マスター', '/images/image_achievements/06_seafood_master.PNG', '実績6の説明', 'isSeafoodMaster'),
    ('農家さんのお友達', '/images/image_achievements/07_farmers_friend.PNG', '実績7の説明', 'isFarmFriend'),
    ('北海道グルメ制覇', '/images/image_achievements/08_all_around_gourmet.PNG', '実績9の説明', 'isHokkaidoGourmetComplete'),
    ('札幌制覇', '/images/image_achievements/09_sapporo_master.PNG', '実績10の説明', 'isSapporoStampCompleted'),
    ('函館グルメ旅', '/images/image_achievements/10_hakodate_master.PNG', '実績11の説明', 'isHakodateStampCompleted'),
    ('富良野マスター', '/images/image_achievements/11_furano_master.PNG', '実績12の説明', 'isFuranoStampCompleted'),
    ('北海道一周', '/images/image_achievements/12_hokkaido_tour.PNG', '実績13の説明', 'isHokkaidoRoundTrip'),
    ('最強コンボ', '/images/image_achievements/13_ultimate_combo.png', '実績14の説明', 'isBestComboJingisukanBeer'),
    ('海の幸セット', '/images/image_achievements/14_seafood_set.PNG', '実績15の説明', 'isSeafoodComboSet'),
    ('北海道に貢献', '/images/image_achievements/15_hokkaido_contributer.PNG', '実績16の説明', 'isTotalSpent10000'),
    ('大富豪', '/images/image_achievements/16_millionaire.PNG', '実績17の説明', 'isTotalSpent50000'),
    ('伝説の支援者', '/images/image_achievements/17_legendary_supporter.PNG', '実績18の説明', 'isTotalSpent100000'),
    ('ランダム達成', '/images/image_achievements/18_random_achievement.PNG', '実績20の説明', 'isRandomAchievement'),
    ('シークレット実績', '/images/image_achievements/19_secret_achievement.PNG', '実績21の説明', 'isSecretAchievement');


/*職業*/
INSERT INTO jobs(name, image_path) VALUES
('農家','aaa');

INSERT INTO jobs(name, image_path) VALUES
('漁師','aaa');

INSERT INTO jobs(name, image_path) VALUES
('牧場主','aaa');

/*都道府県*/
INSERT INTO prefectures(name) VALUES
('北海道');
INSERT INTO prefectures(name) VALUES
('東京');

/*ユーザー情報*/

INSERT INTO users(name, password  , email , job_id,level, prefecture_id,  role) VALUES
('尊さん','$2a$10$QDgCelnzlrxcONKfVuh9meHNMs9PSxOqIV47Q89ZTd889wFZmyuWO','takeru@example.com' , 1 , 1, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆきちゃん', '$2a$10$ThvVpqvzDNeKC32KnA3Ga.hPND2R7mJI8pYPqKb1DVN1wx1LUiLK2','yuki@example.com ', 2 , 99, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆりか',' $2a$10$kohxjV.rIzLhQSL/qusX2uzTM0cPAQMgEb5c.yXD0k2DPIa/Hj.8y','yurika@example.com' , 3 , 10, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('磯野倫希', '$2a$10$ZIntxJjnSDWhKkg82IaBz.k3zPPa/JmkQJnc6py7K3rcTFt9mgsgi','tomoki@example.com' , 2 , 5, 1 , 'Admin');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('しゅん', '$2a$10$IGbdSmPeQXiI5Sey3u.vAeYgkQBZJseo6L.pLT3torx6m4dtLUTtW','shun@example.com' , 1, 2, 2 , 'User');

INSERT INTO hokkaido_areas(name,image_path)
VALUES
('札幌','/images/stamp_image/Sapporo_01.svg.png'),('室蘭・登別','/images/stamp_image/Muroran_02.svg.png'),('帯広','/images/stamp_image/Obihiro_03.svg.png'),('岩見沢','/images/stamp_image/Iwamizawa_04.svg.png'),('函館','/images/stamp_image/Hakodate_05.svg.png'),
('小樽','/images/stamp_image/Otaru_06.svg.png'),('旭川','/images/stamp_image/Asahikawa_07.svg.png'),('夕張','/images/stamp_image/Yubari_08.svg.png'),('富良野','/images/stamp_image/Furano_09.svg.png');



INSERT INTO product_categories(name)
VALUES('農作物'),('海産物'),('肉・畜産品'),('乳製品'),('スイーツ・お菓子'),('酒・飲料'),('消耗品');

INSERT INTO products
(name,price,stock,review_sum,review_star,product_category_id,hokkaido_area_id,user_id,shipping_interval) 
VALUES
('じゃがいも5kg',3000,50,2,3.5,1,1,2,2),
('冷凍鮭2kg',3000,30,2,4.0,2,2,5,5),
('ジンギスカンセット',5000,25,1,5.0,3,3,5,4),
('ナチュラルチーズ3種詰め合わせ',4500,12,1,4.0,4,4,2,3),
('贈答用ロイズチョコレート',4000,20,2,3.5,5,5,2,1),
('男山飲み比べセット',3500,10,3,3.0,6,6,2,1),
('木彫りの熊（ぽんこ）',5000,15,5,4.6,7,7,5,5);

INSERT INTO reviews(user_id,product_id,description,star)
VALUES
(1,1,'思ってたのと違った',1.0),(2,2,'発想が遅かった',2.0),(3,3,'普通',3.0),
(4,4,'美味しかった',4.0),(5,5,'最高です',5.0),
(1,6,'よきかな',4.0),(2,7,'サイズ選びが難しい',4.0),
(2,1,'思ってたのと違った！',5.0);

/* 商品画像の追加 */
INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 1),
('/images/poteto2.jpg', 'いも2', 1),
('/images/poteto3.jpg', 'いも3', 1);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/salmon1.jpg', '鮭1', 2),
('/images/salmon2.jpg', '鮭2', 2),
('/images/salmon3.jpg', '鮭3', 2);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/jin1.jpg', 'ジンギスカンセット1', 3),
('/images/jin2.jpg', 'ジンギスカンセット2', 3),
('/images/jin3.jpg', 'ジンギスカンセット3', 3);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/cheese1.jpg', 'チーズ1', 4),
('/images/cheese2.jpg', 'チーズ2', 4),
('/images/cheese3.jpg', 'チーズ3', 4);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/cho1.jpg', 'チョコ1', 5),
('/images/cho2.jpg', 'チョコ2', 5),
('/images/cho3.jpg', 'チョコ3', 5);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/sake1.jpg', '酒1', 6),
('/images/sake2.jpg', '酒2', 6),
('/images/sake3.jpg', '酒3', 6);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/kuma1.jpg', '熊1', 7),
('/images/kuma2.jpg', '熊2', 7),
('/images/kuma3.jpg', '熊3', 7);

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
('10%割引きクーポン', '2026-05-21', 0.1);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('20%割引きクーポン', '2026-05-21', 0.2);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('30%割引きクーポン', '2026-05-21', 0.3);
 
INSERT INTO coupons(name, expiration_date, rate)VALUES
('100%割引きクーポン', '2026-05-15', 1.0);
 
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





 