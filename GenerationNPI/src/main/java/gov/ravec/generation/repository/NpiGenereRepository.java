package gov.ravec.generation.repository;

import gov.ravec.generation.entity.NpiGenere;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface NpiGenereRepository extends JpaRepository<NpiGenere, UUID> {

    boolean existsByNpi(String npi);

    Optional<NpiGenere> findByNpi(String npi);
}
