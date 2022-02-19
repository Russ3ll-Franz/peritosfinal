class MyListGrid {
  final String title, image;
  final String id;

  MyListGrid({required this.id, required this.title, required this.image});
}

final List grids = [
  MyListGrid(
      id: "1", title: "Interior", image: "assets/images/menu/interior.png"),
  MyListGrid(
      id: "2", title: "Exterior", image: "assets/images/menu/casita.png"),
  MyListGrid(
      id: "3", title: "Vehiculos", image: "assets/images/menu/vehiculo.png"),
  MyListGrid(
      id: "4", title: "Maquinarias", image: "assets/images/menu/machine.png"),
];
