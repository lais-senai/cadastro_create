//importe necesario do Material App
import 'package:flutter/material.dart';

class Cliente {
 final String nome;
 final String email;
 final String senha;

 //construtor do cliente
 Cliente({
  required this.nome,
  required this.email,
  required this.senha,
 });
 @override
 String toString(){
  return 'Cliente: $nome, Email: $email';
 }
  }

class GerenciadorClientes {
  //variavel estatica que guarda a unica copia desta classe 
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
//inpede a criacao de novas instancias
  GerenciadorClientes._interno();
//sempre retorna a instancia existente
  factory GerenciadorClientes() => _instancia;
  //lista <ul> qu armazena todos os clientes cadastrados
  final List<Cliente> _clientes = [];
//para acessar a lsta de clientes (retorna uma copia imutavel)
  List<Cliente> get clientes => List.unmodifiable(_clientes);
  //tentar cadastrar um cliente novo
  bool cadastrar(Cliente cliente){
//vamos checar se ja existe um email cadastrado
if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
print('Erro: email ${cliente.email} ja cadastrado');
return false; //Cadastro falhou
}
_clientes.add(cliente); //adicionar o cliente
print('Novo cliente cadastro: ${cliente.nome}');
return true; //cadastrouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
  }
  Cliente ? login(String email, String senha){
    return _clientes.firstWhere(
      //é uma funcao anonima
      // o c representa cadaelemento(cada cliente) da lista _clientes
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => null,  //retorna nulo se nao encontrar os dados
    );
  }
}