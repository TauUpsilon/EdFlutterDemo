import 'dart:convert';
import 'dart:typed_data';

import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000_service.dart';
import 'package:eyr/shared/services/crypto_service.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/utils/string_util.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta_meta.dart';

part 'eyr_spring_boot_enum.dart';
part 'eyr_spring_boot_exc.dart';
part 'eyr_spring_boot_req.dart';
part 'eyr_spring_boot_res.dart';

class EyrSpringBootService {
  static String doCryptoEncryption(String data, String model) {
    if (data.isEmpty) return data;

    if (!GetIt.I<EnvCubit>().state.cryptoEnabled) return data;

    final cryptoService = GetIt.I<CryptoService>();

    final key = cryptoService.aesKeyMap['${model.hashCode}'] ??
        cryptoService.genSecureRandom().nextBytes(32);

    // Using the AES key to encrypt data
    final encryptedData = cryptoService.doAESEncryption(
      utf8.encode(data),
      key: key,
    );

    // Using RSA to encrypt AES key
    final encryptedKey = cryptoService.doRSAEncryption(
      key,
    );

    // Save AES key in order to decrypt data when this request is returned
    // again only sensitive data so there may not need to decrypt data
    // in data response
    cryptoService.aesKeyMap['${model.hashCode}'] = key;

    // Combine AES key and data which will be sent to backend to do the
    // decryption process
    return base64.encode(
      Uint8List.fromList(
        [encryptedKey, encryptedData].expand((x) => x).toList(),
      ),
    );
  }

  static String doCryptoDecryption(String data, String model) {
    if (data.isEmpty) return data;

    if (!GetIt.I<EnvCubit>().state.cryptoEnabled) return data;

    final cryptoService = GetIt.I<CryptoService>();

    final key = cryptoService.aesKeyMap['${model.hashCode}'];

    // If there is no key saved in request step
    // and exception will fire
    if (key == null) {
      throw Exception(
        'Crypto decryption -> cannot found AES key',
      );
    }

    // Using the AES key saved in request to decrypt data from backend
    final decryptedData = cryptoService.doAESDecryption(
      base64.decode(data),
      key: key,
    );

    return utf8.decode(decryptedData);
  }
}

@Target({TargetKind.field, TargetKind.parameter})
class JsonEYRCryptoKey implements JsonConverter<String, String> {
  const JsonEYRCryptoKey();

  @override
  String toJson(String data) => EyrSpringBootService.doCryptoEncryption(
        data,
        runtimeType.hashCode.toString(),
      );

  @override
  String fromJson(String data) => EyrSpringBootService.doCryptoDecryption(
        data,
        runtimeType.hashCode.toString(),
      );
}
