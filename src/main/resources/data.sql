/*実績*/
INSERT INTO achievements(name, image_path, description, method_name) VALUES 
    ('初めてのお客様', '実績1の画像パス', '実績1の説明', 'isFirstPurchase'),
    ('常連さん', '実績2の画像パス', '実績2の説明', 'isRepeatCustomer5Times'),
    ('北海道マスター', '実績3の画像パス', '実績3の説明', 'isHokkaidoMaster20Times'),
    ('爆買い王', '実績4の画像パス', '実績4の説明', 'isBulkBuyer10Items'),
    ('スイーツハンター', '実績5の画像パス', '実績5の説明', 'isSweetsHunter'),
    ('海鮮マスター', '実績6の画像パス', '実績6の説明', 'isSeafoodMaster'),
    ('農家さんのお友達', '実績7の画像パス', '実績7の説明', 'isFarmFriend'),
    ('温泉好き', '実績8の画像パス', '実績8の説明', 'isOnsenLover'),
    ('北海道グルメ制覇', '実績9の画像パス', '実績9の説明', 'isHokkaidoGourmetComplete'),
    ('札幌制覇', '実績10の画像パス', '実績10の説明', 'isSapporoStampCompleted'),
    ('函館グルメ旅', '実績11の画像パス', '実績11の説明', 'isHakodateStampCompleted'),
    ('富良野マスター', '実績12の画像パス', '実績12の説明', 'isFuranoStampCompleted'),
    ('北海道一周', '実績13の画像パス', '実績13の説明', 'isHokkaidoRoundTrip'),
    ('最強コンボ', '実績14の画像パス', '実績14の説明', 'isBestComboJingisukanBeer'),
    ('海の幸セット', '実績15の画像パス', '実績15の説明', 'isSeafoodComboSet'),
    ('北海道に貢献', '実績16の画像パス', '実績16の説明', 'isTotalSpent10000'),
    ('大富豪', '実績17の画像パス', '実績17の説明', 'isTotalSpent50000'),
    ('伝説の支援者', '実績18の画像パス', '実績18の説明', 'isTotalSpent100000'),
    ('奇跡の組み合わせ', '実績19の画像パス', '実績19の説明', 'isMiracleCombination'),
    ('ランダム達成', '実績20の画像パス', '実績20の説明', 'isRandomAchievement'),
    ('シークレット実績', '実績21の画像パス', '実績21の説明', 'isSecretAchievement');


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
('札幌','aaa'),('室蘭登別','bbb'),('帯広','ccc'),('岩見沢','ddd'),('函館','eee'),
('小樽','fff'),('旭川','ggg'),('夕張','hhh'),('帯広','iii'),('知床','jjj');

INSERT INTO producers
(user_id, image_path,image_description,catchcopy,hokkaido_area_id)
VALUES
(5,'a','aa','aaa',1),(2,'b','bb','bbb',2);

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
('/images/poteto1.jpg', 'いも1', 2),
('/images/poteto2.jpg', 'いも2', 2),
('/images/poteto3.jpg', 'いも3', 2);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 3),
('/images/poteto2.jpg', 'いも2', 3),
('/images/poteto3.jpg', 'いも3', 3);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 4),
('/images/poteto2.jpg', 'いも2', 4),
('/images/poteto3.jpg', 'いも3', 4);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 5),
('/images/poteto2.jpg', 'いも2', 5),
('/images/poteto3.jpg', 'いも3', 5);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 6),
('/images/poteto2.jpg', 'いも2', 6),
('/images/poteto3.jpg', 'いも3', 6);

INSERT INTO product_images(image_path, image_description, product_id)
VALUES
('/images/poteto1.jpg', 'いも1', 7),
('/images/poteto2.jpg', 'いも2', 7),
('/images/poteto3.jpg', 'いも3', 7);

/*ユーザーが所持している実績*/
INSERT INTO users_achievements (user_id, achievement_id, unlocked_at) VALUES
    (1, 1, CURRENT_DATE),
    (1, 3, CURRENT_DATE),
    (1, 5, CURRENT_DATE),
    (1, 8, CURRENT_DATE),
    (1, 2, CURRENT_DATE),
    (1, 10, CURRENT_DATE),
    (1, 15, CURRENT_DATE),
    (1, 20, CURRENT_DATE),
    (2, 1, CURRENT_DATE),
    (2, 21, CURRENT_DATE);
    
/* ユーザのお気に入り商品の追加 */
INSERT INTO favorites(user_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 1), 
(3, 1),
(4, 1),
(5, 1);






 