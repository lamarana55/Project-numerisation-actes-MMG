package gov.ravec.backend.repositories;

import gov.ravec.backend.entities.ActeMariage;
import gov.ravec.backend.utils.Delete;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
public interface ActeMariageRepository extends JpaRepository<ActeMariage, String> {

    @Query("""
        SELECT a FROM ActeMariage a
        LEFT JOIN a.epoux ex
        LEFT JOIN a.epouse se
        LEFT JOIN a.commune c
        WHERE a.isDeleted = :deleted
          AND (CAST(:nom        AS string) IS NULL OR LOWER(ex.nom) LIKE LOWER(CONCAT('%', CAST(:nom AS string), '%'))
               OR LOWER(se.nom) LIKE LOWER(CONCAT('%', CAST(:nom AS string), '%')))
          AND (CAST(:prenom     AS string) IS NULL OR LOWER(ex.prenom) LIKE LOWER(CONCAT('%', CAST(:prenom AS string), '%'))
               OR LOWER(se.prenom) LIKE LOWER(CONCAT('%', CAST(:prenom AS string), '%')))
          AND (CAST(:numeroActe AS string) IS NULL OR a.numeroActe = CAST(:numeroActe AS string))
          AND (:dateDebut IS NULL OR a.dateMariage >= :dateDebut)
          AND (:dateFin   IS NULL OR a.dateMariage <= :dateFin)
        ORDER BY a.createdAt DESC
        """)
    Page<ActeMariage> search(
            @Param("nom")        String nom,
            @Param("prenom")     String prenom,
            @Param("numeroActe") String numeroActe,
            @Param("dateDebut")  LocalDate dateDebut,
            @Param("dateFin")    LocalDate dateFin,
            @Param("deleted")    Delete deleted,
            Pageable pageable
    );
}
