package unioeste.geral.bo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity(name = "Formulario")
public class Formulario implements Serializable {

	@Id
	@GeneratedValue
	private Long id;

	private int numeroAprovacoes;

	private int numeroReprovacoes;

	private int ano;

	@ManyToOne
	private Disciplina disciplina;

	public Formulario() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNumeroAprovacoes() {
		return numeroAprovacoes;
	}

	public void setNumeroAprovacoes(int numeroAprovacoes) {
		this.numeroAprovacoes = numeroAprovacoes;
	}

	public int getNumeroReprovacoes() {
		return numeroReprovacoes;
	}

	public void setNumeroReprovacoes(int numeroReprovacoes) {
		this.numeroReprovacoes = numeroReprovacoes;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public Disciplina getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}

}
