class ReecInformation < StudyRelationship
  self.table_name = 'reec_informations'

  def self.get(hash, key)
    val=hash && hash[key]
    return val && val.force_encoding('iso8859-1').encode('utf-8')
  end

  def self.create_all_from(opts)
    nct_id=opts[:nct_id]
    reec_hash=opts[:reec_hash]
    if !reec_hash.nil?
      eudract_id=reec_hash['identificador']
      hash=reec_hash['informacion']
      col=[]
      col << new({
        :nct_id => nct_id,
        :eudract_id => eudract_id,
        :locale => 'en',
        :titulo_publico => get(hash, 'tituloPublico_en'),
        :titulo_cientifico => get(hash, 'tituloCientifico_en'),
        :indicacion_publica => get(hash, 'indicacionPublica_en'),
        :indicacion_cientifica => get(hash, 'indicacionCientifica_en'),
        :criterios_inclusion => get(hash, 'criteriosInclusion_en'),
        :criterios_exclusion => get(hash, 'criteriosExclusion_en'),
        :variables_principales => get(hash, 'variablesPrincipales_en'),
        :variables_secundarias => get(hash, 'variablesSecundarias_en'),
        :objetivo_principal => get(hash, 'objetivoPrincipal_en'),
        :objetivo_secundario => get(hash, 'objetivoSecundario_en'),
        :momentos_principales => get(hash, 'momentosPrincipales_en'),
        :momentos_secundarios => get(hash, 'momentosSecundarios_en'),
        :justificacion => get(hash, 'justificacion_en'),
      })
      col << new({
        :nct_id => nct_id,
        :eudract_id => eudract_id,
        :locale => 'es',
        :titulo_publico => get(hash, 'tituloPublico'),
        :titulo_cientifico => get(hash, 'tituloCientifico'),
        :indicacion_publica => get(hash, 'indicacionPublica'),
        :indicacion_cientifica => get(hash, 'indicacionCientifica'),
        :criterios_inclusion => get(hash, 'criteriosInclusion'),
        :criterios_exclusion => get(hash, 'criteriosExclusion'),
        :variables_principales => get(hash, 'variablesPrincipales'),
        :variables_secundarias => get(hash, 'variablesSecundarias'),
        :objetivo_principal => get(hash, 'objetivoPrincipal'),
        :objetivo_secundario => get(hash, 'objetivoSecundario'),
        :momentos_principales => get(hash, 'momentosPrincipales'),
        :momentos_secundarios => get(hash, 'momentosSecundarios'),
        :justificacion => get(hash, 'justificacion'),
      })
      import(col)
    end
  end

end
