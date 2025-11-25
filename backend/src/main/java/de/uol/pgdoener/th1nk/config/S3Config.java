package de.uol.pgdoener.th1nk.config;

import de.uol.pgdoener.th1nk.autoconfigure.ObjectStorageProperties;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
@ConditionalOnProperty(value = "th1.objectstorage.type", havingValue = "s3")
public class S3Config {

    private final ObjectStorageProperties osProperties;

//    @Bean
//    public MinioClient minioClient() {
//        return MinioClient.builder()
//                .endpoint(osProperties.getS3().getUrl())
//                .credentials(osProperties.getS3().getAccessKey(), osProperties.getS3().getSecretKey())
//                .region(osProperties.getS3().getRegion())
//                .build();
//    }
}
