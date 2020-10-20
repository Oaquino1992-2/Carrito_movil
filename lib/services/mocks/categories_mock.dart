import "package:flutter_ecommerce/model/category.dart";

class CategoriesMock {
  getCategories() {
    return <Category>[
      Category(
          id: 1,
          name: "Ropa y Accesorio",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 2,
          name: "Electronicos",
          thumb: "assets/images/categories/electronics.png",
          itemCount: 180),
      Category(
          id: 3,
          name: "Joyeria",
          thumb: "assets/images/categories/jewelry.png",
          itemCount: 923),
      Category(
          id: 4,
          name: "Automoviles y motocicletas",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 5,
          name: "Relojes",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 6,
          name: "Zapatos",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 7,
          name: "Equipaje y bolsos",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 8,
          name: "Deportes y mantenimientos",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
      Category(
          id: 9,
          name: "Hogar y Jardón",
          thumb: "assets/images/categories/accessories.png",
          itemCount: 923),
    ];
  }
}
