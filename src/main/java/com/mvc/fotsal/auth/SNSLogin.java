package com.mvc.fotsal.auth;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	
	public SNSLogin(SNS sns) {
		this.oauthService = new ServiceBuilder()
				.apiKey(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
	}
		

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
}
