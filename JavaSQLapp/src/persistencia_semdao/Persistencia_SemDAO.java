/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package persistencia_semdao;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class Persistencia_SemDAO {
    private static Scanner scanner = new Scanner(System.in);
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    int opcao;
    do {
        System.out.println("\n=== MENU PRINCIPAL ===");
        System.out.println("1. Cadastrar produto");
        System.out.println("2. Consultar produto por ID");
        System.out.println("3. Listar todos os produtos");
        System.out.println("4. Atualizar produto");
        System.out.println("5. Deletar produto");
        System.out.println("0. Sair");
        System.out.print("Escolha uma opção: ");
        
        opcao = scanner.nextInt();
        scanner.nextLine();
        
        try {
            switch (opcao) {
                case 1:
                    cadastrarProduto();
                    break;
                case 2:
                    consultarProdutoPorId();
                    break;
                case 3:
                    consultarTodosProdutos();
                    break;
                case 4:
                    atualizarProduto();
                    break;
                case 5:
                    deletarProduto();
                    break;
                case 0:
                    System.out.println("Saindo do sistema...");
                    break;
                default:
                    System.out.println("Opção inválida! Tente novamente.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    } while (opcao != 0);
}

    private static void cadastrarProduto() throws ClassNotFoundException, SQLException {
        Produto p = new Produto();
        
        System.out.print("Digite a descrição do produto: ");
        p.setDescricao(scanner.nextLine());
        
        System.out.print("Digite o preço do produto: ");
        p.setPreco(scanner.nextDouble());
        scanner.nextLine();
        
        p.cadastrar();
        System.out.println("Produto cadastrado com sucesso!");
    }

    private static void consultarProdutoPorId() throws ClassNotFoundException, SQLException {
    System.out.print("Digite o ID do produto que deseja consultar: ");
    int id = scanner.nextInt();
    scanner.nextLine();
    
    Produto p = new Produto();
    Produto produtoEncontrado = p.consultarById(id);
    
    if (produtoEncontrado != null) {
        System.out.println("\n=== PRODUTO ENCONTRADO ===");
        System.out.printf("ID: %d | Descrição: %s | Preço: R$%.2f%n",
                produtoEncontrado.getId(), 
                produtoEncontrado.getDescricao(), 
                produtoEncontrado.getPreco());
    } else {
        System.out.println("Produto com ID " + id + " não encontrado.");
    }
}

    private static void atualizarProduto() throws ClassNotFoundException, SQLException {
        consultarTodosProdutos();
        System.out.print("Digite o ID do produto que deseja atualizar: ");
        int id = scanner.nextInt();
        scanner.nextLine();
        
        Produto p = new Produto();
    Produto produtoExistente = p.consultarById(id);
    
    if (produtoExistente == null) {
        System.out.println("Produto não encontrado!");
        return;
    }
    
    System.out.printf("Produto atual: %s - R$%.2f%n", 
            produtoExistente.getDescricao(), produtoExistente.getPreco());
    
    System.out.print("Digite a nova descrição: ");
    String novaDescricao = scanner.nextLine();
    
    System.out.print("Digite o novo preço: ");
    double novoPreco = scanner.nextDouble();
    scanner.nextLine();
    
    p.atualizar(id, novaDescricao, novoPreco);
    System.out.println("Produto atualizado com sucesso!");
}

    private static void deletarProduto() throws ClassNotFoundException, SQLException {
        consultarTodosProdutos();
        System.out.print("\nDigite o ID do produto que deseja deletar: ");
        int id = scanner.nextInt();
        scanner.nextLine();
        
        Produto p = new Produto();
        p.deletar(id);
        System.out.println("Produto deletado com sucesso!");
    }
    
    private static void consultarTodosProdutos() throws ClassNotFoundException, SQLException {
    Produto p = new Produto();
    List<Produto> produtos = p.consultarTodos();
    
    if (produtos.isEmpty()) {
        System.out.println("Nenhum produto cadastrado no sistema.");
    } else {
        System.out.println("\n=== LISTA DE TODOS OS PRODUTOS ===");
        System.out.println("ID  | Descrição            | Preço");
        System.out.println("----|----------------------|--------");
        
        for (Produto produto : produtos) {
            System.out.printf("%-3d | %-20s | R$%.2f%n",
                produto.getId(),
                produto.getDescricao(),
                produto.getPreco());
        }
    }
  }
}   
