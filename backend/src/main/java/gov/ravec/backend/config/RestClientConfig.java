package gov.ravec.backend.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {

    @Value("${npi.service.base-url:http://generation-npi:8092/api/v1}")
    private String npiBaseUrl;

    @Value("${nimbasms.base-url:https://api.nimbasms.com/v1}")
    private String nimbaSmsBaseUrl;

    @Bean("npiRestClient")
    public RestClient npiRestClient() {
        return RestClient.builder()
                .baseUrl(npiBaseUrl)
                .build();
    }

    /** Client HTTP pour l'API NimbaSMS (envoi de SMS). */
    @Bean("nimbaSmsRestClient")
    public RestClient nimbaSmsRestClient() {
        return RestClient.builder()
                .baseUrl(nimbaSmsBaseUrl)
                .build();
    }
}
