import '../models/investment_model.dart';
import '../services/api_service.dart';

abstract class InvestmentRepositoryInterface {
  Future<List<InvestmentModel>> getInvestments();
  Future<InvestmentModel> getInvestmentById(String id);
}

class InvestmentRepository implements InvestmentRepositoryInterface {
  final ApiService _apiService = ApiService();
  
  @override
  Future<List<InvestmentModel>> getInvestments() async {
    final response = await _apiService.get('investments');
    final List<dynamic> data = response['data'];
    return data.map((json) => InvestmentModel.fromJson(json)).toList();
  }
  
  @override
  Future<InvestmentModel> getInvestmentById(String id) async {
    final response = await _apiService.get('investments/$id');
    return InvestmentModel.fromJson(response['data']);
  }
}