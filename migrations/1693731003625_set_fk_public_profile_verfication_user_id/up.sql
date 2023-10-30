alter table "public"."profile_verfication" drop constraint "profile_verfication_user_id_fkey",
  add constraint "profile_verfication_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
