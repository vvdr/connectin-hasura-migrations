alter table "public"."notifications"
  add constraint "notifications_friend_request_fkey"
  foreign key ("friend_request")
  references "public"."friendlist"
  ("id") on update cascade on delete cascade;
