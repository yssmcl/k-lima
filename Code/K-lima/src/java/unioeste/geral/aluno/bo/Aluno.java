package unioeste.geral.aluno.bo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.hibernate.annotations.GenericGenerator;

@Entity
public class Aluno {
	// @GenericGenerator(name="generator", strategy="increment")
    // @GeneratedValue(generator="generator")
	@Id
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	@GeneratedValue
    private Long id;

    private String nome;
    
    private String curso;
    
    private String centro;
    
    private String modalidade;
    
    private String turno;
    
    private int ano_atual;
    
    private String unidade_federativa;
    
    private String situacao_atual;
    
    private String cep;
    
    private String rua;
    
    private int numero;
    
    private String bairro;
    
    private String cidade;
    
    private int ano_letivo;
	
	private String endereco_completo;
    
    private String latitude;
    
    private String longitude;
		
    public Aluno() {
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getCentro() {
        return centro;
    }

    public void setCentro(String centro) {
        this.centro = centro;
    }

    public String getModalidade() {
        return modalidade;
    }

    public void setModalidade(String modalidade) {
        this.modalidade = modalidade;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public int getAno_atual() {
        return ano_atual;
    }

    public void setAno_atual(int ano_atual) {
        this.ano_atual = ano_atual;
    }

    public String getUnidade_federativa() {
        return unidade_federativa;
    }

    public void setUnidade_federativa(String unidade_federativa) {
        this.unidade_federativa = unidade_federativa;
    }

    public String getSituacao_atual() {
        return situacao_atual;
    }

    public void setSituacao_atual(String situacao_atual) {
        this.situacao_atual = situacao_atual;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getAno_letivo() {
        return ano_letivo;
    }

    public void setAno_letivo(int ano_letivo) {
        this.ano_letivo = ano_letivo;
    }

    public String getEndereco_completo() {
        return endereco_completo;
    }

    public void setEndereco_completo(String endereco_completo) {
        this.endereco_completo = endereco_completo;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
