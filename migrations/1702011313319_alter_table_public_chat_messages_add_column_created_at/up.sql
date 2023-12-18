alter table "public"."chat_messages" add column "created_at" timestamptz
 null default now();
