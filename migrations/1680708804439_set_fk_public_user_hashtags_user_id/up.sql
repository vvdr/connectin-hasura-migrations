alter table "public"."user_hashtags"
  add constraint "user_hashtags_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
