class OrderHistoryDetailsResponse {
  bool? success;
  OrderHistoryDetails? result;
  String? message;
  int? code;

  OrderHistoryDetailsResponse(
      {this.success, this.result, this.message, this.code});

  OrderHistoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
    json['result'] != null ? new OrderHistoryDetails.fromJson(json['result']) : null;
    message = json['message'];
    code = json['code'];
  }

  OrderHistoryDetailsResponse.withError(msg){
    success = false;
    message = msg;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class OrderHistoryDetails {
  int? id;
  String? voucherNo;
  String? sellingTotal;
  String? baseTotal;
  String? discount;
  String? total;
  String? taxAmt;
  String? grandTotal;
  int? isPaid;
  int? status;
  TaxData? taxData;
  int? customerId;
  String? orderDate;
  String? customerName;
  int? productId;
  String? productName;
  String? invoiceNo;
  String? invoiceDate;
  String? invoiceAmount;
  String? customerEmail;
  String? customerMobile;

  OrderHistoryDetails(
      {this.id,
        this.voucherNo,
        this.sellingTotal,
        this.baseTotal,
        this.discount,
        this.total,
        this.taxAmt,
        this.grandTotal,
        this.isPaid,
        this.status,
        this.taxData,
        this.customerId,
        this.orderDate,
        this.customerName,
        this.productId,
        this.productName,
        this.invoiceNo,
        this.invoiceDate,
        this.invoiceAmount,
        this.customerEmail,
        this.customerMobile});

  OrderHistoryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherNo = json['voucher_no'];
    sellingTotal = json['selling_total'];
    baseTotal = json['base_total'];
    discount = json['discount'];
    total = json['total'];
    taxAmt = json['tax_amt'];
    grandTotal = json['grand_total'];
    isPaid = json['is_paid'];
    status = json['status'];
    taxData = json['tax_data'] != null
        ? new TaxData.fromJson(json['tax_data'])
        : null;
    customerId = json['customer_id'];
    orderDate = json['order_date'];
    customerName = json['customer_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    invoiceAmount = json['invoice_amount'];
    customerEmail = json['customer_email'];
    customerMobile = json['customer_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voucher_no'] = this.voucherNo;
    data['selling_total'] = this.sellingTotal;
    data['base_total'] = this.baseTotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['tax_amt'] = this.taxAmt;
    data['grand_total'] = this.grandTotal;
    data['is_paid'] = this.isPaid;
    data['status'] = this.status;
    if (this.taxData != null) {
      data['tax_data'] = this.taxData!.toJson();
    }
    data['customer_id'] = this.customerId;
    data['order_date'] = this.orderDate;
    data['customer_name'] = this.customerName;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_date'] = this.invoiceDate;
    data['invoice_amount'] = this.invoiceAmount;
    data['customer_email'] = this.customerEmail;
    data['customer_mobile'] = this.customerMobile;
    return data;
  }
}

class TaxData {
  int? gst;
  int? cgst;
  int? sgst;
  int? igst;
  double? gstAmt;
  double? cgstAmt;
  double? sgstAmt;
  double? igstAmt;

  TaxData(
      {this.gst,
        this.cgst,
        this.sgst,
        this.igst,
        this.gstAmt,
        this.cgstAmt,
        this.sgstAmt,
        this.igstAmt});

  TaxData.fromJson(Map<String, dynamic> json) {
    gst = json['gst'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    igst = json['igst'];
    gstAmt = json['gst_amt'];
    cgstAmt = json['cgst_amt'];
    sgstAmt = json['sgst_amt'];
    igstAmt = json['igst_amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gst'] = this.gst;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['igst'] = this.igst;
    data['gst_amt'] = this.gstAmt;
    data['cgst_amt'] = this.cgstAmt;
    data['sgst_amt'] = this.sgstAmt;
    data['igst_amt'] = this.igstAmt;
    return data;
  }
}
