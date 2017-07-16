package unioeste.geral.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Centro;
import unioeste.geral.bo.Curso;
import unioeste.geral.util.HibernateUtil;

public class CursoDAO {
	
	public void inserirCurso(Curso curso) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			
			session.save(curso);
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<Curso> buscarCursosPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Curso> cursos = null;

		try {
			transaction = session.beginTransaction();

			Criteria criteria = session.createCriteria(Curso.class);
			criteria.add(Restrictions.eq(atributo, valor));
			cursos = (List<Curso>) criteria.list();
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return cursos;
	}
	
}
