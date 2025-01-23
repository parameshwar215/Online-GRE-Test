package com.gre.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;


@Entity
public class Questions {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int questionId;
	private String question;
	private  float negativeMarks;
	private String a;
	private String b;
	private String c;
	private String d;
	private String answer;
	private String categoryName;
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name="cat_id",nullable=true)
	private Category categ;
	public Questions() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Questions(int questionId, String question, float negativeMarks, String a, String b, String c, String d,
			String answer, String categoryName, Category categ) {
		super();
		this.questionId = questionId;
		this.question = question;
		this.negativeMarks = negativeMarks;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.answer = answer;
		this.categoryName = categoryName;
		this.categ = categ;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public float getNegativeMarks() {
		return negativeMarks;
	}

	public void setNegativeMarks(float negativeMarks) {
		this.negativeMarks = negativeMarks;
	}
	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category getCateg() {
		return categ;
	}

	public void setCateg(Category categ) {
		this.categ = categ;
	}

}
