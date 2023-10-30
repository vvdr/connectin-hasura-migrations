alter table "public"."chat_messages" add column "is_read" boolean
 not null default 'false';
