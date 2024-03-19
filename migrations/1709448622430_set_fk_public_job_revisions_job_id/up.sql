alter table "public"."job_revisions" drop constraint "job_revisions_job_id_fkey",
  add constraint "job_revisions_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete cascade;
