part of 'send_money_cubit.dart';

class SendMoneyData extends Equatable {
  final String? errorMessage;
  final DeliveryAddress? deliveryAddress;
  final CardPricing cardPricing;

  SendMoneyData({
    this.errorMessage,
    this.deliveryAddress,
    this.cardPricing,
  });

  SendMoneyData.empty()
      : this(
          errorMessage = null,
          deliveryAddress = [],
          cardPricing = CardPricing.empty(),
        );

  @override
  List<Object?> get props {
    return [
      errorMessage,
      deliveryAddress,
      cardPricing,
    ];
  }

  SendMoneyData copyWith({
    String? errorMessage,
    DeliveryAddress? deliveryAddress,
    CardPricing cardPricing,
  }) {
    return SendMoneyData(
      errorMessage: errorMessage ?? this.errorMessage,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      cardPricing: cardPricing ?? this.cardPricing,
    );
  }
}

class SendMoneyState extends Equatable {
  final SendMoneyData data;
  final SendMoneyStatus sendMoneyStatus;
  const SendMoneyState(this.data, this.sendMoneyStatus);

  SendMoneyState.initial() : this(SendMoneyData.empty(), SendMoneyStatus.idle);

  @override
  List<Object> get props => [data, sendMoneyStatus];

  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendMoneyState state)? initial,
    TResult Function(SendMoneyState state)? error,
    TResult Function(SendMoneyState state)? loading,
    TResult Function(SendMoneyState state)? priceGotten,
    required TResult Function()? orElse,
  }) {
    late MaybeActionMap<SendMoneyState, SendMoneyStatus> _maybeWhenMap;
    _maybeWhenMap = {
      SendMoneyStatus.initial: initial,
      SendMoneyStatus.error: error,
      SendMoneyStatus.loading: loading,
      SendMoneyStatus.priceGotten: priceGotten,
    };
    final maybeAction = _maybeWhenMap[sendMoneyStatus];
    return (maybeAction != null ? maybeAction(this) : orElse!()) as TResult;
  }

  SendMoneyState copyWith({
    SendMoneyData? data,
    SendMoneyStatus? sendMoneyStatus,
  }) {
    return SendMoneyState(
      data ?? this.data,
      sendMoneyStatus ?? this.sendMoneyStatus,
    );
  }
}
