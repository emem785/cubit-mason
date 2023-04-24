part 'send_money_state.dart';

@injectable
class SendMoneyCubit extends Cubit<SendMoneyState> {
  final SendMoneyRepository sendMoneyRepository;
  SendMoneyCubit(this.sendMoneyRepository)
      : super(SendMoneyState.initial());

}
