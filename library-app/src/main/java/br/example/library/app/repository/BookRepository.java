package br.example.library.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.example.library.app.model.Book;

public interface BookRepository extends JpaRepository<Book, Long> {

	Book findByTitle(String title);
}
