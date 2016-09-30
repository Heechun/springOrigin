package com.tyn.origin.main.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

@Service
public class LoginServiceImpl implements LoginService {
	@Override
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	@Override
	public HashMap<String, String> makeNaverRequestStatement(String naverClientId) {
		String redirectUri = "http://127.0.0.1:8888/origin/naverRequestKey.do";
		String state = generateState();
		String url = "https://nid.naver.com/oauth2.0/authorize?"
				+ "response_type=code&client_id=" + naverClientId
				+ "&redirect_uri=" + redirectUri + "&state=" + state;

		HashMap<String, String> naverUrl = new HashMap<String, String>();
		naverUrl.put("state", state);
		naverUrl.put("url", url);
		return naverUrl;
	}

	@Override
	public HashMap<String, String> getNaverRequestKey(String state,	String code, String naverClientId, String naverClientSecret) {
		String naverUrl = "https://nid.naver.com/oauth2.0/token?client_id="
				+ naverClientId + "&client_secret=" + naverClientSecret
				+ "&grant_type=authorization_code" + "&state=" + state
				+ "&code=" + code;
		String naverJsonKey = "";// null로 하니까 null이 json에 포함이 됨.
		HashMap<String, String> result = new HashMap<String, String>();

		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(naverUrl).openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			String input;
			while ((input = reader.readLine()) != null) {
				naverJsonKey += input;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(naverJsonKey);
			result.put("access_token", (String) jsonObject.get("access_token"));
			result.put("refresh_token",
					(String) jsonObject.get("refresh_token"));
			result.put("token_type", (String) jsonObject.get("token_type"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public HashMap<String, String> naverRequestUserInfo(String token_type,
			String access_token) {
		String url = "https://apis.naver.com/nidlogin/nid/getUserProfile.xml";
		String naverResult = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url)
					.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", token_type + " "
					+ access_token);
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "UTF-8"));
			String input;
			while ((input = reader.readLine()) != null) {
				naverResult += input;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		HashMap<String, String> result = new HashMap<String, String>();

		try {
			InputSource is = new InputSource(new StringReader(naverResult));
			Document xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
			XPath xpath = XPathFactory.newInstance().newXPath();
			Node email = (Node) xpath.evaluate("//data/response/email", xml,
					XPathConstants.NODE);
			Node nickname = (Node) xpath.evaluate("//data/response/nickname",
					xml, XPathConstants.NODE);
			Node profile_image = (Node) xpath.evaluate(
					"//data/response/profile_image", xml, XPathConstants.NODE);
			Node age = (Node) xpath.evaluate("//data/response/age", xml,
					XPathConstants.NODE);
			Node gender = (Node) xpath.evaluate("//data/response/gender", xml,
					XPathConstants.NODE);
			Node id = (Node) xpath.evaluate("//data/response/id", xml,
					XPathConstants.NODE);
			Node birthday = (Node) xpath.evaluate("//data/response/birthday",
					xml, XPathConstants.NODE);
			result.put("email", email.getTextContent());
			result.put("nickname", nickname.getTextContent());
			result.put("profile_image", profile_image.getTextContent());
			result.put("age", age.getTextContent());
			result.put("gender", gender.getTextContent());
			result.put("id", id.getTextContent());
			result.put("birthday", birthday.getTextContent());

		} catch (SAXException | IOException | ParserConfigurationException
				| XPathExpressionException e) {
			e.printStackTrace();
		}
		return result;
	}
}
