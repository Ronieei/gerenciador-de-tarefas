package spring.applications;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import spring.applications.dao.FabricaConexao;

import java.sql.Connection;
import java.sql.SQLException;

@SpringBootApplication
public class ApplicationsApplication {

	public static void main(String[] args) {
		try {
			// Testa a conexão antes de iniciar a aplicação Spring Boot
			Connection con = FabricaConexao.pegaConexao();
			System.out.println("Conexão bem-sucedida: " + (con != null));

			// Inicia a aplicação Spring Boot
			SpringApplication.run(ApplicationsApplication.class, args);
		} catch (SQLException e) {
			System.err.println("Falha na conexão com o banco de dados: " + e.getMessage());
		}
	}
}
