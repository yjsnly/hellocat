package com.learnable.hellocat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HellocatApplication {

	@GetMapping("/health")
	public String health() {
		return String.format("ok");
	}

	@GetMapping("/hello")
	public String hello() {
		return String.format("world");
	}

	public static void main(String[] args) {
		SpringApplication.run(HellocatApplication.class, args);
	}

}
