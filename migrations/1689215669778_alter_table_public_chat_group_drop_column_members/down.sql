alter table "public"."chat_group" alter column "members" drop not null;
alter table "public"."chat_group" add column "members" uuid;
