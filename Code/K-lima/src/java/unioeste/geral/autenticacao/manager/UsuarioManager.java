package unioeste.geral.autenticacao.manager;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import unioeste.geral.aluno.bo.Aluno;
import unioeste.geral.aluno.dao.HibernateUtil;
import unioeste.geral.autenticacao.bo.Usuario;
import unioeste.geral.autenticacao.dao.UsuarioDAO;


public class UsuarioManager {
	public static final String ALGORITMO_HASH = "SHA-256";
	public static final int TAM_SALT = 32;
	
	public void salvarUsuario(Usuario usuario) {
		String[] senhaComSalt = criarSenha(usuario.getSenha());
		usuario.setSalt(senhaComSalt[0]);
		usuario.setSenha(senhaComSalt[1]);
		System.out.println(usuario.getNomeUsuario() + "\t" + usuario.getSalt() + "\t" + usuario.getSenha());
		new UsuarioDAO().inserirUsuario(usuario);
	}
	
	public List<Usuario> recuperarUsuariosPorAtributo(String atributo, Object valor) {
		return new UsuarioDAO().buscarUsuariosPorAtributo(atributo, valor);
	}
	
	public String[] criarSenha(String senha) {
		SecureRandom random = new SecureRandom();
        byte[] salt = new byte[TAM_SALT];
		random.nextBytes(salt);
		byte[] hashSenha;
		
		try {
		 	MessageDigest sha2 = MessageDigest.getInstance(ALGORITMO_HASH);
			String senhaSalt = Base64.getEncoder().encodeToString(salt) + senha;
			byte[] bytesSenha = senhaSalt.getBytes();
			hashSenha = sha2.digest(bytesSenha);
			
			String[] senhaComSalt = new String[2];
			senhaComSalt[0] = Base64.getEncoder().encodeToString(salt);
			senhaComSalt[1] = Base64.getEncoder().encodeToString(hashSenha);
			return senhaComSalt;
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		}
		
		return null;
	}
	
	public boolean verificarLogin(String nomeUsuario, String senha) {
		Usuario usuarioBanco = (Usuario) recuperarUsuariosPorAtributo("nomeUsuario", nomeUsuario).get(0);
				
		byte[] hashSenha = null;
		try {
			String salt = usuarioBanco.getSalt();
		 	MessageDigest sha2 = MessageDigest.getInstance(ALGORITMO_HASH);
			String senhaSalt = salt + senha;
			byte[] bytesSenha = senhaSalt.getBytes();
			hashSenha = sha2.digest(bytesSenha);
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		}		
		
		String hash = Base64.getEncoder().encodeToString(hashSenha);
		return hash.equals(usuarioBanco.getSenha());
	}
	
	public void modificarUsuario(Usuario usuario) {
		new UsuarioDAO().atualizarUsuario(usuario);
	}
	
//	public static void main(String[] args) {
//		Usuario usuario = new Usuario();
//		UsuarioManager usuarioManager = new UsuarioManager();
//		
////		usuario.setNomeUsuario("user");
////		usuario.setSenha("password");
////		usuarioManager.salvarUsuario(usuario);
//		
////		Session session = HibernateUtil.getSessionFactory().openSession(); 
////		Criteria criteria = session.createCriteria(Usuario.class);
////		criteria = criteria.add(Restrictions.eq("nomeUsuario", "user"));
////		Usuario usuarioBanco = (Usuario) criteria.list().get(0);
////		System.out.println(usuarioBanco.getNomeUsuario() + "\t" + usuarioBanco.getSalt() + "\t" + usuarioBanco.getSenha());
//
//		System.out.println(usuarioManager.verificarLogin("user", "password"));
//	}

}