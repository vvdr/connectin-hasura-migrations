alter table "public"."contact_queries" add column "created_at" timestamptz
 null default now();
