package spring.applications.modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Usuario {
    private int id;
    private String nome;
    private String login;
    private String telefone;
    private String email;
    private String senha;
    private boolean admin = false;
    private List<Tarefa> tarefas;

    // Construtor padrão
    public Usuario() {
        this.tarefas = new ArrayList<>();
    }

    // Construtor completo
    public Usuario(int id, String nome, String login, String telefone, String email, String senha, boolean admin) {
        this.id = id;
        this.nome = nome;
        this.login = login;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
        this.admin = admin;
        this.tarefas = new ArrayList<>();
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public List<Tarefa> getTarefas() {
        return tarefas;
    }

    public void setTarefas(List<Tarefa> tarefas) {
        this.tarefas = tarefas;
    }



    // Sobrescrita de equals e hashCode para garantir comparação adequada
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return id == usuario.id && Objects.equals(login, usuario.login);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id,login);
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", login='" + login + '\'' +
                ", telefone='" + telefone + '\'' +
                ", email='" + email + '\'' +
                ", senha='" + senha + '\'' +
                ", admin=" + admin +
                ", tarefas=" + tarefas +
                '}';
    }
}
