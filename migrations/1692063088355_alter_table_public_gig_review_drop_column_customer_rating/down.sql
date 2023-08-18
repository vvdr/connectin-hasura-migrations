comment on column "public"."gig_review"."customer_rating" is E'table for storing reviews related to gig';
alter table "public"."gig_review" alter column "customer_rating" drop not null;
alter table "public"."gig_review" add column "customer_rating" text;
