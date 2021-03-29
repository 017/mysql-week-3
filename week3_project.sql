create database if not exists social_app;

use social_app;

drop table if exists post_comments;
drop table if exists posts;
drop table if exists users;

create table users (
    usr_id int(11) not null auto_increment,
    email varchar(30) not null,
    user_name varchar(30) not null,
    password varchar(20) not null,
    created_at datetime,
    edited_at datetime,
    primary key (usr_id)
);
create table posts (
    post_id int(11) not null auto_increment,
    author_id int(11) not null,
    post_title varchar(30) not null,
    post_body varchar(300) not null,
    created_at datetime,
    edited_at datetime,
    primary key (post_id),
    foreign key (author_id) references users(usr_id)
);
create table post_comments (
    comment_id int(11) not null auto_increment,
    post_id int(11) not null,
    author_id int(11) not null,
    comment_title varchar(30) not null,
    comment_body varchar(300) not null,
    created_at datetime,
    edited_at datetime,
    primary key (comment_id),
    foreign key (post_id) references posts(post_id),
    foreign key (author_id) references users(usr_id)
);