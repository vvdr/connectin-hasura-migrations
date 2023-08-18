alter table "public"."gig_review"
  add constraint "gig_review_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."users"
  ("user_id") on update restrict on delete restrict;
