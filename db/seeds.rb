Image.create!([
  {src: "http://i.imgur.com/nr2KV5s.jpg", product_id: 1},
  {src: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1280px-Red_Apple.jpg", product_id: 1},
  {src: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Orange-Whole-%26-Split.jpg", product_id: 2}
])
Product.create!([
  {name: "Orange", price: "2.05", description: "An orange fruit that varies in sourness and sweetness.", in_stock: true, supplier_id: 1},
  {name: "Apple", price: "1.95", description: "A sweet red fruit", in_stock: true, supplier_id: 3}
])
Supplier.create!([
  {name: "Dole", email: "dole@dole.juice", phone: "555-555-5555"},
  {name: "Banana Cartel", email: "info@bananacartel.org", phone: "555-555-5555"},
  {name: "Johnny Appleseed", email: "appleseed.johnny@gmail.com", phone: "555-555-5555"}
])
