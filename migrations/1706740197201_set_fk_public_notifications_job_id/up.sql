alter table "public"."notifications" drop constraint "notifications_job_id_fkey",
  add constraint "notifications_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update cascade on delete cascade;
