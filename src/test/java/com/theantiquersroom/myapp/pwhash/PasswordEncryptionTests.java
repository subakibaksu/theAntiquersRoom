package com.theantiquersroom.myapp.pwhash;

import static org.junit.Assert.*;
import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor
public class PasswordEncryptionTests {
	
	
	@Test
	public void testPasswordHash() {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		String rawPassword = "antiquersroom";
		String encryptedPassword = encoder.encode(rawPassword);

		assertTrue(encoder.matches(rawPassword, encryptedPassword));
	}
}