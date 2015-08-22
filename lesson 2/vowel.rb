# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alph = ('a'..'z')
vowels = {}
alph.each_with_index { |key, index| vowels[key] = index + 1 if ['a', 'e', 'o', 'u','i'].include?(key) }
p vowels
