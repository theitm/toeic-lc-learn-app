package com.example.demo.service.testSession;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.GroupQuestionsDto;
import com.example.demo.dto.QuestionDto;
import com.example.demo.model.*;
import com.example.demo.repository.TestSessionRepository;
import com.example.demo.service.answers.IAnswersService;
import com.example.demo.service.groupQuestions.IGroupQuestionsService;
import com.example.demo.service.media.IMediaService;
import com.example.demo.service.partStruct.IPartStructService;
import com.example.demo.service.questions.IQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TestSessionService implements ITestSessionService {
	@Autowired
    private TestSessionRepository testSessionRepository;

	private final IGroupQuestionsService groupQuestionsService;
	private final IPartStructService partStructService;
	private final IQuestionsService questionsService;
	private final IMediaService mediaService;
	private final IAnswersService answersService;

    public TestSessionService(IGroupQuestionsService groupQuestionsService, IPartStructService partStructService,
                              IQuestionsService questionsService, IMediaService mediaService,
                              IAnswersService answersService) {
        this.groupQuestionsService = groupQuestionsService;
        this.partStructService = partStructService;
        this.questionsService = questionsService;
        this.mediaService = mediaService;
        this.answersService = answersService;
    }

    @Override
    public Iterable<TestSessionEntity> findAll() {
        return testSessionRepository.findAll();
    }

    @Override
    public List<TestSessionEntity> search(String q) {
//        return TestSessionRepository.findByPartContaining(q);
        return null;
    }

    @Override
    public TestSessionEntity findOne(UUID id) {
        return testSessionRepository.findById(id).orElse(null);
    }

    @Override
    public void save(TestSessionEntity contact) {
    	testSessionRepository.save(contact);
    }

    @Override
    public void delete(TestSessionEntity emp) {
    	testSessionRepository.delete(emp);
    }

    public List<GroupQuestionsDto> generateTestSession(UUID partStuctId) {
        List<GroupQuestionsDto> groupQuestionsDtos = new ArrayList<>();
        String session = String.valueOf(new Date().getTime());
        //Lấy danh sách nhưng nhóm câu hỏi của phần này
        List<GroupQuestionsEntity> groupQuestionsOfThisPart = groupQuestionsService.getAllByPartId(partStuctId);

        //Tính số nhóm câu hỏi cần có
        //Lấy số câu hỏi cần cho part này
        PartStructEntity partStructEntity = partStructService.findOne(partStuctId);
        int numOfQuestions = partStructEntity.getNumOfQuestions();
        /*Tính số nhóm câu hỏi cần có
        * Part 1, 2 (1 câu/nhóm)
        * Part 3, 4 (3 câu/nhóm)
        * */
        int neededGroup = numOfQuestions;
        if(partStructEntity.getPart() == 3 || partStructEntity.getPart() == 4) {
            neededGroup = numOfQuestions/3;
        }
        //Xáo trộn bộ câu hỏi
        Collections.shuffle(groupQuestionsOfThisPart);
        //Lấy ra list con các câu hỏi cần có
        if(groupQuestionsOfThisPart.size() > neededGroup) {
            groupQuestionsOfThisPart = groupQuestionsOfThisPart.subList(0, neededGroup);
        }
        //Tạo list test
        for(GroupQuestionsEntity groupQuestionsEntity : groupQuestionsOfThisPart) {
            UUID groupQuestionId = groupQuestionsEntity.getId();
            //Get danh sách các câu hỏi của nhóm
            List<QuestionsEntity> questionsEntities = questionsService.getAllByGroupQuestionsId(groupQuestionId);
            //Get danh sách media của nhóm
            List<MediaEntity> mediaEntities = mediaService.getAllByGroupQuestionsId(groupQuestionId);
            //Tạo danh sách câu hỏi
            List<QuestionDto> questions = new ArrayList<>();
            int index = 1;
            for (QuestionsEntity questionsEntity : questionsEntities) {
                //Lấy danh sách câu trả lời
                List<AnswerDto> answerDtos = new ArrayList<>();
                List<AnswersEntity> answersEntityList = answersService.getAllByQuestionsId(questionsEntity.getId());
                for(AnswersEntity answersEntity : answersEntityList) {
                    answerDtos.add(AnswerDto.builder().answersEntity(answersEntity).build());
                }
                QuestionDto questionDto = new QuestionDto();
                questionDto.setQuestionsEntity(questionsEntity);
                questionDto.setIndex(index);
                questionDto.setAnswerDtos(answerDtos);
                questions.add(questionDto);
                index++;
            }
            //Thêm nhóm câu hỏi vào mảng trả về
            groupQuestionsDtos.add(GroupQuestionsDto.builder().questionDtos(questions).media(mediaEntities).build());

        }
        return groupQuestionsDtos;

    }
}	
