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








