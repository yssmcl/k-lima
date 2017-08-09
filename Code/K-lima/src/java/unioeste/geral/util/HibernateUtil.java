package unioeste.geral.util;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.dialect.Dialect;

/**
 * Hibernate Utility class with a convenient method to get Session Factory object.
 */
public class HibernateUtil {

	private static final SessionFactory sessionFactory;

	static {
		try {
			Configuration configuration = new Configuration();
			configuration.configure();

			StandardServiceRegistry standardServiceRegistry = new StandardServiceRegistryBuilder().applySettings(
				configuration.getProperties()).build();

			sessionFactory = configuration.buildSessionFactory(standardServiceRegistry);
		} catch (HibernateException ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void clean() {
		Enumeration<Driver> drivers = DriverManager.getDrivers();
		while (drivers.hasMoreElements()) {
			try {
				DriverManager.deregisterDriver(drivers.nextElement());
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		sessionFactory.close();

		StandardServiceRegistryBuilder.destroy(sessionFactory.getSessionFactoryOptions().getServiceRegistry());
	}

	public static void printDDL() {
		Configuration configuration = new Configuration();
		configuration.configure();
		Dialect dialect = Dialect.getDialect(configuration.getProperties());
		String ddl[] = configuration.generateSchemaCreationScript(dialect);
		for (int i = 0; i < ddl.length; i++) {
			System.out.println(ddl[i]);
		}
	}

	public static void main(String[] args) {
		HibernateUtil.printDDL();
	}

}
