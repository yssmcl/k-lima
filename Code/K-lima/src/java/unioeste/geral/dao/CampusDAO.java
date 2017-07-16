package unioeste.geral.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Campus;
import unioeste.geral.bo.Centro;
import unioeste.geral.util.HibernateUtil;

public class CampusDAO {
	
		public void inserirCampus(Campus campus) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			
			session.save(campus);
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<Campus> buscarCampiPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Campus> campi = null;

		try {
			transaction = session.beginTransaction();

			Criteria criteria = session.createCriteria(Campus.class);
			criteria.add(Restrictions.eq(atributo, valor));
			campi = (List<Campus>) criteria.list();
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return campi;
	}
		
}
