alter table "public"."invoice_table" drop constraint "invoice_table_job_id_fkey",
  add constraint "invoice_table_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update restrict on delete cascade;
