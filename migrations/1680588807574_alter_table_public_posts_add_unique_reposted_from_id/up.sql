alter table "public"."posts" add constraint "posts_reposted_from_id_key" unique ("reposted_from", "id");
