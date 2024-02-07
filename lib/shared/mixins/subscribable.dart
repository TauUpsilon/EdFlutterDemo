import 'dart:async';

mixin Subscribable {
  final _subscriptions = <StreamSubscription>[];

  Future<void> unsubscribe() async {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void subscribeBy(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}

extension StreamSubscriptionExt on StreamSubscription {
  void subscribe(Subscribable widget) {
    widget.subscribeBy(this);
  }
}
