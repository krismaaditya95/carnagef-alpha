

import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';
import 'package:dio/dio.dart';

class DownloadUseCase extends BaseDownloadUseCase{

  final MovieDetailRepository _movieDetailRepository;

  DownloadUseCase({
    required MovieDetailRepository movieDetailRepository,
  }) : _movieDetailRepository = movieDetailRepository;

  @override
  Future download(ProgressCallback progress, dynamic params) async {
    return await _movieDetailRepository.downloadImage(progress: progress, imageUrl: params);
  }

}