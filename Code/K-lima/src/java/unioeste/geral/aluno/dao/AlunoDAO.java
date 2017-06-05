package unioeste.geral.aluno.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.aluno.bo.Aluno;

public class AlunoDAO {
	public void inserirAluno(Aluno aluno) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			session.save(aluno);
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<Aluno> buscarAlunoPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Aluno> alunos = null;

		try {
			transaction = session.beginTransaction();
			Criteria criteria = session.createCriteria(Aluno.class);
			criteria.add(Restrictions.eq(atributo, valor));
			alunos = (List<Aluno>) criteria.list();
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return alunos;
	}

	public List<Aluno> buscarTodosAlunos() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Aluno> alunos = null;

		try {
			transaction = session.beginTransaction();
			alunos = session.createCriteria(Aluno.class).list();
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace(); 
		} finally {
			session.close(); 
		}

		return alunos;
	}

	public Aluno atualizarAluno(Aluno aluno) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			session.update(aluno);
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return aluno;
	}

	public void deletarAluno(Aluno aluno) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.delete(aluno);
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
