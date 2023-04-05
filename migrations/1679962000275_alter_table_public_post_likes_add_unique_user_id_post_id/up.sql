alter table "public"."post_likes" add constraint "post_likes_user_id_post_id_key" unique ("user_id", "post_id");
