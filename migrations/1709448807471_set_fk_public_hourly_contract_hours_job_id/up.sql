alter table "public"."hourly_contract_hours" drop constraint "hourly_contract_hours_job_id_fkey",
  add constraint "hourly_contract_hours_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update restrict on delete cascade;
