package br.example.library.app.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.example.library.app.model.Book;
import br.example.library.app.repository.BookRepository;

@Service
public class BookServiceImpl {

	private Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);

	@Autowired
	private BookRepository bookRepository;
	
	public List<Book> findAllBooks() {
		logger.info("BookServiceImpl::findAllBooks START");
		try {
			return bookRepository.findAll();
		} finally {
			logger.info("BookServiceImpl::findAllBooks END");
		}
	}

	public Book findBookByTitle(String title) {
		logger.info("BookServiceImpl::findBookByTitle START");
		try {
			return bookRepository.findByTitle(title);
		} finally {
			logger.info("BookServiceImpl::findBookByTitle END");
		}
	}
}
