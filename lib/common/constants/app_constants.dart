import 'package:flutter/cupertino.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

// Navigation Bar
const navigationBarHeight = 60.0;
const navigationBarItemHeight = 44.0;

BoxShadow getNavigationBarBoxShadow(BuildContext context, Offset offset) {
  return BoxShadow(
    color: context.skapiColors.black.withValues(alpha: 0.25),
    offset: offset,
    blurRadius: 4,
    spreadRadius: 0,
  );
}

// Network
const baseUrl = 'https://f1-mock.omedialab.com/api';
const otherObligationsEndpoint = '/obligations/other';
const goldObligationsEndpoint = '/obligations/gold';
const obligationsTransactionsEndpoint = '/obligations/transactions';
const connectTimeout = Duration(seconds: 20);
const receiveTimeout = Duration(seconds: 15);

// Fonts
const helvetica = 'HelveticaNeue';
const bpgGel = 'BpgGel';
const notoSans = 'notoSansGeorgian';
