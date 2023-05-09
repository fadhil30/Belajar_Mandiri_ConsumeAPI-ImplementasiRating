// ignore_for_file: public_member_api_docs, sort_constructors_first
class City {
  int id;
  String name;
  String imageURL;
  bool isPopular;

  City(
      {this.id,
      this.name,
      this.imageURL,
      this.isPopular = false});
}
