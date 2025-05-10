drop database if exists ffs;
create database if not exists ffs;
use ffs;
drop table if exists users;
drop table if exists categories;
drop table if exists topics;
drop table if exists posts;
create table users(
    user_id int(8) not null auto_increment,
    user_name varchar(30) not null,
    user_pass varchar(255) not null,
    user_email varchar(255) not null,
    user_date datetime not null,
    unique index uer_name_unique(user_name),
    primary key(user_id)
);
create table categories(
    cat_id int(8) not null auto_increment,
    cat_name varchar(255) not null,
    cat_description varchar(255) not null,
    unique index cat_name_unique(cat_name),
    primary key(cat_id)
);
create table topics(
    topic_id int(8) not null auto_increment,
    topic_subject varchar(255) not null,
    topic_date datetime not null,
    topic_cat int(8) not null,
    topic_by int(8) not null,
    primary key(topic_id)
);
create table posts(
    post_id int(8) not null auto_increment,
    post_content text not null,
    post_date datetime not null,
    post_topic int(8) not null,
    post_by int(8) not null,
    primary key(post_id)
);
alter table topics add foreign key(topic_cat) references categories(cat_id) on delete cascade on update cascade;
alter table topics add foreign key(topic_by) references users(user_id) on delete restrict on update cascade;
alter table posts add foreign key(post_topic) references topics(topic_id) on delete cascade on update cascade;
alter table posts add foreign key(post_by) references users(user_id) on delete restrict on update cascade;
