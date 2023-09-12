import 'package:roudy_story_box/view/frames/storyconfiguration/model2.dart';

class PopularBooks extends Books {
  PopularBooks({
    required String title,
    required String image,
    required String price,
    required String originalPrice,
  }) : super(
            title: title,
            image: image,
            price: price,
            originalPrice: originalPrice);
}

final List<PopularBooks> popularBooksInfo = [
  PopularBooks(
      title: "The Way of the Nameless",
      image:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/teal-and-orange-fantasy-book-cover-design-template-056106feb952bdfb7bfd16b4f9325c11.jpg",
      price: "\$19.99",
      originalPrice: "\$40.00"),
  PopularBooks(
      title: "The Power of You",
      image:
          "https://i.pinimg.com/originals/97/c4/99/97c499de2581f8cca7f415b4d85870a5.jpg",
      price: "\$9.99",
      originalPrice: "\$23.50"),
  PopularBooks(
      title: "The Glow",
      image:
          "https://i.pinimg.com/736x/4f/59/aa/4f59aaa78f898054f949351515875b3c--book-cover-design-book-design.jpg",
      price: "\$26.50",
      originalPrice: "\$120.50"),
  PopularBooks(
      title: "The Happy Morning",
      image:
          "https://pro2-bar-s3-cdn-cf6.myportfolio.com/4573a45834d27f53b119f41019fcc904/a7c97b6f-b81e-4cc5-a59e-c9bdf1b3c746_rw_1200.jpg",
      price: "\$14.99",
      originalPrice: "\$120.50"),
  PopularBooks(
      title: "The Beauty of Living Twice",
      image:
          "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1607102266-41AyT1XeDaL.jpg",
      price: "\$13.48",
      originalPrice: "\$27.95"),
  PopularBooks(
      title: "Undersea World",
      image:
          "https://www.edrawsoft.com/templates/images/seaworld-children-book-cover.png",
      price: "\$29.99",
      originalPrice: "\$60.50"),
  PopularBooks(
      title: "The Secrets",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwf6U8c_AwOwZvz9CjfMEzikpESGwcNqSuxQ&usqp=CAU",
      price: "\$45.50",
      originalPrice: "\$120.50"),
];
