alter table "public"."notifications"
  add constraint "notifications_sender_id_fkey"
  foreign key ("sender_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
