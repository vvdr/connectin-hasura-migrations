alter table "public"."job_rating_reviews" add constraint "job_rating_reviews_job_id_buyer_id_seller_id_key" unique ("job_id", "buyer_id", "seller_id");
