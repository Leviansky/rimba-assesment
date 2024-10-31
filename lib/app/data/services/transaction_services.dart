import 'package:get/get.dart';
import '../providers/api_provider.dart';
import '../models/transaction_model.dart';
import '../../../core/utils/api_constants.dart';

class TransactionService extends GetxService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  // Future<List<TransactionModel>> getTransactions(String token) async {
  //   final response = await _apiProvider.get(
  //     ApiConstants.transactions,
  //     token: token,
  //   );
  //   return (response.data as List)
  //       .map((json) => TransactionModel.fromJson(json))
  //       .toList();
  // }

  // Future<TransactionModel> createTransaction(
  //   TransactionModel transaction,
  //   String token,
  // ) async {
  //   final response = await _apiProvider.post(
  //     ApiConstants.transactions,
  //     transaction.toJson(),
  //     token: token,
  //   );
  //   return TransactionModel.fromJson(response.data);
  // }

  // Implementasi method lainnya untuk update dan delete
}