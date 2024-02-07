// import 'dart:convert';

// import 'package:encrypt/encrypt.dart';
// import 'package:get_it/get_it.dart';
// import 'package:hsbc_mobile_frontend/model/crypto_data.dart';
// import 'package:hsbc_mobile_frontend/states/cubit/env/env_cubit.dart';

// class CryptoService {
//   static EnvCubit get envCubit => GetIt.I<EnvCubit>();

//   static String encrypt(String text) {
//     final key = Key.fromBase64(envCubit.state.hsbcApiKY);
//     final iv = IV.fromBase64(envCubit.state.hsbcApiIV);
//     final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//     return encrypter.encrypt(text, iv: iv).base64;
//   }

//   static String encryptAsReq(String text) {
//     if (!envCubit.state.cryptoEnabled) return text;
//     final req = CryptoData(payload: encrypt(text));
//     return jsonEncode(req.toJson());
//   }

//   static String decrypt(String encryptedText) {
//     final key = Key.fromBase64(envCubit.state.hsbcApiKY);
//     final iv = IV.fromBase64(envCubit.state.hsbcApiIV);
//     final decrypt = Encrypter(AES(key, mode: AESMode.cbc));
//     return decrypt.decrypt64(encryptedText, iv: iv);
//   }

//   static String decryptAsRes(String encryptedRes) {
//     if (!envCubit.state.cryptoEnabled) return encryptedRes;
//     final res = CryptoData.fromJson(jsonDecode(encryptedRes));
//     return decrypt(res.payload);
//   }
// }
