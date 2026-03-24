package org.techhub.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class PredictionController {

    @PostMapping("/predictPrice")
    public Map<String, Object> predict(@RequestBody Map<String, Object> input) {

        Map<String, Object> result = new HashMap<>();

        try {
            URL url = new URL("http://127.0.0.1:5000/predict");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            // ✅ Create JSON request
            String jsonInput = "{"
                    + "\"bedrooms\":" + input.get("bedrooms") + ","
                    + "\"bathrooms\":" + input.get("bathrooms") + ","
                    + "\"area\":" + input.get("area") + ","
                    + "\"city_id\":" + input.get("city_id") + ","
                    + "\"property_type\":\"" + input.get("property_type") + "\""
                    + "}";

            // Send request
            OutputStream os = conn.getOutputStream();
            os.write(jsonInput.getBytes("utf-8"));
            os.flush();

            // ✅ Read FULL response
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "utf-8"));

            StringBuilder responseBuilder = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
                responseBuilder.append(line.trim());
            }

            String response = responseBuilder.toString();

            // 🔥 Debug (you can remove later)
            System.out.println("Flask Response: " + response);

            // ✅ Parse JSON properly
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> flaskResponse = mapper.readValue(response, Map.class);

            Object price = flaskResponse.get("predicted_price");

            // ✅ Safe handling
            if (price != null) {
                result.put("predicted_price", price);
            } else {
                result.put("predicted_price", "0");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("predicted_price", "Error");
        }

        return result;
    }
}