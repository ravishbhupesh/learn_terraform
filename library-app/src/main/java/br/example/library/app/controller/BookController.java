package br.example.library.app.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import br.example.library.app.model.Book;
import br.example.library.app.service.BookServiceImpl;

@RestController
public class BookController {
	
	private Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookServiceImpl bookServiceImpl;
	
	@GetMapping("/books")
	public List<Book> getAllBooks() {
		logger.info("BookController::getAllBooks START");
		try {
			return bookServiceImpl.findAllBooks();
		} finally {
			logger.info("BookController::getAllBooks END");
		}
	}
	
	@GetMapping("/book/{title}")
	public Book getBookByTitle(@PathVariable String title) {
		logger.info("BookController::findBookByTitle START");
		try {
			return bookServiceImpl.findBookByTitle(title);
		} finally {
			logger.info("BookController::findBookByTitle END");
		}
	}
}
