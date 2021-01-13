package com.example.demo.dto;

import com.example.demo.model.AnswersEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AnswerDto {
    private UUID id;

    private String answer;

    private boolean chosen;
}
