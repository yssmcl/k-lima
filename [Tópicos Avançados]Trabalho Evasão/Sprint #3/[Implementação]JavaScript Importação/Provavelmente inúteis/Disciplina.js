function Disciplina(){
  var _id;
  var _nome;
  var _numAprovados;
  var _porcentoAprovados;
  var _numReprovados;
  var _porcentoReprovados;

  //Get
  this.getID = function(){
    return _id;
  };

  this.getNome = function(){
    return _nome;
  };

  this.getNumAprovados = function(){
    return _numAprovados;
  };

  this.getPorcentoAprovados = function(){
    return _porcentoAprovados;
  };

  this.getNumReprovados = function(){
    return _numReprovados;
  };

  this.getPorcentoReprovados = function(){
    return _porcentoReprovados;
  };

  //Set
  this.setID = function(id){
    _id = id;
  };

  this.setNome = function(nome){
    _nome = nome;
  };

  this.setNumAprovados = function(numAprovados){
    _numAprovados = numAprovados;
  };

  this.setPorcentoAprovados = function(porcentoAprovados){
    _porcentoAprovados = porcentoAprovados;
  };

  this.setNumReprovados = function(numReprovados){
    _numReprovados = numReprovados;
  };

  this.setPorcentoReprovados = function(porcentoReprovados){
    _porcentoReprovados = porcentoReprovados;
  };


  this.criarDisciplina = function(id, nome, numAprovados, porcentoAprovados, numReprovados, porcentoReprovados){
    var disciplina = new Disciplina();

    disciplina.setID(id);
    disciplina.setNome(nome);
    disciplina.setNumAprovados(numAprovados);
    disciplina.setNumReprovados(numReprovados);
    disciplina.setPorcentoAprovados(porcentoAprovados);
    disciplina.setPorcentoReprovados(porcentoReprovados);
  }
}
