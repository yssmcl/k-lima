package unioeste.geral.bo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name = "Usuario")
public class Usuario implements Serializable {

	@Id
	@GeneratedValue
	private Long id;

//	@Id
	@Column(nullable = false, unique = true)
	private String nomeUsuario;

//	@Id
	@Column(nullable = false)
	private String senha;

	@Column(nullable = false)
	private String salt;

//	@Column(nullable = false)
	private String email;

//	@Column(nullable = false)
//	@Temporal(javax.persistence.TemporalType.DATE)
	private Date dataCriacao;

//	@Column(nullable = false)
	private String primeiroNome;

//	@Column(nullable = false)
	private String segundoNome;

	public Usuario() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public String getPrimeiroNome() {
		return primeiroNome;
	}

	public void setPrimeiroNome(String primeiroNome) {
		this.primeiroNome = primeiroNome;
	}

	public String getSegundoNome() {
		return segundoNome;
	}

	public void setSegundoNome(String segundoNome) {
		this.segundoNome = segundoNome;
	}

}
