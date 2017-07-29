package unioeste.geral.bo;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity(name = "Formulario")
public class Formulario implements Serializable {

	@EmbeddedId
	private AnoDisciplina anoDisciplina;

	private int numeroAprovacoes;

	private int numeroReprovacoes;

	public Formulario() {
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

	public AnoDisciplina getAnoDisciplina() {
		return anoDisciplina;
	}

	public void setAnoDisciplina(AnoDisciplina anoDisciplina) {
		this.anoDisciplina = anoDisciplina;
	}

}
