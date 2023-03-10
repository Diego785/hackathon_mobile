import 'package:alerta_temprana_scz/models/Evento.dart';
import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/contact_list_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // List<Event> eventosCategories = [];
  @override
  void initState() {
    super.initState();
  }

  List<double> distances = [5.5, 6, 9.2, 3, 5.1];

  @override
  Widget build(BuildContext context) {
    // Future<Producto> selectedCategoryAndProduct(int index, int index2) async {
    //   final services = ProductsService();
    //   productsByCategory = [];
    //   products = [];
    //   final Category categorySelected = categoriesProducts[index];
    //   print(categorySelected.name);

    //   final category = Provider.of<InventoryService>(context, listen: false);

    //   if (category.selectedCategory == 'Todos') {
    //     products = await services.getProducts();
    //   } else if (category.selectedCategory == 'Disponibles') {
    //     products = await services.getAvailableProducts();
    //   } else {
    //     products = await services.getExpiratedProducts();
    //   }

    //   for (int i = 0; i < products.length; i++) {
    //     if (products[i].categoria.nombre == categorySelected.name) {
    //       productsByCategory.add(products[i]);
    //     }
    //   }
    //   print(productsByCategory[index2].descripcion);
    //   return productsByCategory[index2];
    // }

    // final categories = Provider.of<InventoryService>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 5,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: (MediaQuery.of(context).size.width / 2) - 100,
                      top: 900,
                      child: Image.asset(
                        'imgs/escudo_scz2.png',
                        scale: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      // (products.length % 3) != 0
                      //     ? 200 * ((products.length / 3).truncate() + 1)
                      //     : 200 * (products.length / 3),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 170,
                        ),
                        itemCount: eventos.length,
                        itemBuilder: (context, index2) {
                          return Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  // final Product product = selectedCategoryAndProduct();
                                  // final Producto product =
                                  //     await selectedCategoryAndProduct(
                                  //         index, index2);
                                  // print(index);
                                  // print(index2);
                                  print("holaaaaa");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MicrosListPage(
                                              nombreEvento:
                                                  eventos[index2].nombre)));
                                },
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  // height: MediaQuery.of(context).size.height,
                                  // width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(eventos[index2].foto.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                eventos[index2].nombre,
                                softWrap: true,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "MainButton",
        backgroundColor: Colors.green.shade900,
        child: Icon(Icons.call),
        onPressed: () {
          // socketService.emit('emitir-mensaje',
          //     {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
          // Navigator.pushNamed(context, 'usuarios');
        },
      ),
    );
  }
}

// double heightForGalleryProducts(int index) {
//   double result = 0;
//   productsByCategory = [];

//   for (var i = 0; i < products.length; i++) {
//     if (products[i].categoria.nombre == categoriesProducts[index].name) {
//       result = result + 1;
//       productsByCategory.add(products[i]);
//     }
//   }
//   if (result % 3 != 0) {
//     result = ((result / 3).truncate() + 1) * 175;
//   } else {
//     result = (result / 3) * 175;
//   }

//   return result;
// }