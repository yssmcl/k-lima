package aluno;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/*
Anotações Hibernate:
https://docs.jboss.org/hibernate/stable/annotations/reference/en/html/
https://docs.jboss.org/hibernate/orm/5.2/javadocs/org/hibernate/annotations/package-summary.html
*/

@Entity
public class Aluno {
    @Id
    @GeneratedValue
    private Long id;

    private String nome;

    // construtor vazio necessário
    public Aluno() {
    }

    public Aluno(String nome) {
        this.nome = nome;
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
