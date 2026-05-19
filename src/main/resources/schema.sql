-- ==========================================
-- 1. DROP TABLE (制約の依存関係を考慮した順序)
-- ==========================================

-- 依存関係の末端（中間テーブル・子テーブル）から削除
DROP TABLE IF EXISTS favorites;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS coupons_users;
DROP TABLE IF EXISTS users_stamps;
DROP TABLE IF EXISTS users_achievements;
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS producers;

-- 次に親テーブルを削除
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS coupons;
DROP TABLE IF EXISTS users;

-- 最後に独立したマスターテーブルを削除
DROP TABLE IF EXISTS product_categories;
DROP TABLE IF EXISTS hokkaido_areas;
DROP TABLE IF EXISTS prefectures;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS achievements;

-- ==========================================
-- 2. CREATE TABLE (親から順に作成)
-- ==========================================

-- マスターテーブル群
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_path VARCHAR NOT NULL
);

CREATE TABLE prefectures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE hokkaido_areas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_path VARCHAR NOT NULL
);

CREATE TABLE product_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE achievements (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_path VARCHAR NOT NULL,
    description VARCHAR(100) NOT NULL,
    method_name VARCHAR(100) NOT NULL
);

CREATE TABLE coupons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    expiration_date DATE NOT NULL,
    rate FLOAT NOT NULL
);

-- ユーザーテーブル
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    job_id INTEGER NOT NULL REFERENCES jobs(id),
    level INTEGER NOT NULL,
    prefecture_id INTEGER NOT NULL REFERENCES prefectures(id),
    role VARCHAR NOT NULL
);

-- 商品テーブル
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    review_sum INTEGER NOT NULL,
    review_star FLOAT NOT NULL,
    product_category_id INTEGER NOT NULL REFERENCES product_categories(id),
    hokkaido_area_id INTEGER REFERENCES hokkaido_areas(id),
    user_id INTEGER REFERENCES users(id),
    shipping_interval INTEGER NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    buy_at DATE NOT NULL,
    total_amount INTEGER NOT NULL,
    status BOOLEAN NOT NULL,
    coupon_id INTEGER REFERENCES coupons(id)
);

-- 子テーブル・中間テーブル群
CREATE TABLE order_items (
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL
);

CREATE TABLE product_images (
    id SERIAL PRIMARY KEY,
    image_path VARCHAR NOT NULL,
    image_description VARCHAR NOT NULL,
    product_id INTEGER REFERENCES products(id)
);

CREATE TABLE producers (
    user_id INTEGER PRIMARY KEY REFERENCES users(id),
    image_path VARCHAR NOT NULL,
    image_description VARCHAR NOT NULL,
    catchcopy VARCHAR(200) NOT NULL,
    hokkaido_area_id INTEGER REFERENCES hokkaido_areas(id)
);

CREATE TABLE users_achievements (
    user_id INTEGER REFERENCES users(id),
    achievement_id INTEGER REFERENCES achievements(id),
    unlocked_at DATE,
    PRIMARY KEY (user_id, achievement_id)
);

CREATE TABLE users_stamps (
    user_id INTEGER REFERENCES users(id),
    hokkaido_area_id INTEGER REFERENCES hokkaido_areas(id),
    unlocked_at DATE,
    PRIMARY KEY (user_id, hokkaido_area_id)
);

CREATE TABLE reviews (
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES products(id),
    description VARCHAR(400),
    star FLOAT NOT NULL,
    PRIMARY KEY (user_id, product_id)
);

CREATE TABLE coupons_users (
    user_id INTEGER REFERENCES users(id),
    coupon_id INTEGER REFERENCES coupons(id),
    PRIMARY KEY (user_id, coupon_id)
);

CREATE TABLE favorites (
    user_id INTEGER REFERENCES users(id),
    product_id INTEGER REFERENCES products(id),
    PRIMARY KEY (user_id, product_id)
);