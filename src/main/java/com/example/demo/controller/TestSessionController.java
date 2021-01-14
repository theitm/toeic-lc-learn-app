package com.example.demo.controller;

import com.example.demo.dto.GroupQuestionsDto;
import com.example.demo.model.TestSessionEntity;
import com.example.demo.service.testSession.ITestSessionService;
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
public class TestSessionController {
	@Autowired
	private ITestSessionService testSessionService;

	@GetMapping("/testsession/{id}/generate")
	public String generate(@PathVariable UUID id, Model model) {
		model.addAttribute("groupQuestions", testSessionService.generateTestSession(id));
		return "multichoice";
	}

	@GetMapping("/testsession/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("testSession", testSessionService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/testsession/save")
	public String save(@Valid GroupQuestionsDto groupQuestionsDto, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
//		testSessionService.save(groupQuestionsDto);
		redirect.addFlashAttribute("groupQuestions", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/testsession";
	}

	@GetMapping("/testsession/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		TestSessionEntity emp = testSessionService.findOne(id);
		testSessionService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/testsession";
	}

	@GetMapping("/testsession/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/testsession";
		}

		model.addAttribute("testSessions", testSessionService.search(s));
		return "listPartStruct";
	}
}
