comment on column "public"."posts"."author_name" is E'post for newsfeed';
alter table "public"."posts" alter column "author_name" drop not null;
alter table "public"."posts" add column "author_name" text;
