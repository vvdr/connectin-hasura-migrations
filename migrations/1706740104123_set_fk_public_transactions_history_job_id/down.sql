alter table "public"."transactions_history" drop constraint "transactions_history_job_id_fkey",
  add constraint "transactions_history_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete no action;
