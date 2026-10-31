class Loginrequest {
  final String email;
  final String password;

  
  
  Loginrequest({required this.email, required this.password});

  Map<String, String> toJson(){
    return{
      "email":email,
      "password":password
    };
  }
}
