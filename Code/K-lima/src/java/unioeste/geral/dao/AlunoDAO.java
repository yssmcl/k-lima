package unioeste.geral.dao;

import com.google.common.collect.Multimap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Aluno;
import unioeste.geral.util.HibernateUtil;

public class AlunoDAO {

	public void inserirAluno(Aluno aluno) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			session.save(aluno);

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

	public List<Aluno> buscarAlunosPorAtributos(HashMap<String, Object> condicao) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Aluno> alunos = null;

		try {
			Criteria criteria = session.createCriteria(Aluno.class);

			for (Map.Entry<String, Object> entry : condicao.entrySet()) {
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

			alunos = (List<Aluno>) criteria.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return alunos;
	}

	public List<Aluno> buscarAlunosPorAtributosMultimap(Multimap<String, Object> condicaoAND,
														Multimap<String, Object> condicaoOR) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Aluno> alunos = null;

		try {
			Criteria criteria = session.createCriteria(Aluno.class);
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

			alunos = (List<Aluno>) criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return alunos;
	}

	public Long buscarQtdAlunosPorAtributos(Multimap<String, Object> condicaoAND,
											Multimap<String, Object> condicaoOR) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		long qtdAlunos = 0;

		try {
			Criteria criteria = session.createCriteria(Aluno.class);
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

			criteria.setProjection(Projections.rowCount());
			qtdAlunos = (Long) criteria.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return qtdAlunos;
	}

	public List<Aluno> buscarTodosAlunos() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Aluno> alunos = null;

		try {
			alunos = session.createCriteria(Aluno.class).list();
		} catch (HibernateException e) {
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
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

		return aluno;
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
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void deletarAlunosPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			String hql = "delete from Aluno where " + atributo + " = :valor";
			Query query = session.createQuery(hql);
			query.setParameter("valor", valor);
			query.executeUpdate();

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

}
