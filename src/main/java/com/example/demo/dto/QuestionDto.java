package com.example.demo.dto;

import com.example.demo.model.QuestionsEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QuestionDto {
    private int index;
    private QuestionsEntity questionsEntity;
    private List<AnswerDto> answerDtos;
}
