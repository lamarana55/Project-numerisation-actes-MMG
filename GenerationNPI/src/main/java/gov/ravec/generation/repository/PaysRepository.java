package gov.ravec.generation.repository;

import gov.ravec.generation.entity.Pays;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface PaysRepository extends JpaRepository<Pays, UUID> {

    Optional<Pays> findByCode(String code);
}
