Table consumer {
  id int [pk]
  name string
  address string
}

Table transaction {
  id int [pk]
  consumer_id int [not null]
  grand_total int 
  created_at timestamp
}

Table transaction_items {
  id int [pk]
  transaction_id int [not null]
  product_id int [not null]
  quantity int
  unit_price int 
  total int 
}

Table product {
  id int [pk]
  name string
  price int 
}

Table payment {
  id int [pk] 
  transaction_id int [not null]
  payment_method string
  amount int
  status bool 
}

// Relationships
Ref: "consumer"."id" < "transaction"."consumer_id"
Ref: "transaction"."id" < "transaction_items"."transaction_id"
Ref: "product"."id" < "transaction_items"."product_id"
Ref: "transaction"."id" < "payment"."transaction_id"