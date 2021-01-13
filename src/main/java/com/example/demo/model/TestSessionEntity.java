package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
@Table(name = "test_session")
public class TestSessionEntity {

	@Id
	@GeneratedValue(generator = "uuid2", strategy = GenerationType.IDENTITY)
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(columnDefinition = "CHAR(36)")
	@Type(type="uuid-char")
	private UUID id;

	private String sessions;

	@Type(type="uuid-char")
	private UUID questionId;

//	@ManyToOne
//	@JoinColumn(name = "questionId", insertable=false, updatable=false)
//	private QuestionsEntity questionsEntity;

	private String labelChosen;

	private boolean result;

//	private String fullName;

	private int stt;
}
