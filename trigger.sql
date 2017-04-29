CREATE OR REPLACE FUNCTION UpdateJumlahPelamar()
RETURNS "trigger" AS
$$
	BEGIN
	
	IF(TG_OP = 'INSERT')THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN new;
	ELSIF(TG_OP = 'UPDATE')THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar +1
		WHERE new.kode_prodi = PR.kode_prodi and
		 new.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN new;
	ELSIF(TG_OP = 'DELETE')THEN
		UPDATE PENERIMAAN_PRODI PR
		SET jumlah_pelamar = jumlah_pelamar -1
		WHERE old.kode_prodi = PR.kode_prodi and
		 old.id_pendaftaran = PENDAFTARAN.id and
		 PR.tahun_periode = PENDAFTARAN.tahun_periode;
		 RETURN old;
	END IF;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;


CREATE TRIGGER UpdateJumlahPelamar 
AFTER INSERT OR UPDATE OR DELETE
ON  PENDAFTARAN_PRODI
EXECUTE PROCEDURE UpdateJumlahPelamar();