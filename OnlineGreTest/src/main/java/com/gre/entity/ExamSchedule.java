package com.gre.entity;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
@Entity
public class ExamSchedule {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int examId;
	private String examName;
	
	
	private int fee;
	private String dateOfExam;
	private String examLocation;
	
	@ManyToMany
	@JoinTable(name="exam_syllabus",
	joinColumns=@JoinColumn(name="eaxm_id"),
	inverseJoinColumns=@JoinColumn(name="cat_id"))
	private Set<Category> catSet=new HashSet<>();
	public ExamSchedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamSchedule(int examId, String examName, int fee, String dateOfExam, String examLocation,
			Set<Category> catSet) {
		super();
		this.examId = examId;
		this.examName = examName;
		this.fee = fee;
		this.dateOfExam = dateOfExam;
		this.examLocation = examLocation;
		this.catSet = catSet;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getDateOfExam() {
		return dateOfExam;
	}
	public void setDateOfExam(String dateOfExam) {
		this.dateOfExam = dateOfExam;
	}
	public String getExamLocation() {
		return examLocation;
	}
	public void setExamLocation(String examLocation) {
		this.examLocation = examLocation;
	}
	public Set<Category> getCatSet() {
		return catSet;
	}
	public void setCatSet(Set<Category> catSet) {
		this.catSet = catSet;
	}
	
	
	
	
	

}
