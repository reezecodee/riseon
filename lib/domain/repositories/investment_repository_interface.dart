import '../entities/investment_entity.dart';

abstract class InvestmentRepositoryInterface {
  Future<List<InvestmentEntity>> getInvestments();
  Future<InvestmentEntity> getInvestmentById(String id);
  Future<InvestmentEntity> createInvestment(InvestmentEntity investment);
  Future<InvestmentEntity> updateInvestment(InvestmentEntity investment);
  Future<void> deleteInvestment(String id);
}
