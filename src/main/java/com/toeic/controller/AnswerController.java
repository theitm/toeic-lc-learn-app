package com.toeic.controller;

import com.toeic.entity.AnswersEntity;
import com.toeic.service.answers.IAnswersService;
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
public class AnswerController {
	@Autowired
	private IAnswersService answersService;

	@GetMapping("/answers")
	public String index(Model model) {
		model.addAttribute("answerss", answersService.findAll());
		return "listPartStruct";
	}

	@GetMapping("/answers/create")
	public String create(Model model) {
		model.addAttribute("answers", new AnswersEntity());
		return "formCRUDPartStruct";
	}

	@GetMapping("/answers/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("answers", answersService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/answers/save")
	public String save(@Valid AnswersEntity answers, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
		answersService.save(answers);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/answers";
	}

	@GetMapping("/answers/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		AnswersEntity emp = answersService.findOne(id);
		answersService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/answers";
	}

	@GetMapping("/answers/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/answers";
		}

		model.addAttribute("answerss", answersService.search(s));
		return "listPartStruct";
	}
}
