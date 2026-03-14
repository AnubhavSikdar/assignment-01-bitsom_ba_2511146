// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    "name": "Macbook Pro",
    "category": "Electronics",
    "price": 285000,
    "specs": { "ram": "16GB", "warranty_years": 2, "voltage": "240V" }
  },
  {
    "name": "Chicken Breast",
    "category": "Groceries",
    "price": 300,
    "expiry_date": ISODate("2026-03-30"),
    "nutrition": ["Protein: 225g", "Calories: 1650kcal"]
  },
  {
    "name": "Leather Jacket",
    "category": "Clothing",
    "price": 8500,
    "size": ["M", "L", "XL"],
    "material": "Leather"
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
  category: "Electronics", 
  price: { $gt: 20000 } 
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ 
  category: "Groceries", 
  expiry_date: { $lt: ISODate("2025-01-01") } 
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { name: "Macbook Pro" }, 
  { $set: { "discount_percent": 25 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });
// This allows MongoDB to find products by category faster without searching through every single document in the database.