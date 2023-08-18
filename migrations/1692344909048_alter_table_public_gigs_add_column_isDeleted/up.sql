alter table "public"."gigs" add column "isDeleted" boolean
 not null default 'false';
