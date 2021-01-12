package com.example.demo.controller;

import com.example.demo.model.GroupQuestionsEntity;
import com.example.demo.service.groupQuestions.IGroupQuestionsService;
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
public class GroupQuestionsController {
	@Autowired
	private IGroupQuestionsService groupQuestionsService;

	@GetMapping("/groupquestions")
	public String index(Model model) {
		model.addAttribute("groupQuestionss", groupQuestionsService.findAll());
		return "listPartStruct";
	}

	@GetMapping("/groupquestions/create")
	public String create(Model model) {
		model.addAttribute("groupQuestions", new GroupQuestionsEntity());
		return "formCRUDPartStruct";
	}

	@GetMapping("/groupquestions/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("groupQuestions", groupQuestionsService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/groupquestions/save")
	public String save(@Valid GroupQuestionsEntity groupQuestions, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
		groupQuestionsService.save(groupQuestions);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/groupquestions";
	}

	@GetMapping("/groupquestions/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		GroupQuestionsEntity emp = groupQuestionsService.findOne(id);
		groupQuestionsService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/groupquestions";
	}

	@GetMapping("/groupquestions/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/groupquestions";
		}

		model.addAttribute("groupQuestionss", groupQuestionsService.search(s));
		return "listPartStruct";
	}
}
