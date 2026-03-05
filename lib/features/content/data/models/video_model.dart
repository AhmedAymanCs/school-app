class VideoModel {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> data) {
    return VideoModel(
      id: data['id'] ?? 'Not Found',
      title: data['title'] ?? 'Not Found',
      description: data['description'] ?? 'Not Found',
      videoUrl: data['video_url'] ?? '',
    );
  }
}
