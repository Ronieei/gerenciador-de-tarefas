package spring.applications.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import spring.applications.dao.TarefaDao;
import spring.applications.dao.FabricaConexao;
import spring.applications.dao.ErroDao;
import spring.applications.dao.TarefaDaoInterface;
import spring.applications.modelo.Tarefa;
import spring.applications.modelo.Usuario;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@Controller
public class Tarefa_Controller {
    //Busca tarefas pelo usuario
    @GetMapping("/tarefa")
    public String relatorio(HttpSession session) {
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null) {
            return "redirect:login";
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            List<Tarefa> tarefas = tarefaDao.buscarTarefasPorUsuario(usuarioLogado.getId());
            session.setAttribute("tarefas", tarefas);
        } catch (SQLException | ErroDao e) {
            e.printStackTrace();
            // Adicionar lógica de tratamento de erro, se necessário
        }

        return "usuario/tarefa";
    }


    @PostMapping("/cadastrar_tarefa")
    public ModelAndView cadastrar(@RequestParam String titulo,
                                  @RequestParam String descricao,
                                  @RequestParam(value = "concluido", defaultValue = "false") boolean concluido,
                                  HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        // Obtendo o usuário logado da sessão
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado == null) {
            modelAndView.setViewName("redirect:login");  // Redireciona para a página de login se o usuário não estiver logado
            return modelAndView;
        }

        // Salvando o cadastro de tarefas
        Tarefa tarefa = new Tarefa(titulo, descricao, concluido, usuarioLogado.getId());

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            tarefaDao.salvarTarefa(tarefa);  // Salvando a tarefa no banco de dados
            modelAndView.setViewName("redirect:tarefa");  // Redireciona para a página "tarefa" após o cadastro
        } catch (SQLException | ErroDao e) {
            e.printStackTrace();
            modelAndView.setViewName("usuario/tarefa");
            modelAndView.addObject("mensagemErro", "Erro ao conectar ao banco de dados.");
        }
        return modelAndView;
    }

    //Atualiza a conclusão da Tarefa
    @GetMapping("/trocaconclusaodatarefa")
    public RedirectView alterarStatus(@RequestParam("id") int id,
                                      @SessionAttribute("usuarioLogado") Usuario usuarioSessao,
                                      RedirectAttributes attributes) {
        if (usuarioSessao != null) {
            try (Connection con = FabricaConexao.pegaConexao()) { // Obtém uma conexão
                TarefaDaoInterface tarefaDao = new TarefaDao(con);  // Passa a conexão para o TarefaDao
                try {
                    // Buscar a tarefa no banco de dados
                    spring.applications.modelo.Tarefa tarefa = tarefaDao.buscarPorId(id);
                    if (tarefa != null) {
                        // Alternar o status da tarefa
                        tarefa.setConcluido(!tarefa.isConcluido());

                        // Atualizar a tarefa no banco de dados
                        tarefaDao.atualizar(tarefa);
                    }

                    return new RedirectView("/tarefa");
                } catch (Exception e) {
                    attributes.addAttribute("mensagem", "Erro ao atualizar tarefa: " + e.getMessage());
                    return new RedirectView("/tarefa");
                }
            } catch (SQLException e) {
                attributes.addAttribute("mensagem", "Erro ao conectar ao banco de dados: " + e.getMessage());
                return new RedirectView("/tarefa");
            }
        } else {
            return new RedirectView("/login");
        }
    }

    //Deleta a Tarefa
    @GetMapping("/deletartarefa")
    public RedirectView deletarTarefa(@RequestParam(name = "id", required = false) Integer id,
                                      RedirectAttributes attributes) {
        if (id != null) {
            try (Connection con = FabricaConexao.pegaConexao()) {
                TarefaDaoInterface tarefaDao = new TarefaDao(con);
                tarefaDao.remover(id);
                attributes.addFlashAttribute("mensagem", "Tarefa deletada com sucesso.");
            } catch (ErroDao | SQLException e) {
                attributes.addFlashAttribute("mensagem", "Erro ao deletar tarefa: " + e.getMessage());
            }
        } else {
            attributes.addFlashAttribute("mensagem", "Informe o ID da tarefa.");
        }
        return new RedirectView("/tarefa");
    }

    //Busca os dados pelo ida para edicao
    @GetMapping("/editar_tarefa")
    public String editarTarefa(@RequestParam("id") int id, Model model, HttpSession session) {
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado == null) {
            return "redirect:login";
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            Tarefa tarefa = tarefaDao.buscarPorId(id);
            if (tarefa != null && tarefa.getUsuarioId() == usuarioLogado.getId()) {
                model.addAttribute("tarefa", tarefa);
                return "usuario/editar_tarefa";
            } else {
                return "redirect:tarefa";
            }
        } catch (SQLException | ErroDao e) {
            e.printStackTrace();
            return "redirect:tarefa";
        }
    }

    // Edita de fato os dados da tarefa
    @PostMapping("/editar_tarefa")
    public RedirectView editarTarefa(@RequestParam int id,
                                     @RequestParam String titulo,
                                     @RequestParam String descricao,
                                     @RequestParam(value = "concluido", defaultValue = "false") boolean concluido,
                                     HttpSession session,
                                     RedirectAttributes attributes) {
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado == null) {
            return new RedirectView("login");
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            Tarefa tarefa = new Tarefa(id, titulo, descricao, concluido, usuarioLogado.getId());
            tarefaDao.editar(tarefa);
            attributes.addFlashAttribute("mensagem", "Tarefa atualizada com sucesso.");
            return new RedirectView("tarefa");
        } catch (SQLException | ErroDao e) {
            e.printStackTrace();
            attributes.addFlashAttribute("mensagem", "Erro ao atualizar tarefa.");
            return new RedirectView("tarefa");
        }
    }

    //Resumo de tarefas dos usuarioss
    @GetMapping("/relatorio_tarefa_usuario")
    public ModelAndView relatorioTarefaUsuario(@RequestParam("id") int id, Model model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        // Verifica se o usuário está logado
        if (usuarioLogado == null) {
            return new ModelAndView("redirect:/login"); // Redireciona imediatamente
        }

        // Valida o ID do usuário
        if (id <= 0) {
            modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
            modelAndView.addObject("mensagemErro", "ID do usuário inválido ou usuário não possui tarefas.");
            return modelAndView;
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            List<Tarefa> tarefas = tarefaDao.buscarTarefasPorUsuario(id);

            if (tarefas != null && !tarefas.isEmpty()) {
                modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
                model.addAttribute("tarefas", tarefas);
            } else {
                modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
                modelAndView.addObject("mensagemErro", "Usuário não possui tarefas.");
            }

        } catch (SQLException | ErroDao e) {
            e.printStackTrace();  // Melhor usar um logger para erros em produção
            modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
            modelAndView.addObject("mensagemErro", "Erro ao buscar tarefas. Tente novamente mais tarde.");
        }

        return modelAndView;
    }

    @GetMapping("/pesquisar_tarefas")
    public ModelAndView pesquisarTarefa(@RequestParam(value = "id", required = false) String idStr, Model model, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        // Verificar se o usuário está logado
        if (usuarioLogado == null) {
            modelAndView.setViewName("redirect:/login");  // Corrigido o caminho de redirecionamento
            return modelAndView;
        }

        // Verificar se o ID é nulo ou vazio
        if (idStr == null || idStr.trim().isEmpty()) {
            modelAndView.addObject("mensagemErro", "Nenhuma tarefa encontrada para o ID informado.");
            modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");  // Caminho corrigido
            return modelAndView;
        }

        int id;
        try {
            // Tentar converter o valor para inteiro
            id = Integer.parseInt(idStr);

            // Verificar se o ID é menor ou igual a zero
            if (id <= 0) {
                modelAndView.addObject("mensagemErro", "ID inválido. Informe um número maior que zero.");
                modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
                return modelAndView;
            }
        } catch (NumberFormatException e) {
            // Caso o ID não seja um número válido
            modelAndView.addObject("mensagemErro", "ID inválido. Informe um número válido.");
            modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
            return modelAndView;
        }

        try (Connection con = FabricaConexao.pegaConexao()) {
            TarefaDaoInterface tarefaDao = new TarefaDao(con);
            Tarefa tarefa = tarefaDao.buscarPorId(id);

            if (tarefa != null) {
                model.addAttribute("tarefa", tarefa);
                modelAndView.setViewName("usuario/relatorio_tarefa");
            } else {
                modelAndView.addObject("mensagemErro", "Tarefa não encontrada.");
                modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
            }

        } catch (SQLException | ErroDao e) {
            // Use um logger em vez de printStackTrace em produção
            e.printStackTrace();
            modelAndView.addObject("mensagemErro", "Erro ao buscar tarefa.");
            modelAndView.setViewName("usuario/relatorios_de_tarefas_dos_usuarios");
        }

        return modelAndView;
    }
}
