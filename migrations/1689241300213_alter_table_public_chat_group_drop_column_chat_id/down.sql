alter table "public"."chat_group" alter column "chat_id" drop not null;
alter table "public"."chat_group" add column "chat_id" uuid;
