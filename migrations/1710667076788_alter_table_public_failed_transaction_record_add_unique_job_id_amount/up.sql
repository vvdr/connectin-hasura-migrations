alter table "public"."failed_transaction_record" add constraint "failed_transaction_record_job_id_amount_key" unique ("job_id", "amount");
