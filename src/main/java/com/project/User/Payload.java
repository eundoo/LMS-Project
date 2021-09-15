package com.project.User;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Payload {

	String title;
	String message;
	Object data;
	
	@Builder
	public Payload(String title, String message, Object data) {
		super();
		this.title = title;
		this.message = message;
		this.data = data;
	}
}
