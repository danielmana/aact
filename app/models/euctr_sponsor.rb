class EuctrSponsor < StudyRelationship
  self.table_name = 'euctr_sponsors'

  def self.get(hash, key)
    val=hash && hash[key]
    return val && val.force_encoding('iso8859-1').encode('utf-8')
  end

  def self.create_all_from(opts)
    nct_id=opts[:nct_id]
    euctr_hash=opts[:euctr_hash]
    if !euctr_hash.nil?
      col=[]
      eudract_id=euctr_hash['a2_eudract_number']
      sponsors=euctr_hash['b1_sponsor']
      sponsors.each{|hash|
        col << new({
          :nct_id => nct_id,
          :eudract_id => eudract_id,
          :b11_name_of_sponsor => get(hash, 'b11_name_of_sponsor'),
          :b134_country => get(hash, 'b134_country'),
          :b31_and_b32_status_of_the_sponsor => get(hash, 'b31_and_b32_status_of_the_sponsor'),
          :b51_name_of_organisation => get(hash, 'b51_name_of_organisation'),
          :b52_functional_name_of_contact_point => get(hash, 'b52_functional_name_of_contact_point'),
          :b531_street_address => get(hash, 'b531_street_address'),
          :b532_town_city => get(hash, 'b532_town_city'),
          :b533_post_code => get(hash, 'b533_post_code'),
          :b534_country => get(hash, 'b534_country'),
          :b54_telephone_number => get(hash, 'b54_telephone_number'),
          :b55_fax_number => get(hash, 'b55_fax_number'),
          :b56_email => get(hash, 'b56_email'),
        })
      }
      import(col)
    end
  end

end
