package org.springframework.samples.petclinic.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {

	@Autowired
	private PlayerService playerService;
	
	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	public User getUser(){
		
		return (User) getAuthentication().getPrincipal();
	}
	
	public Player getPlayer() {
		return playerService.getPlayerByUsernameGood(getUser().getUsername());	
	}
	
}