class CourseModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String? category;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.category,
  });

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    return CourseModel(
      id: data['id'] ?? 'Not Found',
      title: data['title'] ?? 'Not Found',
      description: data['description'] ?? 'Not Found',
      image:
          data['image'] ??
          'https://www.svgrepo.com/show/508699/landscape-placeholder.svg',
      price: data['price'] == null ? 0 : (data['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }
}
