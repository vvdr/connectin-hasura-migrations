alter table "public"."job_cancel_request" drop constraint "job_cancel_request_job_id_fkey",
  add constraint "job_cancel_request_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete no action;
