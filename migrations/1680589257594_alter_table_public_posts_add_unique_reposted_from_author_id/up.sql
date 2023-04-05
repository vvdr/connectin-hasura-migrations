alter table "public"."posts" add constraint "posts_reposted_from_author_id_key" unique ("reposted_from", "author_id");
