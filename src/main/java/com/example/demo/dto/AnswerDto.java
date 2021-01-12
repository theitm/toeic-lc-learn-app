package com.example.demo.dto;

import com.example.demo.model.AnswersEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AnswerDto {
    private AnswersEntity answersEntity;
    private boolean chosen;
}
