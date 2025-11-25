package de.uol.pgdoener.th1nk.domain.converterchain.exception;

import lombok.Getter;

@Getter
public class ConverterException extends RuntimeException {

    private final int converterIndex;

    public ConverterException(int converterIndex, String message) {
        super(message);
        this.converterIndex = converterIndex;
    }

}
