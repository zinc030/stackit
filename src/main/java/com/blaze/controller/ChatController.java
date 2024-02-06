package com.blaze.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.blaze.entity.Message;
import com.blaze.entity.User;
import com.blaze.persistence.MessageRepository;
import com.blaze.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ChatController {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserService userService;

    private final RestTemplate restTemplate;

    public ChatController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping("/chat")
    public String chat(Model model, Principal principal) {
        List<Message> chatHistory = messageRepository.findByUserIdOrderByTimestampAsc(principal.getName());
        model.addAttribute("chatHistory", chatHistory);
        model.addAttribute("message", new Message());
        return "chat"; // This should be the name of your Thymeleaf template
    }

    @PostMapping("/chat")
    public String sendMessage(@ModelAttribute Message message, Model model, Principal principal) {
        User currentUser = userService.findUserByUsername(principal.getName());
        String username = currentUser.getUsername();

        // Save the user's message
        message.setBot(false);
        message.setUserId(username);
        messageRepository.save(message);

        // Prepare the request for the Flask server
        String url = "http://localhost:5000/test";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        Map<String, String> map = new HashMap<>();
        map.put("message", message.getContent());
        HttpEntity<Map<String, String>> request = new HttpEntity<>(map, headers);

        // Send the request and get the response
        String responseContent = restTemplate.postForObject(url, request, String.class);

        // Save the bot's response
        Message response = new Message();
        response.setUserId(username);
        response.setContent(responseContent);
        response.setBot(true);
        messageRepository.save(response);

        model.addAttribute("response", responseContent);

        return "redirect:/chat";
    }
}