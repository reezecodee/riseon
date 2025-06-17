import '../entities/investment_entity.dart';
import '../repositories/investment_repository_interface.dart';

class GetInvestmentsUseCase {
  final InvestmentRepositoryInterface investmentRepository;
  
  GetInvestmentsUseCase(this.investmentRepository);
  
  Future<List<InvestmentEntity>> execute() async {
    final investments = await investmentRepository.getInvestments();
    
    // Sort by date invested (newest first)
    investments.sort((a, b) => b.dateInvested.compareTo(a.dateInvested));
    
    return investments;
  }
}