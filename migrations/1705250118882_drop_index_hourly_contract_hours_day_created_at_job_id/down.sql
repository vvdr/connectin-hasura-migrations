CREATE  INDEX "hourly_contract_hours_day_created_at_job_id" on
  "public"."hourly_contract_hours" using btree ("created_at", "day", "job_id");
