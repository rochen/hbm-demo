create table users (
  user_id integer primary key,
  username text UNIQUE,
  password text,
  email text UNIQUE,
  bio text,
  image text
);

create table articles (
  article_id integer primary key,
  user_id integer not null,
  slug text UNIQUE,
  title text,
  description text,
  body text,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  constraint articles_user foreign key (user_id) references users (user_id)
);

create table article_favorites (
  it integer primary key,
  article_id integer not null,
  user_id integer not null,
  constraint article_favorites_article foreign key (article_id) references articles (article_id),
  constraint article_favorites_user foreign key (user_id) references users (user_id)
);

create table user_follows (
  id integer primary key,
  user_id integer not null,
  fan_id integer not null,
  constraint user_follows_user foreign key (user_id) references users (user_id),
  constraint user_follows_fan foreign key (fan_id) references users (user_id)
);

create table tags (
  tag_id integer primary key,
  name text
);

create table article_tags (
  id integer primary key,
  article_id integer not null,
  tag_id integer not null,
  constraint article_tags_article foreign key (article_id) references articles (article_id),
  constraint article_tags_tag foreign key (tag_id) references tags (tag_id)
);

create table comments (
  comment_id integer primary key,
  body text,
  article_id integer not null,
  user_id integer not null,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  constraint comment_article foreign key (article_id) references articles (article_id),
  constraint comment_user foreign key (user_id) references users (user_id)
);