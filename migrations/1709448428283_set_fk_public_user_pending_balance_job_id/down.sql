alter table "public"."user_pending_balance" drop constraint "user_pending_balance_job_id_fkey",
  add constraint "user_pending_balance_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete no action;
