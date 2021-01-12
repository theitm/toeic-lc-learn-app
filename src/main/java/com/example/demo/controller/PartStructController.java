package com.example.demo.controller;

import com.example.demo.model.PartStructEntity;
import com.example.demo.service.partStruct.IPartStructService;
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
public class PartStructController {
	@Autowired
	private IPartStructService partStructService;
	// Đón nhận request GET
	@GetMapping("/") // Nếu người dùng request tới địa chỉ "/"
	public String index() {
		return "index"; // Trả về file index.html
	}

	@GetMapping("/partstruct")
	public String listPartStruct(Model model) {
		model.addAttribute("partStructs", partStructService.findAll());
		return "listPartStruct";
	}

	@GetMapping("/partstruct/structQuestions")
	public String index(Model model) {
		model.addAttribute("partStructs", partStructService.findAll());
		return "structQuestions";
	}

	@GetMapping("/partstruct/create")
	public String create(Model model) {
		model.addAttribute("partStruct", new PartStructEntity());
		return "formCRUDPartStruct";
	}

	@GetMapping("/partstruct/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("partStruct", partStructService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/partstruct/save")
	public String save(@Valid PartStructEntity partStruct, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
		partStructService.save(partStruct);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/partstruct";
	}

	@GetMapping("/partstruct/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		PartStructEntity emp = partStructService.findOne(id);
		partStructService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/partstruct";
	}

	@GetMapping("/partstruct/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/partstruct";
		}

		model.addAttribute("partStructs", partStructService.search(s));
		return "listPartStruct";
	}
}
