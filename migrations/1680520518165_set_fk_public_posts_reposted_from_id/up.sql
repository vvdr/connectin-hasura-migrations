alter table "public"."posts"
  add constraint "posts_reposted_from_id_fkey"
  foreign key ("reposted_from_id")
  references "public"."posts"
  ("id") on update restrict on delete restrict;
