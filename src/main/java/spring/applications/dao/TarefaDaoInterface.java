package spring.applications.dao;

import spring.applications.modelo.Tarefa;

import java.util.List;

public interface TarefaDaoInterface {
        void salvarTarefa(Tarefa t) throws ErroDao;
        void remover(Tarefa t) throws ErroDao;
        void remover(int id) throws ErroDao;
        List<Tarefa> buscar() throws ErroDao;
        Tarefa buscar(int id) throws ErroDao;
        void editar(Tarefa t) throws ErroDao;
        void sair() throws ErroDao;
        List<Tarefa> buscarTarefasPorUsuario(int usuarioId) throws ErroDao;
        Tarefa buscarPorId(int id) throws ErroDao;
        void atualizar(Tarefa tarefa) throws ErroDao;

}
