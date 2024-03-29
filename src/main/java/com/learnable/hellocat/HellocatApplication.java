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

	@GetMapping("/test")
	public String test() {
		return String.format("test");
	}
	
	@GetMapping("/user")
	public String user() {
		return String.format("user");
	}
	
	@GetMapping("/metrics")
	public String metrics() {
		return String.format("metrics");
	}

		
	@GetMapping("/auth")
	public String auth() {
		return String.format("auth");
	}

	@GetMapping("/cat")
	public String cat() {
		return String.format("cat");
	}

	public static void main(String[] args) {
		SpringApplication.run(HellocatApplication.class, args);
	}

}
