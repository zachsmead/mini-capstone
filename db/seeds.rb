CartedProduct.create!([
  {user_id: 1, product_id: 1, status: "purchased", order_id: 31, quantity: 10},
  {user_id: 1, product_id: 9, status: "purchased", order_id: 31, quantity: 99},
  {user_id: 1, product_id: 11, status: "purchased", order_id: 31, quantity: 500},
  {user_id: 1, product_id: 17, status: "purchased", order_id: 31, quantity: 10},
  {user_id: 1, product_id: 17, status: "purchased", order_id: 31, quantity: 10},
  {user_id: 1, product_id: 2, status: "purchased", order_id: 31, quantity: 60},
  {user_id: 1, product_id: 1, status: "deleted", order_id: nil, quantity: 45},
  {user_id: 1, product_id: 1, status: "purchased", order_id: 32, quantity: 40},
  {user_id: 1, product_id: 9, status: "purchased", order_id: 32, quantity: 10},
  {user_id: 1, product_id: 1, status: "purchased", order_id: 33, quantity: 10},
  {user_id: 1, product_id: 9, status: "purchased", order_id: 33, quantity: 9},
  {user_id: 1, product_id: 10, status: "purchased", order_id: 34, quantity: 5},
  {user_id: 1, product_id: 11, status: "purchased", order_id: 35, quantity: 7},
  {user_id: 1, product_id: 2, status: "purchased", order_id: 36, quantity: 5},
  {user_id: 1, product_id: 18, status: "purchased", order_id: 37, quantity: 1},
  {user_id: 1, product_id: 18, status: "deleted", order_id: nil, quantity: 3},
  {user_id: 3, product_id: 17, status: "purchased", order_id: 38, quantity: 1}
])
CategorizedProduct.create!([
  {product_id: 1, category_id: 1},
  {product_id: 9, category_id: 1},
  {product_id: 10, category_id: 2},
  {product_id: 11, category_id: 1},
  {product_id: 2, category_id: 1},
  {product_id: 17, category_id: 3},
  {product_id: 18, category_id: 1},
  {product_id: 18, category_id: 3}
])
Category.create!([
  {name: "Fruit"},
  {name: "Vegetable"},
  {name: "Electronics"}
])
Image.create!([
  {src: "http://i.imgur.com/nr2KV5s.jpg", product_id: 1},
  {src: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1280px-Red_Apple.jpg", product_id: 1},
  {src: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Orange-Whole-%26-Split.jpg", product_id: 2},
  {src: "http://i.imgur.com/kV0iRPv.jpg", product_id: 2},
  {src: "https://upload.wikimedia.org/wikipedia/commons/b/bb/Table_grapes_on_white.jpg", product_id: 9},
  {src: "https://upload.wikimedia.org/wikipedia/commons/b/bb/Table_grapes_on_white.jpg", product_id: 9},
  {src: "https://upload.wikimedia.org/wikipedia/commons/b/bb/Table_grapes_on_white.jpg", product_id: 2},
  {src: "http://i.imgur.com/qWYeGZZ.gif", product_id: 10},
  {src: "http://i.imgur.com/18u7kAC.gif", product_id: 12},
  {src: "http://i.imgur.com/18u7kAC.gif", product_id: 12},
  {src: "test", product_id: 13},
  {src: "test", product_id: 14},
  {src: "test", product_id: 15},
  {src: "test2", product_id: 16},
  {src: "", product_id: 17},
  {src: "", product_id: 18}
])
Order.create!([
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, subtotal: "100100.0", tax: nil, total: "100100.0"},
  {user_id: 1, subtotal: "5050.0", tax: nil, total: "5050.0"},
  {user_id: 1, subtotal: "2020.0", tax: nil, total: "2020.0"},
  {user_id: 1, subtotal: "3030.0", tax: nil, total: "3030.0"},
  {user_id: 1, subtotal: "1010.0", tax: nil, total: "1010.0"},
  {user_id: 1, subtotal: "1515.0", tax: nil, total: "1515.0"},
  {user_id: 1, subtotal: "105105.0", tax: nil, total: "105105.0"},
  {user_id: 1, subtotal: "6060.0", tax: nil, total: "6060.0"},
  {user_id: 1, subtotal: "123.0", tax: "12.3", total: "135.3"},
  {user_id: 1, subtotal: "10.25", tax: "1.025", total: "11.275"},
  {user_id: 1, subtotal: "10.25", tax: "1.025", total: "11.275"},
  {user_id: 1, subtotal: "8.2", tax: "0.82", total: "9.02"},
  {user_id: 1, subtotal: "60.0", tax: "6.0", total: "66.0"},
  {user_id: 1, subtotal: "20497.95", tax: "2049.795", total: "22547.745"},
  {user_id: 1, subtotal: "100.0", tax: "10.0", total: "110.0"},
  {user_id: 1, subtotal: "100.0", tax: "10.0", total: "110.0"},
  {user_id: 1, subtotal: "10.0", tax: "1.0", total: "11.0"},
  {user_id: 1, subtotal: "1.95", tax: "0.195", total: "2.145"},
  {user_id: 1, subtotal: "102.5", tax: "10.25", total: "112.75"},
  {user_id: 1, subtotal: "10618.5", tax: "1061.85", total: "11680.35"},
  {user_id: 1, subtotal: "10618.5", tax: "1061.85", total: "11680.35"},
  {user_id: 1, subtotal: "10618.5", tax: "1061.85", total: "11680.35"},
  {user_id: 1, subtotal: "10741.5", tax: "1074.15", total: "11815.65"},
  {user_id: 1, subtotal: "10741.5", tax: "1074.15", total: "11815.65"},
  {user_id: 1, subtotal: "10741.5", tax: "1074.15", total: "11815.65"},
  {user_id: 1, subtotal: "10741.5", tax: "1074.15", total: "11815.65"},
  {user_id: 1, subtotal: "10741.5", tax: "1074.15", total: "11815.65"},
  {user_id: 1, subtotal: "88.0", tax: "8.8", total: "96.8"},
  {user_id: 1, subtotal: "28.5", tax: "2.85", total: "31.35"},
  {user_id: 1, subtotal: "15.0", tax: "1.5", total: "16.5"},
  {user_id: 1, subtotal: "7.0", tax: "0.7", total: "7.7"},
  {user_id: 1, subtotal: "10.25", tax: "1.025", total: "11.275"},
  {user_id: 1, subtotal: "100000.0", tax: "10000.0", total: "110000.0"},
  {user_id: 3, subtotal: "500.0", tax: "50.0", total: "550.0"}
])
Product.create!([
  {name: "Apple", price: "1.95", description: "A sweet red fruit", supplier_id: 4, stock: 89},
  {name: "Grapes", price: "1.0", description: "A sweet, colorful, bite-sized fruit", supplier_id: 1, stock: 91},
  {name: "Ruby Artichoke", price: "3.0", description: "A strange vegetable that changes shape.", supplier_id: 1, stock: 995},
  {name: "Banana", price: "1.0", description: "A banana.", supplier_id: 3, stock: 993},
  {name: "Oran", price: "2.05", description: "An orange fruit that varies in sourness and sweetness.", supplier_id: 1, stock: 945},
  {name: "Apple Computer", price: "100000.0", description: "Why would you ever buy this", supplier_id: 7, stock: 100},
  {name: "Computer", price: "500.0", description: "A computer.", supplier_id: 7, stock: 99}
])
Supplier.create!([
  {name: "Johnny Appleseed", email: "appleseed.johnny@gmail.com", phone: "555-555-5555", number_of_products: 1},
  {name: "Test Factory", email: "test@erino.com", phone: "555-555-5555", number_of_products: 2},
  {name: "Dole", email: "dole@dole.juice", phone: "555-555-5555", number_of_products: 4},
  {name: "Banana Cartel", email: "info@bananacartel.org", phone: "555-555-5555", number_of_products: 1}
])
User.create!([
  {name: "test", email: "test", password_digest: "$2a$10$tHQIDw15ZUvwNI/2nZni.O.a08psCHpbFkTkvnPOJ1sGWcyxB27v6", admin: nil},
  {name: "test2", email: "test2", password_digest: "$2a$10$WecQEckPT8wgrQNgRjg5I.rbtRIa.natnjMGFe3s3YkKec2xZE6Da", admin: nil},
  {name: "a", email: "a", password_digest: "$2a$10$x2fsHXCk5nGqphOZzmhoRutEBoKpKceUHOPg65AZu663I1zZXWP42", admin: true}
])
