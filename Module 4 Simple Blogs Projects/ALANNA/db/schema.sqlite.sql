-- This file is autogenerated by the Rail schema generator, using
-- the schema defined in db/migration/*.rb
--
-- Do not edit this file.  Instead, add a new migration using
-- ./script/generate migration <name>, and then run
-- ./script/generate schema

-- tables 

CREATE TABLE articles_categories (
  "article_id" integer,
  "category_id" integer,
  "is_primary" integer
);

CREATE TABLE articles_tags (
  "article_id" integer,
  "tag_id" integer
);

CREATE TABLE blacklist_patterns (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" varchar(255),
  "pattern" varchar(255)
);

CREATE TABLE blogs (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "settings" text
);

CREATE TABLE categories (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "position" integer,
  "permalink" varchar(255)
);

CREATE TABLE contents (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" varchar(255),
  "title" varchar(255),
  "author" varchar(255),
  "body" text,
  "body_html" text,
  "extended" text,
  "excerpt" text,
  "keywords" varchar(255),
  "created_at" datetime,
  "updated_at" datetime,
  "extended_html" text,
  "user_id" integer,
  "permalink" varchar(255),
  "guid" varchar(255),
  "text_filter_id" integer,
  "whiteboard" text,
  "article_id" integer,
  "email" varchar(255),
  "url" varchar(255),
  "ip" varchar(40),
  "blog_name" varchar(255),
  "name" varchar(255),
  "published" boolean DEFAULT 'f',
  "allow_pings" boolean,
  "allow_comments" boolean,
  "blog_id" integer NOT NULL,
  "published_at" datetime,
  "state" text,
  "status_confirmed" boolean
);

CREATE TABLE notifications (
  "notify_user_id" integer,
  "notify_content_id" integer,
  "created_at" datetime,
  "updated_at" datetime
);

CREATE TABLE page_caches (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255)
);

CREATE TABLE pings (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "article_id" integer,
  "url" varchar(255),
  "created_at" datetime
);

CREATE TABLE redirects (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "from_path" varchar(255),
  "to_path" varchar(255)
);

CREATE TABLE resources (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "size" integer,
  "filename" varchar(255),
  "mime" varchar(255),
  "created_at" datetime,
  "updated_at" datetime,
  "article_id" integer,
  "itunes_metadata" boolean,
  "itunes_author" varchar(255),
  "itunes_subtitle" varchar(255),
  "itunes_duration" integer,
  "itunes_summary" text,
  "itunes_keywords" varchar(255),
  "itunes_category" varchar(255),
  "itunes_explicit" boolean
);

CREATE TABLE sessions (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "sessid" varchar(255),
  "data" text,
  "created_at" datetime,
  "updated_at" datetime
);

CREATE TABLE sidebars (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "controller" varchar(255),
  "active_position" integer,
  "config" text,
  "staged_position" integer
);

CREATE TABLE tags (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "created_at" datetime,
  "updated_at" datetime,
  "display_name" varchar(255)
);

CREATE TABLE text_filters (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "description" varchar(255),
  "markup" varchar(255),
  "filters" text,
  "params" text
);

CREATE TABLE triggers (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "pending_item_id" integer,
  "pending_item_type" varchar(255),
  "due_at" datetime,
  "trigger_method" varchar(255)
);

CREATE TABLE users (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "login" varchar(255),
  "password" varchar(255),
  "email" text,
  "name" text,
  "notify_via_email" boolean,
  "notify_on_new_articles" boolean,
  "notify_on_comments" boolean,
  "notify_watch_my_articles" boolean,
  "notify_via_jabber" boolean,
  "jabber" varchar(255)
);


-- indexes 

CREATE  INDEX "blacklist_patterns_pattern_index" ON blacklist_patterns ("pattern");
CREATE  INDEX "categories_permalink_index" ON categories ("permalink");
CREATE  INDEX "contents_blog_id_index" ON contents ("blog_id");
CREATE  INDEX "contents_article_id_index" ON contents ("article_id");
CREATE  INDEX "page_caches_name_index" ON page_caches ("name");
CREATE  INDEX "pings_article_id_index" ON pings ("article_id");
CREATE  INDEX "sessions_sessid_index" ON sessions ("sessid");

-- data 

INSERT INTO sidebars ("config", "staged_position", "active_position", "controller") VALUES(NULL, NULL, 0, 'category');
INSERT INTO sidebars ("config", "staged_position", "active_position", "controller") VALUES(NULL, NULL, 1, 'static');
INSERT INTO sidebars ("config", "staged_position", "active_position", "controller") VALUES(NULL, NULL, 2, 'xml');
INSERT INTO text_filters ("name", "filters", "description", "params", "markup") VALUES('none', '--- []

', 'None', '--- {}

', 'none');
INSERT INTO text_filters ("name", "filters", "description", "params", "markup") VALUES('markdown', '--- []

', 'Markdown', '--- {}

', 'markdown');
INSERT INTO text_filters ("name", "filters", "description", "params", "markup") VALUES('smartypants', '--- 
- :smartypants
', 'SmartyPants', '--- {}

', 'none');
INSERT INTO text_filters ("name", "filters", "description", "params", "markup") VALUES('markdown smartypants', '--- 
- :smartypants
', 'Markdown with SmartyPants', '--- {}

', 'markdown');
INSERT INTO text_filters ("name", "filters", "description", "params", "markup") VALUES('textile', '--- []

', 'Textile', '--- {}

', 'textile');

-- schema version meta-info 

CREATE TABLE schema_info (
  "version" integer
);

insert into schema_info (version) values (50);
