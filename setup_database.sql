DROP TABLE IF EXISTS seller;
CREATE TABLE seller (
    id INT PRIMARY KEY,
    nickname VARCHAR
);

DROP TABLE IF EXISTS address;
CREATE TABLE address (
    id VARCHAR PRIMARY KEY,
    state_id VARCHAR,
    state_name VARCHAR,
    city_name VARCHAR
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id VARCHAR PRIMARY KEY,
    seller_id INT,
    city_id VARCHAR,
    title VARCHAR,
    condition VARCHAR,
    thumbnail_id VARCHAR,
    catalog_product_id VARCHAR,
    listing_type_id VARCHAR,
    sanitized_title VARCHAR,
    permalink VARCHAR,
    buying_mode VARCHAR,
    site_id VARCHAR,
    category_id VARCHAR,
    domain_id VARCHAR,
    thumbnail VARCHAR,
    currency_id VARCHAR,
    order_backend INT,
    price FLOAT,
    original_price FLOAT,
    sales_price_amount FLOAT,
    sales_price_regular_amount FLOAT,
    available_quantity INT,
    official_store_id VARCHAR,
    use_thumbnail_id BOOLEAN,
    accepts_mercadopago BOOLEAN,
    FOREIGN KEY (seller_id) REFERENCES seller(id),
    FOREIGN KEY (city_id) REFERENCES address(id)
);

DROP TABLE IF EXISTS shipping;
CREATE TABLE shipping (
    product_id VARCHAR PRIMARY KEY,
    store_pick_up BOOLEAN,
    free_shipping BOOLEAN,
    logistic_type VARCHAR,
    mode VARCHAR,
    benefits VARCHAR,
    promise VARCHAR,
    shipping_score INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
DROP TABLE IF EXISTS attributes;
CREATE TABLE attributes (
    id VARCHAR PRIMARY KEY,
    product_id VARCHAR,
    name VARCHAR,
    value_id VARCHAR,
    value_name VARCHAR,
    attribute_group_id VARCHAR,
    attribute_group_name VARCHAR,
    source VARCHAR,
    value_type VARCHAR,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
DROP TABLE IF EXISTS installments;
CREATE TABLE installments (
    product_id VARCHAR PRIMARY KEY,
    quantity INT,
    amount FLOAT,
    rate FLOAT,
    currency_id VARCHAR,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
