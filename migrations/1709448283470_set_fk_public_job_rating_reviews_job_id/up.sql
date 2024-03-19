alter table "public"."job_rating_reviews" drop constraint "job_rating_reviews_job_id_fkey",
  add constraint "job_rating_reviews_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update set null on delete cascade;
