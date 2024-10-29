create table categories
(
    id   serial8 primary key,
    name varchar(255) not null unique
);

create table options
(
    id          serial8 primary key,
    name        varchar(255)                    not null,
    category_id int8 references categories (id) not null
);

create table products
(
    id          serial8 primary key,
    name        varchar(255)                    not null,
    price       double precision                not null,
    category_id int8 references categories (id) not null
);

create table values
(
    id         serial8 primary key,
    name       varchar(255)                  not null,
    product_id int8 references products (id) not null,
    option_id  int8 references options (id)  not null,
    unique (product_id, option_id)
);


insert into categories (name)
values ('Процессоры'),
       ('Мониторы');

insert into products (name, price, category_id)
values ('Intel Core I9 9900', 249990, 1),
       ('AMD Ryzen R7 7700', 269990, 1),
       ('Samsung SU556270', 229990, 2),
       ('AOC Z215S659', 149990, 2);

insert into options (name, category_id)
values ('Производитель', 1),
       ('Количество ядер', 1),
       ('Сокет', 1),
       ('Производитель', 2),
       ('Диагональ', 2),
       ('Матрица', 2),
       ('Разрешение', 2);

insert into values (name, option_id, product_id)
values ('Intel', 1, 1),
       ('8', 2, 1),
       ('1250', 3, 1),
       ('AMD', 1, 2),
       ('12', 2, 2),
       ('1250', 3, 2),
       ('Samsung', 4, 3),
       ('27', 5, 3),
       ('TN', 6, 3),
       ('2560*1440', 7, 3),
       ('AOC', 4, 4),
       ('21.5', 5, 4),
       ('AH-IPS', 6, 4),
       ('1920*1080', 7, 4);
create table users
(
    id       serial primary key,
    role     int     not null,
    login    varchar not null,
    password varchar not null,
    created  date    not null
);
insert into users(role, login, password, created) VALUES (1,'a','1',now());

create table orders
(
    id      serial primary key,
    status  int     not null,
    adress  varchar not null,
    created timestamp    not null,
    user_id int8 references users(id) not null

);

create table orders_products
(id serial primary key ,
    product_id int8 references products (id) not null,
    order_id   int8 references orders (id)   not null,
    quantity   int                           not null,
    unique (product_id, order_id)

);
create table reviews
(
    id          serial primary key,
    published   int     not null,
    rate        int not null,
    review_text varchar(1000),
    publish_date timestamp not null,
    product_id int8 references products (id) not null,
    user_id  int8 references users (id)  not null,
    unique (product_id, user_id)


);

create table genres (
                        id serial8 primary key,
                        name varchar(50) not null
);

create table movies (
                        id serial8 primary key,
                        title varchar(100) not null,
                        release_year int2 not null,
                        rating float4 not null
);

create table movies_genres (
                               genre_id int8 not null,
                               movie_id int8 not null,
                               primary key (genre_id, movie_id),
                               foreign key (genre_id) references genres (id) on delete cascade,
                               foreign key (movie_id) references movies (id) on delete cascade
);



insert into genres (id, name) values (1, 'Драма');
insert into genres (id, name) values (2, 'Комедия');
insert into genres (id, name) values (3, 'Боевик');
insert into genres (id, name) values (4, 'Фантастика');
insert into genres (id, name) values (5, 'Ужасы');
insert into genres (id, name) values (6, 'Криминал');
insert into genres (id, name) values (7, 'Анимационный');
insert into genres (id, name) values (8, 'Триллер');
insert into genres (id, name) values (9, 'Приключение');
insert into genres (id, name) values (10, 'Фэнтези');
insert into genres (id, name) values (11, 'Биография');
insert into genres (id, name) values (12, 'История');
insert into genres (id, name) values (13, 'Романтика');
insert into genres (id, name) values (14, 'Мистика');
insert into genres (id, name) values (15, 'Война');
insert into genres (id, name) values (16, 'Музыка');



insert into movies (id, title, release_year, rating) values (1, 'Побег из Шоушенка', 1994, 9.3);
insert into movies (id, title, release_year, rating) values (2, 'Крестный Отец', 1972, 9.2);
insert into movies (id, title, release_year, rating) values (3, 'Тёмный Рыцарь', 2008, 9.0);
insert into movies (id, title, release_year, rating) values (4, 'Крестный Отец 2', 1974, 9.0);
insert into movies (id, title, release_year, rating) values (5, 'Список Шиндлера', 1993, 9.0);
insert into movies (id, title, release_year, rating) values (6, 'Властелин Колец: Возвращение Короля', 2003, 9.0);
insert into movies (id, title, release_year, rating) values (7, 'Криминальное Чтиво', 1994, 9.0);
insert into movies (id, title, release_year, rating) values (8, 'Властелин Колец: Братство Кольца', 2001, 8.8);
insert into movies (id, title, release_year, rating) values (9, 'Форрест Гамп', 1994, 8.8);
insert into movies (id, title, release_year, rating) values (10, 'Бойцовский Клуб', 1999, 8.8);
insert into movies (id, title, release_year, rating) values (11, 'Властелин Колец: Две Крепости', 2002, 8.8);
insert into movies (id, title, release_year, rating) values (12, 'Начало', 2010, 8.8);
insert into movies (id, title, release_year, rating) values (13, 'Звездные Войны V: Империя наносит ответный удар', 1980, 8.7);
insert into movies (id, title, release_year, rating) values (14, 'Матрица', 1999, 8.7);
insert into movies (id, title, release_year, rating) values (15, 'Человек-Паук: Паутина Вселенных', 2023, 8.8);
insert into movies (id, title, release_year, rating) values (16, 'Славные Парни', 1990, 8.7);
insert into movies (id, title, release_year, rating) values (17, 'Семь', 1995, 8.6);
insert into movies (id, title, release_year, rating) values (18, 'Эта замечательная жизнь', 1947, 8.6);
insert into movies (id, title, release_year, rating) values (19, 'Молчание ягнят', 1991, 8.6);
insert into movies (id, title, release_year, rating) values (20, 'Интерстеллар', 2014, 8.6);
insert into movies (id, title, release_year, rating) values (21, 'Спасти рядового Райана', 1998, 8.6);
insert into movies (id, title, release_year, rating) values (22, 'Зеленая Миля', 1999, 8.6);
insert into movies (id, title, release_year, rating) values (23, 'Звездные Войны IV: Новая надежда', 1977, 8.6);
insert into movies (id, title, release_year, rating) values (24, 'Теминатор 2: Судный день', 1991, 8.6);
insert into movies (id, title, release_year, rating) values (25, 'Назад в Будущее', 1985, 8.5);
insert into movies (id, title, release_year, rating) values (26, 'Унесенные призраками', 2001, 8.6);
insert into movies (id, title, release_year, rating) values (27, 'Пианист', 2002, 8.5);
insert into movies (id, title, release_year, rating) values (28, 'Оппенгеймер', 2023, 8.6);
insert into movies (id, title, release_year, rating) values (29, 'Психопат', 1960, 8.5);
insert into movies (id, title, release_year, rating) values (30, 'Паразит', 2019, 8.5);
insert into movies (id, title, release_year, rating) values (31, 'Гладиатор', 2000, 8.5);
insert into movies (id, title, release_year, rating) values (32, 'Король Лев', 1994, 8.5);
insert into movies (id, title, release_year, rating) values (33, 'Леон', 1994, 8.5);
insert into movies (id, title, release_year, rating) values (34, 'Американская история X', 1998, 8.5);
insert into movies (id, title, release_year, rating) values (35, 'Отпускники', 2006, 8.5);
insert into movies (id, title, release_year, rating) values (36, 'Одержимость', 2014, 8.5);
insert into movies (id, title, release_year, rating) values (37, 'Престиж', 2006, 8.5);
insert into movies (id, title, release_year, rating) values (38, '1+1', 2011, 8.5);
insert into movies (id, title, release_year, rating) values (39, 'Ла-Ла Ленд', 2016, 8.0);
insert into movies (id, title, release_year, rating) values (40, 'Тайна Коко', 2017, 8.4);
insert into movies (id, title, release_year, rating) values (41, 'Достучаться до небес', 1997, 8.6);
insert into movies (id, title, release_year, rating) values (42, 'Мстители: Финал', 2019, 8.4);
insert into movies (id, title, release_year, rating) values (43, 'Заводной апельсин', 1971, 8.3);
insert into movies (id, title, release_year, rating) values (44, 'Жизнь прекрасна', 1997, 8.6);
insert into movies (id, title, release_year, rating) values (45, 'Иван Васильевич меняет профессию', 1973, 8.2);
insert into movies (id, title, release_year, rating) values (46, 'Джокер', 2019, 8.4);
insert into movies (id, title, release_year, rating) values (47, 'Титаник', 1997, 7.8);
insert into movies (id, title, release_year, rating) values (48, 'Пираты Карибского моря: Проклятие Чёрной жемчужины', 2003, 8.0);
insert into movies (id, title, release_year, rating) values (49, 'ВАЛЛ·И', 2008, 8.4);
insert into movies (id, title, release_year, rating) values (50, 'Поймай меня, если сможешь', 2002, 8.1);
insert into movies (id, title, release_year, rating) values (51, 'Скайфолл', 2012, 7.7);
insert into movies (id, title, release_year, rating) values (52, 'Аватар', 2009, 7.8);
insert into movies (id, title, release_year, rating) values (53, 'Храброе сердце', 1995, 8.4);
insert into movies (id, title, release_year, rating) values (54, 'История игрушек', 1995, 8.3);
insert into movies (id, title, release_year, rating) values (55, 'Король Говорит!', 2010, 8.0);
insert into movies (id, title, release_year, rating) values (56, 'Бриллиантовая рука', 1969, 8.3);
insert into movies (id, title, release_year, rating) values (57, 'Монстры на каникулах', 2012, 7.1);
insert into movies (id, title, release_year, rating) values (58, 'Звёздные войны: Пробуждение Силы', 2015, 7.8);
insert into movies (id, title, release_year, rating) values (59, 'Гарри Поттер и философский камень', 2001, 7.6);
insert into movies (id, title, release_year, rating) values (60, 'Рататуй', 2007, 8.0);
insert into movies (id, title, release_year, rating) values (61, 'История игрушек 3', 2010, 8.2);
insert into movies (id, title, release_year, rating) values (62, 'Безумный Макс: Дорога ярости', 2015, 8.1);
insert into movies (id, title, release_year, rating) values (63, 'Ходячий замок', 2004, 8.2);
insert into movies (id, title, release_year, rating) values (64, 'Таинственная река', 2003, 7.9);
insert into movies (id, title, release_year, rating) values (65, 'Время', 2011, 7.9);
insert into movies (id, title, release_year, rating) values (66, 'Малавита', 2013, 6.3);
insert into movies (id, title, release_year, rating) values (67, 'Люди Икс: Дни минувшего будущего', 2014, 8.0);
insert into movies (id, title, release_year, rating) values (68, 'Амадей', 1984, 8.4);
insert into movies (id, title, release_year, rating) values (69, 'Мстители', 2012, 8.0);
insert into movies (id, title, release_year, rating) values (70, 'Зеленая книга', 2018, 8.2);
insert into movies (id, title, release_year, rating) values (71, 'Прибытие', 2016, 7.9);
insert into movies (id, title, release_year, rating) values (72, 'Джентльмены', 2019, 7.8);
insert into movies (id, title, release_year, rating) values (73, 'Алита: Боевой ангел', 2019, 7.3);

-- 1. DRAMA
-- 2. COMEDY
-- 3. ACTION (Боевик)
-- 4. SCI-FI (Фантастика)
-- 5. HORROR (Ужасы)
-- 6. CRIME
-- 7. ANIMATED
-- 8. THRILLER
-- 9. ADVENTURE
-- 10. FANTASY
-- 11. BIOGRAPHY
-- 12. HISTORY
-- 13. ROMANCE
-- 14. MYSTERY
-- 15. WAR
-- 16. MUSIC

insert into movies_genres (movie_id, genre_id) values (1, 1);
insert into movies_genres (movie_id, genre_id) values (2, 1);
insert into movies_genres (movie_id, genre_id) values (2, 6);
insert into movies_genres (movie_id, genre_id) values (3, 3);
insert into movies_genres (movie_id, genre_id) values (3, 6);
insert into movies_genres (movie_id, genre_id) values (3, 1);
insert into movies_genres (movie_id, genre_id) values (4, 6);
insert into movies_genres (movie_id, genre_id) values (4, 1);
insert into movies_genres (movie_id, genre_id) values (5, 11);
insert into movies_genres (movie_id, genre_id) values (5, 1);
insert into movies_genres (movie_id, genre_id) values (5, 12);
insert into movies_genres (movie_id, genre_id) values (6, 3);
insert into movies_genres (movie_id, genre_id) values (6, 9);
insert into movies_genres (movie_id, genre_id) values (6, 1);
insert into movies_genres (movie_id, genre_id) values (7, 6);
insert into movies_genres (movie_id, genre_id) values (7, 1);
insert into movies_genres (movie_id, genre_id) values (8, 3);
insert into movies_genres (movie_id, genre_id) values (8, 9);
insert into movies_genres (movie_id, genre_id) values (8, 1);
insert into movies_genres (movie_id, genre_id) values (9, 1);
insert into movies_genres (movie_id, genre_id) values (9, 13);
insert into movies_genres (movie_id, genre_id) values (10, 1);
insert into movies_genres (movie_id, genre_id) values (11, 3);
insert into movies_genres (movie_id, genre_id) values (11, 9);
insert into movies_genres (movie_id, genre_id) values (11, 1);
insert into movies_genres (movie_id, genre_id) values (12, 3);
insert into movies_genres (movie_id, genre_id) values (12, 9);
insert into movies_genres (movie_id, genre_id) values (12, 4);
insert into movies_genres (movie_id, genre_id) values (13, 3);
insert into movies_genres (movie_id, genre_id) values (13, 9);
insert into movies_genres (movie_id, genre_id) values (13, 10);
insert into movies_genres (movie_id, genre_id) values (14, 3);
insert into movies_genres (movie_id, genre_id) values (14, 4);
insert into movies_genres (movie_id, genre_id) values (15, 7);
insert into movies_genres (movie_id, genre_id) values (15, 3);
insert into movies_genres (movie_id, genre_id) values (15, 9);
insert into movies_genres (movie_id, genre_id) values (16, 11);
insert into movies_genres (movie_id, genre_id) values (16, 6);
insert into movies_genres (movie_id, genre_id) values (16, 1);
insert into movies_genres (movie_id, genre_id) values (17, 6);
insert into movies_genres (movie_id, genre_id) values (17, 1);
insert into movies_genres (movie_id, genre_id) values (17, 14);
insert into movies_genres (movie_id, genre_id) values (18, 1);
insert into movies_genres (movie_id, genre_id) values (18, 10);
insert into movies_genres (movie_id, genre_id) values (19, 6);
insert into movies_genres (movie_id, genre_id) values (19, 1);
insert into movies_genres (movie_id, genre_id) values (19, 8);
insert into movies_genres (movie_id, genre_id) values (20, 9);
insert into movies_genres (movie_id, genre_id) values (20, 1);
insert into movies_genres (movie_id, genre_id) values (20, 4);
insert into movies_genres (movie_id, genre_id) values (21, 1);
insert into movies_genres (movie_id, genre_id) values (21, 15);
insert into movies_genres (movie_id, genre_id) values (22, 6);
insert into movies_genres (movie_id, genre_id) values (22, 1);
insert into movies_genres (movie_id, genre_id) values (22, 10);
insert into movies_genres (movie_id, genre_id) values (23, 3);
insert into movies_genres (movie_id, genre_id) values (23, 9);
insert into movies_genres (movie_id, genre_id) values (23, 10);
insert into movies_genres (movie_id, genre_id) values (24, 3);
insert into movies_genres (movie_id, genre_id) values (24, 4);
insert into movies_genres (movie_id, genre_id) values (25, 9);
insert into movies_genres (movie_id, genre_id) values (25, 2);
insert into movies_genres (movie_id, genre_id) values (25, 4);
insert into movies_genres (movie_id, genre_id) values (26, 7);
insert into movies_genres (movie_id, genre_id) values (26, 9);
insert into movies_genres (movie_id, genre_id) values (27, 16);
insert into movies_genres (movie_id, genre_id) values (27, 11);
insert into movies_genres (movie_id, genre_id) values (27, 1);
insert into movies_genres (movie_id, genre_id) values (28, 11);
insert into movies_genres (movie_id, genre_id) values (28, 1);
insert into movies_genres (movie_id, genre_id) values (28, 12);
insert into movies_genres (movie_id, genre_id) values (29, 5);
insert into movies_genres (movie_id, genre_id) values (29, 14);
insert into movies_genres (movie_id, genre_id) values (29, 8);
insert into movies_genres (movie_id, genre_id) values (30, 1);
insert into movies_genres (movie_id, genre_id) values (30, 8);
insert into movies_genres (movie_id, genre_id) values (31, 3);
insert into movies_genres (movie_id, genre_id) values (31, 9);
insert into movies_genres (movie_id, genre_id) values (31, 1);
insert into movies_genres (movie_id, genre_id) values (32, 7);
insert into movies_genres (movie_id, genre_id) values (32, 9);
insert into movies_genres (movie_id, genre_id) values (32, 1);
insert into movies_genres (movie_id, genre_id) values (33, 3);
insert into movies_genres (movie_id, genre_id) values (33, 6);
insert into movies_genres (movie_id, genre_id) values (33, 1);
insert into movies_genres (movie_id, genre_id) values (34, 6);
insert into movies_genres (movie_id, genre_id) values (34, 1);
insert into movies_genres (movie_id, genre_id) values (35, 6);
insert into movies_genres (movie_id, genre_id) values (35, 1);
insert into movies_genres (movie_id, genre_id) values (35, 8);
insert into movies_genres (movie_id, genre_id) values (36, 1);
insert into movies_genres (movie_id, genre_id) values (36, 16);
insert into movies_genres (movie_id, genre_id) values (37, 1);
insert into movies_genres (movie_id, genre_id) values (37, 14);
insert into movies_genres (movie_id, genre_id) values (37, 4);
insert into movies_genres (movie_id, genre_id) values (38, 11);
insert into movies_genres (movie_id, genre_id) values (38, 2);
insert into movies_genres (movie_id, genre_id) values (38, 1);
insert into movies_genres (movie_id, genre_id) values (39, 2);
insert into movies_genres (movie_id, genre_id) values (39, 1);
insert into movies_genres (movie_id, genre_id) values (39, 16);
insert into movies_genres (movie_id, genre_id) values (40, 7);
insert into movies_genres (movie_id, genre_id) values (40, 9);
insert into movies_genres (movie_id, genre_id) values (40, 1);
insert into movies_genres (movie_id, genre_id) values (41, 3);
insert into movies_genres (movie_id, genre_id) values (41, 6);
insert into movies_genres (movie_id, genre_id) values (41, 2);
insert into movies_genres (movie_id, genre_id) values (42, 3);
insert into movies_genres (movie_id, genre_id) values (42, 9);
insert into movies_genres (movie_id, genre_id) values (42, 1);
insert into movies_genres (movie_id, genre_id) values (43, 6);
insert into movies_genres (movie_id, genre_id) values (43, 4);
insert into movies_genres (movie_id, genre_id) values (44, 2);
insert into movies_genres (movie_id, genre_id) values (44, 1);
insert into movies_genres (movie_id, genre_id) values (44, 13);
insert into movies_genres (movie_id, genre_id) values (45, 9);
insert into movies_genres (movie_id, genre_id) values (45, 2);
insert into movies_genres (movie_id, genre_id) values (45, 4);
insert into movies_genres (movie_id, genre_id) values (46, 6);
insert into movies_genres (movie_id, genre_id) values (46, 1);
insert into movies_genres (movie_id, genre_id) values (46, 8);
insert into movies_genres (movie_id, genre_id) values (47, 1);
insert into movies_genres (movie_id, genre_id) values (47, 13);
insert into movies_genres (movie_id, genre_id) values (48, 3);
insert into movies_genres (movie_id, genre_id) values (48, 9);
insert into movies_genres (movie_id, genre_id) values (48, 4);
insert into movies_genres (movie_id, genre_id) values (49, 7);
insert into movies_genres (movie_id, genre_id) values (49, 9);
insert into movies_genres (movie_id, genre_id) values (50, 11);
insert into movies_genres (movie_id, genre_id) values (50, 6);
insert into movies_genres (movie_id, genre_id) values (50, 1);
insert into movies_genres (movie_id, genre_id) values (51, 3);
insert into movies_genres (movie_id, genre_id) values (51, 9);
insert into movies_genres (movie_id, genre_id) values (51, 8);
insert into movies_genres (movie_id, genre_id) values (52, 3);
insert into movies_genres (movie_id, genre_id) values (52, 9);
insert into movies_genres (movie_id, genre_id) values (52, 10);
insert into movies_genres (movie_id, genre_id) values (53, 11);
insert into movies_genres (movie_id, genre_id) values (53, 1);
insert into movies_genres (movie_id, genre_id) values (53, 12);
insert into movies_genres (movie_id, genre_id) values (54, 7);
insert into movies_genres (movie_id, genre_id) values (54, 9);
insert into movies_genres (movie_id, genre_id) values (54, 2);
insert into movies_genres (movie_id, genre_id) values (55, 11);
insert into movies_genres (movie_id, genre_id) values (55, 1);
insert into movies_genres (movie_id, genre_id) values (55, 12);
insert into movies_genres (movie_id, genre_id) values (56, 9);
insert into movies_genres (movie_id, genre_id) values (56, 2);
insert into movies_genres (movie_id, genre_id) values (56, 6);
insert into movies_genres (movie_id, genre_id) values (57, 7);
insert into movies_genres (movie_id, genre_id) values (57, 9);
insert into movies_genres (movie_id, genre_id) values (57, 2);
insert into movies_genres (movie_id, genre_id) values (58, 3);
insert into movies_genres (movie_id, genre_id) values (58, 9);
insert into movies_genres (movie_id, genre_id) values (58, 4);
insert into movies_genres (movie_id, genre_id) values (59, 9);
insert into movies_genres (movie_id, genre_id) values (59, 10);
insert into movies_genres (movie_id, genre_id) values (60, 7);
insert into movies_genres (movie_id, genre_id) values (60, 9);
insert into movies_genres (movie_id, genre_id) values (60, 2);
insert into movies_genres (movie_id, genre_id) values (61, 7);
insert into movies_genres (movie_id, genre_id) values (61, 9);
insert into movies_genres (movie_id, genre_id) values (61, 2);
insert into movies_genres (movie_id, genre_id) values (62, 3);
insert into movies_genres (movie_id, genre_id) values (62, 9);
insert into movies_genres (movie_id, genre_id) values (62, 4);
insert into movies_genres (movie_id, genre_id) values (63, 7);
insert into movies_genres (movie_id, genre_id) values (63, 9);
insert into movies_genres (movie_id, genre_id) values (64, 6);
insert into movies_genres (movie_id, genre_id) values (64, 1);
insert into movies_genres (movie_id, genre_id) values (64, 14);
insert into movies_genres (movie_id, genre_id) values (65, 3);
insert into movies_genres (movie_id, genre_id) values (65, 4);
insert into movies_genres (movie_id, genre_id) values (65, 8);
insert into movies_genres (movie_id, genre_id) values (66, 2);
insert into movies_genres (movie_id, genre_id) values (66, 6);
insert into movies_genres (movie_id, genre_id) values (66, 8);
insert into movies_genres (movie_id, genre_id) values (67, 3);
insert into movies_genres (movie_id, genre_id) values (67, 9);
insert into movies_genres (movie_id, genre_id) values (67, 4);
insert into movies_genres (movie_id, genre_id) values (68, 11);
insert into movies_genres (movie_id, genre_id) values (68, 1);
insert into movies_genres (movie_id, genre_id) values (68, 16);
insert into movies_genres (movie_id, genre_id) values (69, 3);
insert into movies_genres (movie_id, genre_id) values (70, 11);
insert into movies_genres (movie_id, genre_id) values (70, 2);
insert into movies_genres (movie_id, genre_id) values (70, 1);
insert into movies_genres (movie_id, genre_id) values (71, 1);
insert into movies_genres (movie_id, genre_id) values (71, 14);
insert into movies_genres (movie_id, genre_id) values (71, 4);
insert into movies_genres (movie_id, genre_id) values (72, 3);
insert into movies_genres (movie_id, genre_id) values (72, 2);
insert into movies_genres (movie_id, genre_id) values (72, 6);
insert into movies_genres (movie_id, genre_id) values (73, 3);
insert into movies_genres (movie_id, genre_id) values (73, 9);
insert into movies_genres (movie_id, genre_id) values (73, 4);