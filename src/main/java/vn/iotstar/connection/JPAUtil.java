package vn.iotstar.connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

<<<<<<< HEAD
=======
/** Quản lý EntityManagerFactory dùng chung, cấp phát EntityManager cho các DAO. */
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
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
