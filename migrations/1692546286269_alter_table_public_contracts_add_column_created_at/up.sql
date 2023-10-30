alter table "public"."contracts" add column "created_at" timestamptz
 null default now();
