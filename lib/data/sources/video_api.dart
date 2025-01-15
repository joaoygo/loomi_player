import 'package:dio/dio.dart';
import 'package:loomi_player/data/models/api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../models/video_model.dart';

part 'video_api.g.dart';

@RestApi(baseUrl: "https://untold-strapi.api.stage.loomi.com.br/api")
abstract class VideoApi {
  factory VideoApi(Dio dio, {String baseUrl}) = _VideoApi;

  @GET("/videos")
  Future<ApiResponse<List<VideoModel>>> getVideos();

  @POST("/videos/{id}/like")
  Future<void> likeVideo(@Path("id") String id);

  @POST("/videos/{id}/comment")
  Future<void> commentOnVideo(
    @Path("id") String id,
    @Body() Map<String, dynamic> comment,
  );
}
