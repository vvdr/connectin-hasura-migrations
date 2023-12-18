alter table "public"."job_listing" alter column "updated_at" set default now();
alter table "public"."job_listing" alter column "updated_at" drop not null;
alter table "public"."job_listing" add column "updated_at" timestamptz;
