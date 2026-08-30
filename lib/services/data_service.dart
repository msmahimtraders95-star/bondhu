class DataService {
  Future<void> createPost({
    required String text,
  }) async {
    // Firestore যুক্ত করার পর এখানে পোস্ট সংরক্ষণ করা হবে।
  }

  Future<List<Map<String, dynamic>>> getPosts() async {
    // Firestore যুক্ত করার পর এখানে পোস্ট আনা হবে।
    return [];
  }
}
