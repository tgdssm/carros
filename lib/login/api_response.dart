class ApiResponse<T> {
  bool ok;
  String mensagem;
  T resultado;

  ApiResponse.ok(this.resultado){
    ok = true;
  }
  ApiResponse.erro(this.mensagem){
    ok = false;
  }

}
