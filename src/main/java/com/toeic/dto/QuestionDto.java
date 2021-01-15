package com.toeic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Type;

import java.util.List;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class QuestionDto {
    @Type(type="uuid-char")
    private UUID id;

    private String title;

    private List<AnswerDto> answers;
}
