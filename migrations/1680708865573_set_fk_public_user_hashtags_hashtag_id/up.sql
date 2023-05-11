alter table "public"."user_hashtags"
  add constraint "user_hashtags_hashtag_id_fkey"
  foreign key ("hashtag_id")
  references "public"."hashtags"
  ("id") on update cascade on delete cascade;
