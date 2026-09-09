package vn.iotstar.util;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.Duration;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImgBBUtil {

    private static final String UPLOAD_URL = "https://api.imgbb.com/1/upload";
    private static final Pattern URL_PATTERN = Pattern.compile("\"url\"\\s*:\\s*\"([^\"]+)\"");
    private static final Duration CONNECT_TIMEOUT = Duration.ofSeconds(20);
    private static final Duration REQUEST_TIMEOUT = Duration.ofSeconds(90);

    public static String upload(File file) throws IOException, InterruptedException {
        byte[] fileBytes = Files.readAllBytes(file.toPath());
        String base64Image = Base64.getEncoder().encodeToString(fileBytes);
        String form = "key=" + urlEncode(Constant.IMGBB_API_KEY) + "&image=" + urlEncode(base64Image);

        HttpClient client = HttpClient.newBuilder()
                .connectTimeout(CONNECT_TIMEOUT)
                .build();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(UPLOAD_URL))
                .timeout(REQUEST_TIMEOUT)
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(BodyPublishers.ofString(form))
                .build();

        HttpResponse<String> response;
        try {
            response = client.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (java.net.http.HttpTimeoutException e) {
            throw new IOException("Upload ImgBB quá thời gian chờ (" + REQUEST_TIMEOUT.getSeconds() + "s)", e);
        }

        String body = response.body();
        if (response.statusCode() != 200) {
            throw new IOException("Upload ImgBB thất bại (HTTP " + response.statusCode() + "): " + body);
        }
        return extractUrl(body);
    }

    private static String urlEncode(String s) {
        return URLEncoder.encode(s, StandardCharsets.UTF_8);
    }

    private static String extractUrl(String json) {
        Matcher m = URL_PATTERN.matcher(json);
        if (m.find()) {
            return m.group(1).replace("\\/", "/");
        }
        throw new RuntimeException("Không tìm thấy URL ảnh trong phản hồi ImgBB: " + json);
    }

    public static boolean isConfigured() {
        return Constant.IMGBB_API_KEY != null
                && !Constant.IMGBB_API_KEY.isEmpty()
                && !"your-imgbb-api-key".equals(Constant.IMGBB_API_KEY);
    }
}
