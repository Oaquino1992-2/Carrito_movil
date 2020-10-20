import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/model/item_option.dart';
import 'package:flutter_ecommerce/model/item_option_group.dart';
import 'package:flutter_ecommerce/model/review.dart';
import 'package:flutter_ecommerce/model/seller.dart';

class ItemsMock {
  getItems() {
    return <Item>[
      Item(
        id: 1,
        categoryId: 1,
        name: "Xiaomi Mi 4",
        price: 300.0,
        salePrice: 250,
        shipping: 0,
        numOrders: 1102,
        rating: 4.8,
        numWishList: 201,
        onWishList: false,
        thumb: "assets/images/items/item_3.jpg",
        images: [
          "assets/images/items/detail/d_1.jpg",
          "assets/images/items/detail/d_2.jpg",
          "assets/images/items/detail/d_3.jpg",
          "assets/images/items/detail/d_4.jpg",
        ],
        shortDesc:
            "Teléfono Xiaomi Mi4 M4 FDD LTE 4G original Snapdragon 801 Quad Core 5 pulgadas 1080P FHD IPS 13.0MP MIUI 7 Blanco Negro Teléfonos móviles.",
        desc: "",
        optionGroups: <ItemOptionGroup>[
          ItemOptionGroup(
            id: 1,
            name: "Bundle",
            options: <ItemOption>[
              ItemOption(
                  id: 1,
                  name: "Estandar",
                  price: 0
              ),
              ItemOption(
                  id: 2,
                  name: "Agregar funda de silicona",
                  price: 1
              ),
              ItemOption(
                  id: 3,
                  name: "Agregar vidrio templado",
                  price: 1
              ),
            ]
          ),
          ItemOptionGroup(
            id: 2,
            name: "Color",
            options: <ItemOption>[
              ItemOption(
                  id: 4,
                  name: "MI4 CU LTE White",
                  price: 2
              ),
            ]
          ),
        ],
        reviews: <Review>[
          Review(
              avatar: "assets/images/users/max.png",
              name: "Miguel Perez",
              time: "18/10/2020",
              content: "Me gusto porque el envio fue rápido, el producto funciona perfectamente, la forma de adquirir el producto fue facil y muy atractivo.",
              stars: 4
          ),
          Review(
              avatar: "assets/images/users/mike.png",
              name: "Francisco Gárcia",
              time: "18/10/2020",
              content: "La forma de compra me parecio excelente, fue rapida y el producto esta muy bien!!!",
              stars: 5
          ),
        ],
        seller: Seller(
          id: 1,
          name: "Tecnologia",
          numOrders: 11102,
          rating: 4.8,
          numWishList: 2101,
        )
      ),
      //-------------------------------------------------------------------------
      Item(
          id: 2,
          categoryId: 2,
          name: "Herramientas de maquillaje",
          price: 150.0,
          salePrice: 250,
          shipping: 0,
          numOrders: 1101,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          thumb: "assets/images/items/item_4.jpg",
          images: [
            "assets/images/items/detail/m1.jpg",
            "assets/images/items/detail/m2.jpg",
            "assets/images/items/detail/m3.jpg",
            "assets/images/items/detail/m4.jpg",
            "assets/images/items/detail/m5.jpg",
          ],
          shortDesc:
          "Teléfono Xiaomi Mi4 M4 FDD LTE 4G original Snapdragon 801 Quad Core 5 pulgadas 1080P FHD IPS 13.0MP MIUI 7 Blanco Negro Teléfonos móviles.",
          desc: "",
          optionGroups: <ItemOptionGroup>[
            ItemOptionGroup(
                id: 2,
                name: "Agregados",
                options: <ItemOption>[
                  ItemOption(
                      id: 2,
                      name: "Estandar",
                      price: 0
                  ),
                  ItemOption(
                      id: 2,
                      name: "Agregar funda de silicona",
                      price: 1
                  ),
                  ItemOption(
                      id: 3,
                      name: "Agregar vidrio templado",
                      price: 1
                  ),
                ]
            ),
            ItemOptionGroup(
                id: 2,
                name: "Color",
                options: <ItemOption>[
                  ItemOption(
                      id: 4,
                      name: "MI4 CU LTE White",
                      price: 2
                  ),
                ]
            ),
          ],
          reviews: <Review>[
            Review(
                avatar: "assets/images/users/max.png",
                name: "Miguel Perez",
                time: "18/10/2020",
                content: "Me gusto porque el envio fue rápido, el producto funciona perfectamente, la forma de adquirir el producto fue facil y muy atractivo.",
                stars: 4
            ),
            Review(
                avatar: "assets/images/users/mike.png",
                name: "Francisco Gárcia",
                time: "18/10/2020",
                content: "La forma de compra me parecio excelente, fue rapida y el producto esta muy bien!!!",
                stars: 5
            ),
          ],
          seller: Seller(
            id: 2,
            name: "Tecnologia",
            numOrders: 11102,
            rating: 4.8,
            numWishList: 2101,
          )
      ),
      Item(
          id: 2,
          categoryId: 1,
          name: "Herramienta de maquillaje prueba",
          price: 60,
          shipping: 0,
          numOrders: 1102,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          salePrice: null,
          thumb: "assets/images/items/item_4.jpg",
          images: [
            "assets/images/detail/m1.jpg",
            "assets/images/detail/m2.jpg",
            "assets/images/detail/m3.jpg",
            "assets/images/detail/m4.jpg",
            "assets/images/detail/m5.jpg",
          ]),
      Item(
          id: 3,
          categoryId: 1,
          name: "Zara coat",
          price: 30,
          shipping: 0,
          numOrders: 1102,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          salePrice: null,
          thumb: "assets/images/items/item_5.jpg",
          images: [
            "assets/images/detail/d_1.jpg",
            "assets/images/detail/d_2.jpg",
            "assets/images/detail/d_3.jpg"
          ]),
      Item(
          id: 4,
          categoryId: 1,
          name: "Telefono",
          price: 30,
          shipping: 0,
          numOrders: 1102,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          salePrice: 20,
          thumb: "assets/images/items/item_6.jpg",
          images: [
            "assets/images/detail/d_1.jpg",
            "assets/images/detail/d_2.jpg",
            "assets/images/detail/d_3.jpg"
          ]),
      Item(
          id: 5,
          categoryId: 1,
          name: "Funda Iphone 6",
          price: 30,
          shipping: 0,
          numOrders: 1102,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          salePrice: 20,
          thumb: "assets/images/items/item_1.jpg",
          images: [
            "assets/images/detail/d_1.jpg",
            "assets/images/detail/d_2.jpg",
            "assets/images/detail/d_3.jpg"
          ]),
      Item(
          id: 6,
          categoryId: 1,
          name: "Maquillaje",
          price: 30,
          shipping: 0,
          numOrders: 1102,
          rating: 4.8,
          numWishList: 201,
          onWishList: false,
          salePrice: null,
          thumb: "assets/images/items/item_2.jpg",
          images: [
            "assets/images/detail/d_1.jpg",
            "assets/images/detail/d_2.jpg",
            "assets/images/detail/d_3.jpg"
          ]),
    ];
  }
}
