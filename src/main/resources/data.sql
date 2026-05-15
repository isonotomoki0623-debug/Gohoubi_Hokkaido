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
('尊さん','Takeru123','takeru@example.com' , 1 , 1, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆきちゃん', 'Yuki123','yuki@example.com ', 2 , 99, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('ゆりか',' yurika123','yurika@example.com' , 3 , 10, 1 , 'User');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('磯野倫希', 'Tomoki123','tomoki@example.com' , 2 , 5, 1 , 'Admin');

INSERT INTO users(name, password , email , job_id, level, prefecture_id, role) VALUES
('しゅん', 'Shun123','shun@example.com' , 1, 2, 2 , 'User');

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


INSERT INTO achievements(name,image_path,description)
VALUES
('はじめの一歩','aaa','はじめて購入した'),('一人前','bbb','5回購入した'),
('プロフェッショナル','ccc','10回購入した'),('小作人','ddd','はじめて農作物を購入した');

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
(1,6,'よきかな',4.0),(2,7,'サイズ選びが難しい',4.0);

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








