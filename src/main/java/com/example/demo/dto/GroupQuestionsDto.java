package com.example.demo.dto;

import com.example.demo.model.MediaEntity;
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
