alter table "public"."hourly_contract_hours" add constraint "hourly_contract_hours_created_at_day_key" unique ("created_at", "day");
