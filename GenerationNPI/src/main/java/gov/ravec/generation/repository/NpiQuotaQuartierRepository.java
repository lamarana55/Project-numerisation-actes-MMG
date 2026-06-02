package gov.ravec.generation.repository;

import gov.ravec.generation.entity.NpiQuotaQuartier;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

public interface NpiQuotaQuartierRepository extends JpaRepository<NpiQuotaQuartier, Long> {

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT q FROM NpiQuotaQuartier q WHERE q.quartierId = :quartierId AND q.mois = :mois")
    Optional<NpiQuotaQuartier> findByQuartierIdAndMoisForUpdate(
            @Param("quartierId") UUID quartierId,
            @Param("mois") LocalDate mois);

    Optional<NpiQuotaQuartier> findByQuartierIdAndMois(UUID quartierId, LocalDate mois);
}
