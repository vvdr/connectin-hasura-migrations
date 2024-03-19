alter table "public"."User_chat" drop constraint "User_chat_job_id_fkey",
  add constraint "User_chat_job_id_fkey"
  foreign key ("job_id")
  references "public"."job_listing"
  ("id") on update no action on delete no action;
