package com.gre.entity;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int categoryId;
	private String cat;
	
	
//	@OneToMany(targetEntity=Question.class, cascade=CascadeType.ALL ,mappedBy = "categ")
	@JsonIgnore
    @OneToMany(mappedBy = "categ", cascade = CascadeType.ALL)
	private Set<Questions> questions;
	@JsonIgnore
     @ManyToMany(mappedBy="catSet")
     private Set<ExamSchedule> examSet =new HashSet<>();
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int categoryId, String cat, Set<Questions> questions, Set<ExamSchedule> examSet) {
		super();
		this.categoryId = categoryId;
		this.cat = cat;
		this.questions = questions;
		this.examSet = examSet;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public Set<Questions> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Questions> questions) {
		this.questions = questions;
	}
	public Set<ExamSchedule> getExamSet() {
		return examSet;
	}
	public void setExamSet(Set<ExamSchedule> examSet) {
		this.examSet = examSet;
	}
}
