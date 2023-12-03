alter table "public"."job_listing"
  add constraint "job_listing_gig_id_fkey"
  foreign key ("gig_id")
  references "public"."gigs"
  ("id") on update no action on delete no action;
