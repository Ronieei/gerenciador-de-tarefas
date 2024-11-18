package spring.applications.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import spring.applications.dao.FabricaConexao;
import spring.applications.dao.UsuarioDao;
import spring.applications.modelo.Usuario;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Controller
public class Usuario_Controller {

    @GetMapping("/login")
    public String login() {
        return "usuario/login";  // Retorna a view "login"
    }

    @PostMapping("/login")
    public ModelAndView logar(@RequestParam String login, @RequestParam String senha, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        // Verifica se já existe um usuário logado na sessão
        if (session.getAttribute("usuarioLogado") != null) {
            // Redireciona para a página inicial ou exibe uma mensagem de erro
            modelAndView.setViewName("usuario/login");  // Redireciona para a página "home"
            modelAndView.addObject("mensagemErro", "Já existe um usuário logado. Faça logout antes de logar com outra conta.");
            return modelAndView;
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            UsuarioDao usuarioDao = new UsuarioDao(con);
            Usuario usuario = usuarioDao.buscarPorLoginESenha(login, senha);

            if (usuario != null) {
                session.setAttribute("usuarioLogado", usuario);
                modelAndView.setViewName("redirect:/");  // Redireciona para a página "home"
            } else {
                modelAndView.setViewName("usuario/login");  // Retorna para a página de login
                modelAndView.addObject("mensagemErro", "Login ou senha inválidos.");
            }
        } catch (SQLException e) {
            modelAndView.setViewName("usuario/login");
            modelAndView.addObject("mensagemErro", "Erro ao conectar ao banco de dados.");
        }
        return modelAndView;
    }

    //Cadastro do usuario
    @GetMapping("/cadastrar")
    public ModelAndView cadastro(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("usuario/cadastrar");

        // Obtém o usuário logado da sessão
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado != null && usuarioLogado.isAdmin()) {
            modelAndView.addObject("mostrarAdmin", true);
        } else {
            modelAndView.addObject("mostrarAdmin", false);
        }

        return modelAndView;
    }

    @PostMapping("/cadastrar")
    public ModelAndView cadastrar(@RequestParam String nome, @RequestParam String login,
                                  @RequestParam String telefone, @RequestParam String email,
                                  @RequestParam String senha, @RequestParam(required = false) String admin) {
        ModelAndView modelAndView = new ModelAndView();

        // Validar se nome, login e senha não contêm espaços
        if (nome.trim().isEmpty() || nome.contains(" ") || login.trim().isEmpty() || login.contains(" ") || senha.contains(" ")) {
            modelAndView.setViewName("usuario/cadastrar");
            modelAndView.addObject("mensagemErro", "Nome, login e senha não podem conter espaços em branco.");
            return modelAndView;
        }

        // Validar o formato do telefone
        String telefonePattern = "\\d{2} \\d{5}-\\d{4}"; // Exemplo: 55 90099-9922
        if (!telefone.matches(telefonePattern)) {
            modelAndView.setViewName("usuario/cadastrar");
            modelAndView.addObject("mensagemErro", "Telefone deve estar no formato 55 90099-9922.");
            return modelAndView;
        }

        boolean isAdmin = admin != null && admin.equals("true");
        Usuario novoUsuario = new Usuario(0, nome, login, telefone, email, senha, isAdmin);

        try (Connection con = FabricaConexao.pegaConexao()) {
            UsuarioDao usuarioDao = new UsuarioDao(con);
            usuarioDao.inserirUsuario(novoUsuario);
            modelAndView.setViewName("redirect:/home");  // Redireciona para a página "home" após o cadastro
        } catch (SQLException e) {
            modelAndView.setViewName("usuario/cadastrar");
            modelAndView.addObject("mensagemErro", "Erro ao conectar ao banco de dados.");
        }

        return modelAndView;
    }

    @GetMapping("/sair")
    public String sair(HttpSession session) {
        // Invalida a sessão do usuário
        session.invalidate();
        // Redireciona para a página de login ou outra página
        return "redirect:/login";
    }

    @GetMapping("/relatorio_de_usuarios")
    public ModelAndView relatorioUsuarios(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("usuario/relatorios_de_usuarios");

        // Verifica se o usuário está logado e se ele é administrador
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado == null || !usuarioLogado.isAdmin()) {
            modelAndView.addObject("mensagemErro", "Acesso negado. Esta página é apenas para administradores.");
            return modelAndView;
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            UsuarioDao usuarioDao = new UsuarioDao(con);
            List<Usuario> listaUsuarios = usuarioDao.listarTodos();

            modelAndView.addObject("listaUsuarios", listaUsuarios);
        } catch (SQLException e) {
            modelAndView.addObject("mensagemErro", "Erro ao conectar ao banco de dados.");
        }

        return modelAndView;
    }
}
