package com.toeic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class GroupQuestionsDto {
	private List<QuestionDto> questions;
	private MediaDto media;
}
