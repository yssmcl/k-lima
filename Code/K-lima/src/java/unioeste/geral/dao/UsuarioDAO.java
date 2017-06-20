package unioeste.geral.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.bo.Aluno;
import unioeste.geral.util.HibernateUtil;
import unioeste.geral.bo.Usuario;

public class UsuarioDAO {
	// TODO: função genérica para inserirUsuario e inserirAluno (só muda a linha do session.save())
	public void inserirUsuario(Usuario usuario) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			
			session.save(usuario);
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public List<Usuario> buscarUsuariosPorAtributo(String atributo, Object valor) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<Usuario> usuarios = null;

		try {
			transaction = session.beginTransaction();
			
			session = HibernateUtil.getSessionFactory().openSession(); 
			Criteria criteria = session.createCriteria(Usuario.class);
			criteria = criteria.add(Restrictions.eq(atributo, valor));
			usuarios = criteria.list();
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return usuarios;
	}
	
	public Usuario atualizarUsuario(Usuario usuario) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			
			session.update(usuario);
			
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return usuario;
	}
	
}
