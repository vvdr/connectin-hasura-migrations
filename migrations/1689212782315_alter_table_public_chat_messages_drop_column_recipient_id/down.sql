comment on column "public"."chat_messages"."recipient_id" is E'messages for user chats';
alter table "public"."chat_messages"
  add constraint "chat_messages_recipient_id_fkey"
  foreign key (recipient_id)
  references "public"."users"
  (user_id) on update no action on delete no action;
alter table "public"."chat_messages" alter column "recipient_id" drop not null;
alter table "public"."chat_messages" add column "recipient_id" uuid;
