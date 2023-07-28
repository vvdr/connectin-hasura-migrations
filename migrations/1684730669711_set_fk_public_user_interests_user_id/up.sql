alter table "public"."user_interests"
  add constraint "user_interests_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
