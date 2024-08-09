import 'dart:async';

mixin Subscribable {
  final _subscriptions = <StreamSubscription>[];

  void cancelSubscriptions() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}
