import 'package:flutter/material.dart';
import '../../data/models/investment_model.dart';
import '../../data/repositories/investment_repository.dart';

class InvestmentProvider extends ChangeNotifier {
  final InvestmentRepository _investmentRepository = InvestmentRepository();
  
  List<InvestmentModel> _investments = [];
  bool _isLoading = false;
  String? _errorMessage;
  
  List<InvestmentModel> get investments => _investments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  
  double get totalInvestment {
    return _investments.fold(0.0, (sum, investment) => sum + investment.amount);
  }
  
  double get totalCurrentValue {
    return _investments.fold(0.0, (sum, investment) => sum + investment.currentValue);
  }
  
  double get totalReturn {
    return totalCurrentValue - totalInvestment;
  }
  
  Future<void> fetchInvestments() async {
    _setLoading(true);
    _errorMessage = null;
    
    try {
      _investments = await _investmentRepository.getInvestments();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
