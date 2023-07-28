alter table "public"."notifications"
  add constraint "notifications_reaction_id_fkey"
  foreign key ("reaction_id")
  references "public"."reactions"
  ("id") on update cascade on delete cascade;
