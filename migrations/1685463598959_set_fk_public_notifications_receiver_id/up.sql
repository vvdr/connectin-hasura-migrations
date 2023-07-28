alter table "public"."notifications"
  add constraint "notifications_receiver_id_fkey"
  foreign key ("receiver_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
