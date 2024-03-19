alter table "public"."chat_messages" drop constraint "chat_messages_offer_id_fkey",
  add constraint "chat_messages_offer_id_fkey"
  foreign key ("offer_id")
  references "public"."order_offers"
  ("id") on update restrict on delete restrict;
