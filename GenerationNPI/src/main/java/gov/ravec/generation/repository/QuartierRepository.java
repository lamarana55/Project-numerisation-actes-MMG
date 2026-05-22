package gov.ravec.generation.repository;

import gov.ravec.generation.entity.Quartier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;
import java.util.UUID;

public interface QuartierRepository extends JpaRepository<Quartier, UUID> {

    @Query("SELECT q FROM Quartier q JOIN FETCH q.commune c JOIN FETCH c.prefecture p JOIN FETCH p.region WHERE q.id = :id")
    Optional<Quartier> findByIdWithHierarchy(@Param("id") UUID id);
}
