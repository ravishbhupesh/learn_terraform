package br.example.library.app.controller;

import javax.websocket.server.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import br.example.library.app.model.Book;
import br.example.library.app.service.BookServiceImpl;

@RestController
public class BookController {
	
	private Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookServiceImpl bookServiceImpl;
	
	public Book findBookByTitle(@PathParam(value = "title") String title) {
		logger.info("BookController::findBookByTitle START");
		try {
			return bookServiceImpl.findBookByTitle(title);
		} finally {
			logger.info("BookController::findBookByTitle END");
		}
	}
}
