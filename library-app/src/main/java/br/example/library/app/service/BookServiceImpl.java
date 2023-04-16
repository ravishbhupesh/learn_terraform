package br.example.library.app.service;

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

	public Book findBookByTitle(String title) {
		logger.info("BookServiceImpl::findBookByTitle START");
		try {
			return bookRepository.findByTitle(title);
		} finally {
			logger.info("BookServiceImpl::findBookByTitle END");
		}
	}
}
