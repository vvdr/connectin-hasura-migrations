alter table "public"."posts"
  add constraint "posts_reposted_from_fkey"
  foreign key ("reposted_from")
  references "public"."posts"
  ("id") on update restrict on delete restrict;
