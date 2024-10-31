class TransactionModel {
  String? id;
  String invoiceNo;
  String date;
  String customer;
  List<TransactionProductModel> products;

  TransactionModel({
    this.id,
    required this.invoiceNo,
    required this.date,
    required this.customer,
    required this.products,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'],
    invoiceNo: json['invoiceNo'],
    date: json['date'],
    customer: json['customer'],
    products: (json['products'] as List)
        .map((x) => TransactionProductModel.fromJson(x))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'invoiceNo': invoiceNo,
    'date': date,
    'customer': customer,
    'products': products.map((x) => x.toJson()).toList(),
  };
}

class TransactionProductModel {
  String productId;
  String quantity;
  String price;

  TransactionProductModel({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory TransactionProductModel.fromJson(Map<String, dynamic> json) => 
    TransactionProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
    );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'quantity': quantity,
    'price': price,
  };
}