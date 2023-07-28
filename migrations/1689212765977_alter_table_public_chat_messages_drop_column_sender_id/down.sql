comment on column "public"."chat_messages"."sender_id" is E'messages for user chats';
alter table "public"."chat_messages"
  add constraint "chat_messages_sender_id_fkey"
  foreign key (sender_id)
  references "public"."users"
  (user_id) on update no action on delete no action;
alter table "public"."chat_messages" alter column "sender_id" drop not null;
alter table "public"."chat_messages" add column "sender_id" uuid;
