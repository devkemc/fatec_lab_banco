SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_LAB"."UPSET_TURNOS"(
    t_nome VARCHAR2,
    id_turno OUT INTEGER
) AS    v_count integer;
BEGIN
    IF t_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM turnos_curso WHERE trn_nome = t_nome;
        IF v_count = 0 THEN
            INSERT INTO turnos_curso (trn_nome) VALUES (t_nome)
            RETURNING trn_id INTO id_turno;
        ELSE
            SELECT trn_id INTO id_turno FROM turnos_curso WHERE trn_nome = t_nome;
            END IF;
    END IF;
END UPSET_TURNOS;