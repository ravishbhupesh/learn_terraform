package br.example.library.app.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "book")
public class Book {

	private String title;
	private Long bookId;
	private String isbn13;
	private Long languageId;
	private int numPages;
	private Date publicationDate;
	private Long publisherId;
	
	public String toString() {
		return "Book : {"
				+ "\t title : " + this.title + ",\n"
				+ "\t bookId : " + this.bookId + ",\n"
				+ "\t isbn13 : " + this.isbn13 + ",\n"
				+ "\t languageId : " + this.languageId + ",\n"
				+ "\t numPages : " + this.numPages + ",\n"
				+ "\t publicationDate" + this.publicationDate + ",\n"
				+ "\t publisherId : " + this.publisherId + ",\n"
				+ "}";
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "book_id")
	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	@Column(name = "isbn13")
	public String getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}

	@Column(name = "language_id")
	public Long getLanguageId() {
		return languageId;
	}

	public void setLanguageId(Long languageId) {
		this.languageId = languageId;
	}

	@Column(name = "num_pages")
	public int getNumPages() {
		return numPages;
	}

	public void setNumPages(int numPages) {
		this.numPages = numPages;
	}

	@Column(name = "publication_date")
	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	@Column(name = "publisher_id")
	public Long getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Long publisherId) {
		this.publisherId = publisherId;
	}
}
