comment on column "public"."posts"."author" is E'post for newsfeed';
alter table "public"."posts" alter column "author" drop not null;
alter table "public"."posts" add column "author" text;
