comment on column "public"."posts"."comments" is E'post for newsfeed';
alter table "public"."posts" alter column "comments" drop not null;
alter table "public"."posts" add column "comments" uuid;
