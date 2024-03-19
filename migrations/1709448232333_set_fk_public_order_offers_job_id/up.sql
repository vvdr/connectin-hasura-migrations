alter table "public"."order_offers" drop constraint "order_offers_job_id_fkey",
  add constraint "order_offers_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update restrict on delete cascade;
