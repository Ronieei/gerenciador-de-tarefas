package spring.applications.modelo;

import java.util.Objects;

public class Tarefa {
    private int id;
    private String titulo;
    private String descricao;
    private boolean concluido;
    private int usuarioId; // Novo campo para associar a tarefa a um usuário

    // Construtores existentes
    public Tarefa() {}

    public Tarefa(String titulo, String descricao, boolean concluido, int usuarioId) {
        this.titulo = titulo;
        this.descricao = descricao;
        this.concluido = concluido;
        this.usuarioId = usuarioId;
    }

    public Tarefa(int id, String titulo, String descricao, boolean concluido, int usuarioId) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.concluido = concluido;
        this.usuarioId = usuarioId;
    }

    // Getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isConcluido() {
        return concluido;
    }

    public void setConcluido(boolean concluido) {
        this.concluido = concluido;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Tarefa tarefa = (Tarefa) o;
        return id == tarefa.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Tarefa{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", descricao='" + descricao + '\'' +
                ", concluido=" + concluido +
                ", usuarioId=" + usuarioId +
                '}';
    }
}