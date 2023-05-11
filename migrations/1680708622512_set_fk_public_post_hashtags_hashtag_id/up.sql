alter table "public"."post_hashtags"
  add constraint "post_hashtags_hashtag_id_fkey"
  foreign key ("hashtag_id")
  references "public"."hashtags"
  ("id") on update cascade on delete cascade;
