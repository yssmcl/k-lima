package unioeste.geral.dao;

import com.google.common.collect.Multimap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Disciplina;
import unioeste.geral.util.HibernateUtil;

public class DisciplinaDAO {

	public void inserirDisciplina(Disciplina disciplina) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			session.save(disciplina);

			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<Disciplina> buscarDisciplinas(Multimap<String, Object> condicaoAND,
											  Multimap<String, Object> condicaoOR) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Disciplina> disciplinas = null;

		try {
			Criteria criteria = session.createCriteria(Disciplina.class);
			if (condicaoAND != null) {
				for (Map.Entry entry : condicaoAND.entries()) {
					if (entry.getValue().getClass() == String.class) {
						criteria.add(
							Restrictions.ilike((String) entry.getKey(), entry.getValue())
						);
					} else {
						criteria.add(
							Restrictions.eq((String) entry.getKey(), entry.getValue())
						);
					}
				}
			}

			Disjunction disjunction = Restrictions.disjunction();
			if (condicaoOR != null) {
				for (Map.Entry entry : condicaoOR.entries()) {
					if (entry.getValue().getClass() == String.class) {
						disjunction.add(
							Restrictions.ilike((String) entry.getKey(), entry.getValue())
						);
					} else {
						disjunction.add(
							Restrictions.eq((String) entry.getKey(), entry.getValue())
						);
					}
				}
			}
			criteria.add(disjunction);

			disciplinas = (List<Disciplina>) criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return disciplinas;
	}

}
