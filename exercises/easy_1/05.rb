# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

def generate_rot13
  rot13_hash = {}

  upcase_first = ('A'..'M').to_a
  upcase_second = ('N'..'Z').to_a
  downcase_first = ('a'..'m').to_a
  downcase_second = ('n'..'z').to_a

  13.times { |idx| rot13_hash[upcase_first[idx]] = upcase_second[idx] }
  13.times { |idx| rot13_hash[upcase_second[idx]] = upcase_first[idx] }
  13.times { |idx| rot13_hash[downcase_first[idx]] = downcase_second[idx] }
  13.times { |idx| rot13_hash[downcase_second[idx]] = downcase_first[idx] }

  rot13_hash
end

def decipher(name_list)
  rot13 = generate_rot13
  name_list.each do |name|
    puts name.split('').map { |chr| rot13[chr].nil? ? chr : rot13[chr] }.join
  end
end

historical_figures = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar',
                      'Nyna Ghevat', 'Puneyrf Onoontr',
                       'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
                       'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba',
                       'Fgrir Wbof', 'Ovyy Tngrf', 'Gvz Orearef-Yrr',
                       'Fgrir Jbmavnx', 'Xbaenq Mhfr', 'Fve Nagbal Ubner',
                       'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb',
                       'Unllvz Fybavzfxv', 'Tregehqr Oynapu']

decipher(historical_figures)
