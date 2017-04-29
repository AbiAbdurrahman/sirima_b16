CREATE OR REPLACE FUNCTION UpdateJumlahDiterima()
RETURNS trigger AS
$$
	BEGIN
	IF(new.status_lulus <> old.status_lulus && new.status_lulus = TRUE)THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_diterima = jumlah_diterima +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENDAFTARAN P
		SET status_lulus = TRUE
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		RETURN new;
	ELSIF(new.status_lulus <> old.status_lulus && new.status_lulus = FALSE)THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_diterima = jumlah_diterima -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENDAFTARAN P
		SET status_lulus = FALSE
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		RETURN new;
	END IF;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;


CREATE TRIGGER UpdateJumlahDiterima() 
AFTER UPDATE
ON  PENDAFTARAN_PRODI
EXECUTE PROCEDURE UpdateJumlahPelamar();