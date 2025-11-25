package de.uol.pgdoener.th1nk.application.mapper;

import de.uol.pgdoener.th1nk.application.dto.FeedbackDto;
import de.uol.pgdoener.th1nk.infastructure.persistence.entity.Feedback;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class FeedbackMapper {

    public static Feedback toEntity(FeedbackDto dto) {
        return new Feedback(
                null,
                dto.getContent()
        );
    }

}
