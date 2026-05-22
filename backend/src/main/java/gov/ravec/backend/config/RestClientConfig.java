package gov.ravec.backend.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {

    @Value("${npi.service.base-url:http://generation-npi:8092/api/v1}")
    private String npiBaseUrl;

    @Bean("npiRestClient")
    public RestClient npiRestClient() {
        return RestClient.builder()
                .baseUrl(npiBaseUrl)
                .build();
    }
}
