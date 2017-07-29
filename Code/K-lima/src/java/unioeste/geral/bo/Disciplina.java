package unioeste.geral.bo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity(name = "Disciplina")
public class Disciplina {

	@Id
	@GeneratedValue
	private Long id;

	private String nome;

	private int serie;

	// dataInicio == null significa que o curso sempre existiu
	private int anoInicio;

	// dataFim == null significa que o curso ainda existe
	private int anoFim;

	@ManyToOne
	private Curso curso;

	public Disciplina() {
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

	public int getSerie() {
		return serie;
	}

	public void setSerie(int serie) {
		this.serie = serie;
	}

	public int getAnoInicio() {
		return anoInicio;
	}

	public void setAnoInicio(int anoInicio) {
		this.anoInicio = anoInicio;
	}

	public int getAnoFim() {
		return anoFim;
	}

	public void setAnoFim(int anoFim) {
		this.anoFim = anoFim;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}
