package com.toeic.controller;

import com.toeic.entity.QuestionsEntity;
import com.toeic.service.questions.IQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.UUID;

@Controller
public class QuestionsController {
	@Autowired
	private IQuestionsService questionsService;

	@GetMapping("/questions")
	public String index(Model model) {
//		model.addAttribute("questionss", questionsService.findAll());
		return "multichoice";
	}

	@GetMapping("/questions/create")
	public String create(Model model) {
		model.addAttribute("questions", new QuestionsEntity());
		return "formCRUDPartStruct";
	}

	@GetMapping("/questions/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("questions", questionsService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/questions/save")
	public String save(@Valid QuestionsEntity questions, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
		questionsService.save(questions);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/questions";
	}

	@GetMapping("/questions/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		QuestionsEntity emp = questionsService.findOne(id);
		questionsService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/questions";
	}

	@GetMapping("/questions/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/questions";
		}

		model.addAttribute("questionss", questionsService.search(s));
		return "listPartStruct";
	}
}
