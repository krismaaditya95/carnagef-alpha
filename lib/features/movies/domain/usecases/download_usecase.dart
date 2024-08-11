import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';
import 'package:dio/dio.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [DownloadUseCase] interact and coordinate with [MovieDetailRepository],
/// access its function [downloadImage] and perform a download task in the background
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
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