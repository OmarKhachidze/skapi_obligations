sealed class ObligationsEvent {
  const ObligationsEvent();
}

class FetchObligations extends ObligationsEvent {
  const FetchObligations(this.type);
  final ObligationType type;
}

class ClearObligationsError extends ObligationsEvent {
  const ClearObligationsError();
}

enum ObligationType { other, gold, transactions }