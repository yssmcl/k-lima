package unioeste.geral.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Centro;
import unioeste.geral.util.HibernateUtil;

public class CentroDAO {
	
	public void inserirCentro(Centro centro) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			
			session.save(centro);
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
		
	public List<Centro> buscarCentrosPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Centro> centros = null;

		try {
			transaction = session.beginTransaction();

			Criteria criteria = session.createCriteria(Centro.class);
			criteria.add(Restrictions.eq(atributo, valor));
			centros = (List<Centro>) criteria.list();
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return centros;
	}

}
