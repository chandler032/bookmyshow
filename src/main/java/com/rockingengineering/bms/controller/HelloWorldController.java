package com.rockingengineering.bms.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j2
@RestController
@RequestMapping("hello")
public class HelloWorldController {

    @GetMapping("/get")
    public ResponseEntity<String> getUser() {

        log.info("Hello World request came in");

        return ResponseEntity.ok("Hello world");
    }
}