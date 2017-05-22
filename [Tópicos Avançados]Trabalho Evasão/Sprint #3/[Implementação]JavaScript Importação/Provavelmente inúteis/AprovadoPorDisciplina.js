function AprovadoPorDisciplina(){
  var _periodoRealizado;
  var _centro;
  var _cursoGeral;
  var _idCurso;
  var _nomeCurso;
  var _disciplinas = [[], []];  //disciplinas[ano, Disciplina]

  //Get
  this.getPeriodoRealizado = function(){
    return _periodoRealizado;
  };

  this.getCentro = function(){
    return _centro;
  };

  this.getCursoGeral = function(){
    return _cursoGeral;
  };

  this.getIDCurso = function(){
    return _idCurso;
  };

  this.getNomeCurso = function(){
    return _nomeCurso;
  };

  this.getDisciplinas = function(){
    return _disciplinas;
  };

  this.getDisciplinasAno = function(ano){
    return _disciplinas[ano];
  };

  this.getDisciplinasIJ = function(i, j){
    return _disciplinas[i][j];
  };

  //Set
  this.setPeriodoRealizado = function(periodo){
    _periodoRealizado = periodo;
  };

  this.setCentro = function(centro){
    _centro = centro;
  };

  this.setCursoGeral = function(cursoGeral){
    _cursoGeral = cursoGeral;
  };

  this.setIDCurso = function(id){
    _idCurso = id;
  };

  this.setNomeCurso = function(nomeCurso){
    _nomeCurso = nomeCurso;
  };

  this.setDisciplinas = function(disciplinas){
    _disciplinas = disciplinas
  };

  this.setDisciplinasAno = function(ano, disciplinas){
    _disciplinas[ano] = disciplinas;
  };

  this.setDisciplinasIJ = function(i, j, disciplina){
    _disciplinas[i][j] = disciplina;
  };


  this.criarAprovadoPorDisciplina = function (periodoRealizado, centro, cursoGeral, idCurso, nomeCurso, disciplinas){
    var aprovadoPorDisciplina = new AprovadoPorDisciplina();

    aprovadoPorDisciplina.setPeriodoRealizado(periodoRealizado);
    aprovadoPorDisciplina.setCentro(centro);
    aprovadoPorDisciplina.setCursoGeral(cursoGeral);
    aprovadoPorDisciplina.setIDCurso(idCurso);
    aprovadoPorDisciplina.setNomeCurso(nomeCurso);
    aprovadoPorDisciplina.setDisciplinas(disciplinas);

    return aprovadoPorDisciplina;
  }
}
