package br.example.library.app.model;

import javax.persistence.Entity;

@Entity
public class Book {

	private String title;
	private String bookId;
	private String isbn13;
	private String languageId;
	private String numPages;
	private String publicationDate;
	private String publisherId;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getIsbn13() {
		return isbn13;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public String getLanguageId() {
		return languageId;
	}
	public void setLanguageId(String languageId) {
		this.languageId = languageId;
	}
	public String getNumPages() {
		return numPages;
	}
	public void setNumPages(String numPages) {
		this.numPages = numPages;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	public String getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}
	
	public String toString() {
		return "Book : {"
				+ "title : " + this.title + ","
				+ "	bookId : " + this.bookId + ","
				+ "	isbn13 : " + this.isbn13 + ","
				+ "	languageId : " + this.languageId + ","
				+ "	numPages : " + this.numPages + ","
				+ "	publicationDate" + this.publicationDate + ","
				+ "	publisherId : " + this.publisherId + ","
				+ "}";
	}
}
