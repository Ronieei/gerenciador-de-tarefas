package spring.applications.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FabricaConexao extends ExceptionInInitializerError{

    private static final String URL = "jdbc:h2:mem:testdb";
    private static final String USER = "sa";
    private static final String PASSWORD = "";
    private static final String DRIVER = "org.h2.Driver";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection pegaConexao() throws SQLException {
        System.out.println("Conexao com SUCESSO! - \nTESTES\n");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
