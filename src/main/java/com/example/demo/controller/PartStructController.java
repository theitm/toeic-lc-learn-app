package com.example.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.PartStructEntity;
import com.example.demo.service.IPartStructService;

import java.util.UUID;

@Controller
public class PartStructController {
	@Autowired
	private IPartStructService IPartStructService;

	@GetMapping("/partStruct")
	public String index(Model model) {
		model.addAttribute("partStructs", IPartStructService.findAll());
		return "list";
	}

	@GetMapping("/partStruct/create")
	public String create(Model model) {
		model.addAttribute("partStruct", new PartStructEntity());
		return "form";
	}

	@GetMapping("/partStruct/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("partStruct", IPartStructService.findOne(id));
		return "form";
	}

	@PostMapping("/partStruct/save")
	public String save(@Valid PartStructEntity partStruct, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "form";
		}
		IPartStructService.save(partStruct);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/partStruct";
	}

	@GetMapping("/partStruct/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		PartStructEntity emp = IPartStructService.findOne(id);
		IPartStructService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/partStruct";
	}

	@GetMapping("/partStruct/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/partStruct";
		}

		model.addAttribute("partStructs", IPartStructService.search(s));
		return "list";
	}
}
