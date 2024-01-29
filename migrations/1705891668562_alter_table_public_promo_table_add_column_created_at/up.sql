alter table "public"."promo_table" add column "created_at" timestamptz
 null default now();
