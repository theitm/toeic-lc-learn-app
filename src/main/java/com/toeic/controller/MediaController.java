package com.toeic.controller;

import com.toeic.entity.MediaEntity;
import com.toeic.service.media.IMediaService;
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
public class MediaController {
	@Autowired
	private IMediaService mediaService;

	@GetMapping("/media")
	public String index(Model model) {
		model.addAttribute("medias", mediaService.findAll());
		return "listPartStruct";
	}

	@GetMapping("/media/create")
	public String create(Model model) {
		model.addAttribute("media", new MediaEntity());
		return "formCRUDPartStruct";
	}

	@GetMapping("/media/{id}/edit")
	public String edit(@PathVariable UUID id, Model model) {
		model.addAttribute("media", mediaService.findOne(id));
		return "formCRUDPartStruct";
	}

	@PostMapping("/media/save")
	public String save(@Valid MediaEntity media, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return "formCRUDPartStruct";
		}
		mediaService.save(media);
		redirect.addFlashAttribute("success", "Lưu cấu trúc câu hỏi thành công!");
		return "redirect:/media";
	}

	@GetMapping("/media/{id}/delete")
	public String delete(@PathVariable UUID id, RedirectAttributes redirect) {
		MediaEntity emp = mediaService.findOne(id);
		mediaService.delete(emp);
		redirect.addFlashAttribute("success", "Đã xóa cấu trúc câu hỏi!");
		return "redirect:/media";
	}

	@GetMapping("/media/search")
	public String search(@RequestParam("s") String s, Model model) {
		if (s.equals("")) {
			return "redirect:/media";
		}

		model.addAttribute("medias", mediaService.search(s));
		return "listPartStruct";
	}
}
