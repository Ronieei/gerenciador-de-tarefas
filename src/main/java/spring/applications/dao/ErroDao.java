package spring.applications.dao;

public class ErroDao extends Exception {
    public ErroDao() {
        super("Mensagem: Ocorreu um erro no DAO.");
    }

    public ErroDao(String message) {
        super("Mensagem: " + message);
    }

    public ErroDao(Exception e) {
        super("Mensagem: Ocorreu um erro no DAO: " + e.getMessage());
    }
}
