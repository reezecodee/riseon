import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../providers/auth_provider.dart';
import '../../providers/investment_provider.dart';
import '../../widgets/investment_card.dart';
import '../../widgets/portfolio_summary.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InvestmentProvider>(context, listen: false).fetchInvestments();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final investmentProvider = Provider.of<InvestmentProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.homeTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => investmentProvider.fetchInvestments(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, ${authProvider.currentUser?.name ?? 'User'}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              PortfolioSummary(),
              SizedBox(height: 30),
              Text(
                'Investasi Anda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              if (investmentProvider.isLoading)
                Center(child: CircularProgressIndicator())
              else if (investmentProvider.errorMessage != null)
                Center(child: Text('Error: ${investmentProvider.errorMessage}'))
              else if (investmentProvider.investments.isEmpty)
                Center(child: Text('Belum ada investasi'))
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: investmentProvider.investments.length,
                  itemBuilder: (context, index) {
                    final investment = investmentProvider.investments[index];
                    return InvestmentCard(investment: investment);
                  },
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-investment');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
