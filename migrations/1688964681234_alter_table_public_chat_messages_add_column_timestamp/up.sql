alter table "public"."chat_messages" add column "timestamp" timestamptz
 null default now();
