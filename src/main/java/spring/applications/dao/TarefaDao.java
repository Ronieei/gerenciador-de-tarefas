package spring.applications.dao;

import spring.applications.modelo.Tarefa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TarefaDao implements TarefaDaoInterface {
    private final Connection con;

    public TarefaDao(Connection con) {
        this.con = con;
    }

    @Override
    public void salvarTarefa(Tarefa t) throws ErroDao {
        try {
            PreparedStatement stm = con.prepareStatement(
                    "INSERT INTO tarefa (titulo, descricao, concluido, usuario_id) VALUES (?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            stm.setString(1, t.getTitulo());
            stm.setString(2, t.getDescricao());
            stm.setBoolean(3, t.isConcluido());
            stm.setInt(4, t.getUsuarioId());
            stm.executeUpdate();

            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                t.setId(rs.getInt(1));
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
    }

    @Override
    public void remover(Tarefa t) throws ErroDao {
        remover(t.getId());
    }

    @Override
    public void remover(int id) throws ErroDao {
        try {
            PreparedStatement stm = con.prepareStatement("DELETE FROM tarefa WHERE id=?");
            stm.setInt(1, id);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
    }

    @Override
    public List<Tarefa> buscar() throws ErroDao {
        List<Tarefa> tarefas = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tarefa");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Tarefa t = new Tarefa();
                t.setId(rs.getInt("id"));
                t.setTitulo(rs.getString("titulo"));
                t.setDescricao(rs.getString("descricao"));
                t.setConcluido(rs.getBoolean("concluido"));
                t.setUsuarioId(rs.getInt("usuario_id"));
                tarefas.add(t);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
        return tarefas;
    }

    @Override
    public Tarefa buscar(int id) throws ErroDao {
        Tarefa t = null;
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tarefa WHERE id=?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                t = new Tarefa();
                t.setId(rs.getInt("id"));
                t.setTitulo(rs.getString("titulo"));
                t.setDescricao(rs.getString("descricao"));
                t.setConcluido(rs.getBoolean("concluido"));
                t.setUsuarioId(rs.getInt("usuario_id"));
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
        return t;
    }

    @Override
    public void editar(Tarefa t) throws ErroDao {
        try {
            PreparedStatement stm = con.prepareStatement(
                    "UPDATE tarefa SET titulo=?, descricao=?, concluido=?, usuario_id=? WHERE id=?"
            );
            stm.setString(1, t.getTitulo());
            stm.setString(2, t.getDescricao());
            stm.setBoolean(3, t.isConcluido());
            stm.setInt(4, t.getUsuarioId());
            stm.setInt(5, t.getId());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
    }

    @Override
    public List<Tarefa> buscarTarefasPorUsuario(int usuarioId) throws ErroDao {
        List<Tarefa> tarefas = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tarefa WHERE usuario_id=?");
            stm.setInt(1, usuarioId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Tarefa t = new Tarefa();
                t.setId(rs.getInt("id"));
                t.setTitulo(rs.getString("titulo"));
                t.setDescricao(rs.getString("descricao"));
                t.setConcluido(rs.getBoolean("concluido"));
                t.setUsuarioId(rs.getInt("usuario_id"));
                tarefas.add(t);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
        return tarefas;
    }

    @Override
    public void sair() throws ErroDao {
        try {
            con.close();
        } catch (SQLException e) {
            throw new ErroDao(e);
        }
    }

    @Override
    public Tarefa buscarPorId(int id) throws ErroDao {
        Tarefa tarefa = null;
        String sql = "SELECT * FROM tarefa WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    tarefa = new Tarefa(
                            rs.getInt("id"),
                            rs.getString("titulo"),
                            rs.getString("descricao"),
                            rs.getBoolean("concluido"),
                            rs.getInt("usuario_id")
                    );
                }
            }
        } catch (Exception e) {
            throw new ErroDao("Erro ao buscar tarefa: " + e.getMessage());
        }
        return tarefa;
    }

    @Override
    public void atualizar(Tarefa tarefa) throws ErroDao {
        String sql = "UPDATE tarefa SET concluido = ? WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setBoolean(1, tarefa.isConcluido());
            stmt.setInt(2, tarefa.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new ErroDao("Erro ao atualizar tarefa: " + e.getMessage());
        }
    }
}