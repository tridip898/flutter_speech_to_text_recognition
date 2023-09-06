class DataModel {
  final String name;
  final String designation;
  final String salary;

  DataModel({
    required this.name,
    required this.designation,
    required this.salary,
  });
}

List<DataModel> dataModelList=[
  DataModel(name: "Hosenur Rahman", designation: "Sr. Software Enginner", salary: "100000 BDT"),
  DataModel(name: "Fahim Khan", designation: "Software Enginner", salary: "50000 BDT"),
  DataModel(name: "Hasan Mia", designation: "Software Enginner", salary: "40000 BDT"),
];
