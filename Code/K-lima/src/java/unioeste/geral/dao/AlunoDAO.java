package unioeste.geral.dao;

import java.sql.Connection;
import java.sql.SQLException;
import unioeste.geral.util.HibernateUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.jdbc.Work;
import unioeste.geral.bo.Aluno;

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

	public List<Aluno> buscarAlunosPorAtributos(HashMap<String, Object> condicao) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Aluno> alunos = null;

		try {
			transaction = session.beginTransaction();
			
			Criteria criteria = session.createCriteria(Aluno.class);
			for (Map.Entry<String, Object> entry : condicao.entrySet()) {
				criteria.add(Restrictions.eq(entry.getKey(), entry.getValue()));
			}
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
	
	public Long buscarQtdAlunosPorAtributos(HashMap<String, Object> condicao) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		long qtdAlunos = 0;

		try {
			transaction = session.beginTransaction();
			
			Criteria criteria = session.createCriteria(Aluno.class);
			for (Map.Entry<String, Object> entry : condicao.entrySet()) {
				criteria.add(Restrictions.eq(entry.getKey(), entry.getValue()));
			}
			criteria.setProjection(Projections.rowCount());
			qtdAlunos = (Long) criteria.uniqueResult();
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return qtdAlunos;
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
	
	public void deletarTodosAlunos() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
					
			String hql = "delete from Aluno";
			Query query = session.createQuery(hql);
			query.executeUpdate();

			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
		
}
