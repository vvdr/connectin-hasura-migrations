alter table "public"."User_chat" add column "created_at" timestamptz
 null default now();
