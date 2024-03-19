alter table "public"."job_listing_tags" drop constraint "job_listing_tags_job_listing_id_fkey",
  add constraint "job_listing_tags_job_listing_id_fkey"
  foreign key ("job_listing_id")
  references "public"."job_listing"
  ("id") on update no action on delete cascade;
