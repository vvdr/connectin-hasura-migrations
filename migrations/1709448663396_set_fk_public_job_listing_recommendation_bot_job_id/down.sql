alter table "public"."job_listing_recommendation_bot" drop constraint "job_listing_recommendation_bot_job_id_fkey",
  add constraint "job_listing_recommendation_bot_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete no action;
