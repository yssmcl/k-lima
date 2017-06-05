package aluno;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AlunoDAO {
    public void inserirAluno(Aluno aluno) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("Aluno");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            manager.persist(aluno);
            manager.getTransaction().commit();
        } catch (Exception e) {
            if (manager.getTransaction() != null) {
                manager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            manager.close();
            factory.close();
        }
    }

    public Aluno buscarAlunoPorPK(Long id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("Aluno");
        EntityManager manager = factory.createEntityManager();

        manager.getTransaction().begin();
        Aluno aluno = manager.find(Aluno.class, id);
        manager.getTransaction().commit();

        manager.close();
        factory.close();

        return aluno;
    }

    public Aluno atualizarAluno(Aluno aluno) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("Aluno");
        EntityManager manager = factory.createEntityManager();

        Aluno alunoAtualizado = null;
        try {
            manager.getTransaction().begin();
            alunoAtualizado = manager.merge(aluno);
            manager.getTransaction().commit();
        } catch (Exception e) {
            if (manager.getTransaction() != null) {
                manager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            manager.close();
            factory.close();
        }

        return alunoAtualizado;
    }

    public void deletarAluno(Aluno aluno) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("Aluno");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            manager.remove(manager.find(Aluno.class, aluno.getId()));
            manager.getTransaction().commit();
        } catch (Exception e) {
            if (manager.getTransaction() != null) {
                manager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            manager.close();
            factory.close();
        }
    }

}
