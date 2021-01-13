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
public class MediaDto {
    private String imgUrl;
    private String audioUrl;

}
