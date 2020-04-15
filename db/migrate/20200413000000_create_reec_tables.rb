class CreateReecTables < ActiveRecord::Migration

  def change

    create_table "ctgov.reec_studies", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.string  "acronimo"
      t.string  "enfermedad_rara"
    end

    create_table "ctgov.reec_informations", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.string  "locale"
      t.text    "titulo_publico"
      t.text    "titulo_cientifico"
      t.text    "indicacion_publica"
      t.text    "indicacion_cientifica"
      t.text    "criterios_inclusion"
      t.text    "criterios_exclusion"
      t.text    "variables_principales"
      t.text    "variables_secundarias"
      t.text    "objetivo_principal"
      t.text    "objetivo_secundario"
      t.text    "momentos_principales"
      t.text    "momentos_secundarios"
      t.text    "justificacion"
    end

    create_table "ctgov.reec_sponsors", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.string  "promotor"
      t.string  "domicilio"
      t.string  "telefono"
      t.string  "fax"
      t.string  "mail"
      t.string  "persona_contacto"
      t.string  "financiador"
    end

  end

end
