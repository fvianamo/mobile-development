class Contact{

  static final String contactTable = "contactTable";
  static final String idColumn = "idColumn";
  static final String nameColumn = "nameColumn";
  static final String phoneColumn = "phoneColumn";
  static final String emailColumn = "emailColumn";
  static final String imgColumn = "imgColumn";

  int id;
  String name;
  String phone;
  String email;
  String img;

  Contact();

  Contact.fromMap(Map map){
    id = map['idColumn'];
    name = map['nameColumn'];
    phone = map['phoneColumn'];
    email = map['emailColumn'];
    img = map['imgColumn'];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
      emailColumn: email,
      imgColumn: img
    };
    if (id != null) map['idColumn'] = id;

    return map;
  }


  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, img: $img)";
  }
}