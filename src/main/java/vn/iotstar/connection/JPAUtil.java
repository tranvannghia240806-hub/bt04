package vn.iotstar.connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/** Quản lý EntityManagerFactory dùng chung, cấp phát EntityManager cho các DAO. */
public class JPAUtil {

    private static final String PERSISTENCE_UNIT_NAME = "ShoppingServiceMVC_PU";
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

    private JPAUtil() {
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
