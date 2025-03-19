import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_engineer/data/models/get_engineer_profile_response.dart';

part 'engineer_profile_state.freezed.dart';

@freezed
class EngineerProfileState with _$EngineerProfileState {
  const factory EngineerProfileState.initial() = _Initial;
  const factory EngineerProfileState.loading() = _Loading;
  const factory EngineerProfileState.success(
      String engineerId,
      GetEngineerProfileResponse profile,
      ) = _Success;
  const factory EngineerProfileState.failure(ApiErrorModel error) = Failure;
}