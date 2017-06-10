package com.iothome.main.socket;

import java.net.URI;
import java.net.URISyntaxException;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;
import org.json.JSONObject;

public class CommonWebSocket {
	private WebSocketClient client;
	private String uri;
	private String key;

	
	public CommonWebSocket(String key) {
		// TODO Auto-generated constructor stub
		this.key = key;
	}

	public void connectWebSocket() {
		uri = "ws://121.187.77.11:8080";
		try {
			client = new WebSocketClient(new URI(uri)) {

				@Override
				public void onClose(int code, String reason, boolean remote) {
					// TODO Auto-generated method stub
					System.out.println("A client disconnected..");
				}

				@Override
				public void onError(Exception e) {
					// TODO Auto-generated method stub
					System.out.println("A client Error");
				}

				@Override
				public void onMessage(String messeage) {
					// TODO Auto-generated method stub
				}

				@Override
				public void onOpen(ServerHandshake arg0) {
					// TODO Auto-generated method stub
					System.out.println("A client connected..");
					System.out.println(key);
					this.send(key);
				}

			};
			client.connect();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
