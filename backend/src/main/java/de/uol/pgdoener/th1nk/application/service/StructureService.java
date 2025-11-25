package de.uol.pgdoener.th1nk.application.service;

import de.uol.pgdoener.th1nk.application.dto.StructureDto;
import de.uol.pgdoener.th1nk.application.mapper.StructureMapper;
import de.uol.pgdoener.th1nk.infastructure.persistence.entity.Structure;
import de.uol.pgdoener.th1nk.infastructure.persistence.repository.StructureRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StructureService {
    private final StructureRepository structureRepository;

    public void createStructures(List<StructureDto> structures, Long structureId) {
        List<Structure> structureList = StructureMapper.toEntity(structures, structureId);
        structureRepository.saveAll(structureList);
    }
}
