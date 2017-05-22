function ListagemAcademicos(){
  var _academicos = [];

  this.getAcademicos = function(){
    return _academicos;
  }

  this.setAcademicos = function(academicos){
    _academicos = academicos;
  }

  this.addAcademico = function(academico){
    _academicos.push(academico);
  }
}
